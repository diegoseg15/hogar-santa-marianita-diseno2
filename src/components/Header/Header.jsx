import React, { useState } from "react";
import { Link } from "react-router-dom";
import Logo from "../../assets/images/logo.png";
import { MenuMobile } from "./MenuMobile/MenuMobile";

export function Header() {
  const pathname = window.location.pathname;
  const [openMMobile, setOpenMMobile] = useState(false);

  const openMenuMobile = (event) => {
    event.preventDefault();
    setOpenMMobile(true);
  };

  return (
    <>
      <MenuMobile open={openMMobile} setOpen={setOpenMMobile} />
      <nav className="bg-primero">
        <div className="flex flex-wrap justify-between mx-auto py-4 pl-2">
          <Link to="/" className="flex items-start">
            <img
              src={Logo}
              className="h-32 w-auto mr-3"
              alt="Logo del Hogar Santa Marianita"
            />
            <h1 className="self-center lg:text-4xl text-xl font-extrabold text-black">
              Hogar Santa Marianita
              <h5 className="-mr-10 text-end lg:text-base text-xl font-semibold text-black">
                Fundación sin fin de lucro
              </h5>
            </h1>
          </Link>
          <div className="flex md:order-2 md:hidden items-center ">
            <button
              data-collapse-toggle="navbar-cta"
              type="button"
              className="p-2 h-12 text-sm text-white md:hidden bg-cuarto hover:bg-septimo focus:outline-none focus:ring-2 focus:ring-gray-200"
              aria-controls="navbar-cta"
              aria-expanded="false"
              onClick={(event) => openMenuMobile(event)}
            >
              <span className="sr-only">main menu</span>
              <svg
                className="w-6 h-6"
                aria-hidden="true"
                fill="currentColor"
                viewBox="0 0 20 20"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fill-rule="evenodd"
                  d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                  clip-rule="evenodd"
                ></path>
              </svg>
            </button>
          </div>
          <div className="items-end hidden md:flex md:w-auto md:order-1 pb-5">
            <ul className="flex bg-white text-black font-medium md:p-0 mt-10 border flex-row md:mt-0 md:border-0 dark:border-gray-700">
              <li>
                <Link
                  to="/"
                  className={`${
                    pathname === "/" ? "text-white bg-black" : "bg-transparent"
                  } hover:text-secondary block py-3 px-8 hover:bg-black hover:text-white`}
                  aria-current="page"
                >
                  Inicio
                </Link>
              </li>
              <li>
                <Link
                  to="/quienes-somos"
                  className={`${
                    pathname === "/quienes-somos"
                      ? "text-white bg-black"
                      : "bg-transparent"
                  } hover:text-secondary block py-3 px-8 hover:bg-black hover:text-white`}
                >
                  ¿Quienes Somos?
                </Link>
              </li>
              <li>
                <Link
                  to="/involucrate"
                  className={`${
                    pathname === "/involucrate"
                      ? "text-white bg-black"
                      : "bg-transparent"
                  } hover:text-secondary block py-3 px-8 hover:bg-black hover:text-white`}
                >
                  Involúcrate
                </Link>
              </li>
              <li>
                <Link
                  to="/contactanos"
                  className={`${
                    pathname === "/contactanos"
                      ? "text-white bg-black"
                      : "bg-transparent"
                  } hover:text-secondary block py-3 px-8 hover:bg-black hover:text-white`}
                >
                  Contáctanos
                </Link>
              </li>
              <li>
                <Link
                  to="/blog"
                  className={`${
                    window.location.pathname.includes("/blog")
                      ? "text-white bg-black"
                      : "bg-transparent"
                  } hover:text-secondary block py-3 px-8 hover:bg-black hover:text-white`}
                >
                  Blog
                </Link>
              </li>
            </ul>
            {/* <div
              className={`${
                pathname === "/" || pathname === "/donar" ? "hidden" : ""
              } ml-20`}
            >
              <a
                href="/donar"
                type="button"
                className="text-tertiary bg-primary hover:bg-secondary focus:ring-4 focus:outline-none focus:ring-secondary rounded-lg text-base px-4 py-2 text-center"
              >
                Donar ahora
              </a>
            </div> */}
          </div>
        </div>
      </nav>
    </>
  );
}
