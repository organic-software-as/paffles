FROM gitpod/workspace-full:latest

# Dazzle does not rebuild a layer until one of its lines are changed. Increase this counter to rebuild this layer.
ENV TRIGGER_REBUILD=2
ENV PGWORKSPACE="/workspace/.pgsql"
ENV PGDATA="$PGWORKSPACE/data"

# Install PostgreSQL
RUN sudo install-packages postgresql-12 postgresql-contrib-12

# Setup PostgreSQL server for user gitpod
ENV PATH="/usr/lib/postgresql/12/bin:$PATH"

SHELL ["/usr/bin/bash", "-c"]
RUN PGDATA="${PGDATA//\/workspace/$HOME}" \
 && mkdir -p ~/.pg_ctl/bin ~/.pg_ctl/sockets $PGDATA \
 && initdb -D $PGDATA \
 && printf '#!/bin/bash\npg_ctl -D $PGDATA -l ~/.pg_ctl/log -o "-k ~/.pg_ctl/sockets" start\n' > ~/.pg_ctl/bin/pg_start \
 && printf '#!/bin/bash\npg_ctl -D $PGDATA -l ~/.pg_ctl/log -o "-k ~/.pg_ctl/sockets" stop\n' > ~/.pg_ctl/bin/pg_stop \
 && chmod +x ~/.pg_ctl/bin/* \
 && printf '%s\n' '# Auto-start PostgreSQL server' \
                  "test ! -e \$PGWORKSPACE && mkdir -p /workspace && test -e ${PGDATA%/data} && mv ${PGDATA%/data} /workspace" \
                  # Making the /workspace dir just to make sure it doesnt fail in docker env in case
                  '[[ $(pg_ctl status | grep PID) ]] || pg_start > /dev/null' > ~/.bashrc.d/200-postgresql-launch
ENV PATH="$HOME/.pg_ctl/bin:$PATH"
ENV PGHOSTADDR="127.0.0.1"
ENV PGDATABASE="postgres"

USER gitpod
