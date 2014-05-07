From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 May 2014 17:48:27 +0200
Subject: [Buildroot] CMake requires ncurses
In-Reply-To: <CAHXCMMJOQc=pO=X+C7ruNAGm44wYv3nJEUjKo=+=sNF7+kbzTA@mail.gmail.com>
References: <CAHkwnC-kaMHjsD9GjPiDLdx5vda2CKAnDVXPX-qAUx+r01MCAQ@mail.gmail.com>
 <20140507164753.48c13d65@free-electrons.com>
 <CAHkwnC_7GBG+a4oh1aLSc7QeaEsC-N0qROcaNuGSE+Wp0=z34g@mail.gmail.com>
 <CAHXCMMJOQc=pO=X+C7ruNAGm44wYv3nJEUjKo=+=sNF7+kbzTA@mail.gmail.com>
Message-ID: <20140507174827.2f0bb635@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed, 7 May 2014 17:45:34 +0200, Samuel Martin wrote:

> After checking cmake source, it seems ncurses is a dependency of
> ccmake program (the CMake curses interface).
> 
> Its build can be disabled by adding -DBUILD_CursesDialog=OFF to the
> configure command line.
> 
> @Fabio: care to test this and cook a patch if it works as expected?

Are there other parts of CMake that we can disable the build for? For
example CTest and CPack? CMake is quite long to build, so anything we
can remove from its build that isn't necessary to build other packages
is welcome.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
