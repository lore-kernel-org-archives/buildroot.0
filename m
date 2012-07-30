From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 23:58:30 +0200
Subject: [Buildroot] [PATCH] sysprof: New package.
In-Reply-To: <CAFbHwiTWnB+EtB=Du5bkAa7mtKfJ7nHeyWGshpq7Rcvjf9O__g@mail.gmail.com>
References: <CAFbHwiTWnB+EtB=Du5bkAa7mtKfJ7nHeyWGshpq7Rcvjf9O__g@mail.gmail.com>
Message-ID: <20120730235830.27770869@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 27 Jul 2012 16:26:23 +0100,
Will Newton <will.newton@gmail.com> a ?crit :

> Signed-off-by: Will Newton <will.newton@imgtec.com>

Applied, thanks. I did some changes to the package, though:

     - add dependencies on the supported architectures to avoid build
       failures on ARM and other unsupported arches
     - add a patch that removes an useless warning about the kernel
       version. This patch is present upstream. However since it
       modifies configure.ac, we need to autoreconf the package.
     - change AUTOTARGETS to autotools-package

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
