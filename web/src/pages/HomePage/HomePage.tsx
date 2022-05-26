/* This example requires Tailwind CSS v2.0+ */
// import { Fragment } from 'react'
// import { Popover, Transition } from '@headlessui/react'
// import { MenuIcon, XIcon } from '@heroicons/react'
// import { Link, routes } from '@redwoodjs/router'
//import { MetaTags } from '@redwoodjs/web'

const navigation = [
  { name: 'Product', href: '#' },
  { name: 'Features', href: '#' },
  { name: 'Marketplace', href: '#' },
  { name: 'Company', href: '#' },
]

const HomePage = () => {
  return (
    <div className="relative bg-gray-50 overflow-hidden">
      <div
        className="hidden sm:block sm:absolute sm:inset-y-0 sm:h-full sm:w-full"
        aria-hidden="true"
      >
        </div>
        <div className="bg-white">
      <div className="max-w-7xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:px-8">
        <div className="text-center">
          <p className="mt-1 text-4xl font-extrabold text-gray-900 sm:text-5xl sm:tracking-tight lg:text-6xl">
            Pancakes or Waffles?
          </p>
          <p className="max-w-xl mt-5 mx-auto text-xl text-gray-500">
            Start a new session for free.
          </p>
        </div>
      </div>
    </div>
        </div>
  )
}
export default HomePage
