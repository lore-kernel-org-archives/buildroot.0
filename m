From: Jorge Ventura <jorge.araujo.ventura@gmail.com>
Date: Fri, 29 Jul 2016 14:11:34 -0500
Subject: [Buildroot] Kernel compilation failure for 'allmodconfig'
Message-ID: <20160729191134.GA6566@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am trying to use buildroot-2016.05 to build a livecd. The kernel
configuration I am trying to use is:

$ make ARCH=i386 allmodconfig

Unfortunatelly the process does not complete because I get the
error bellow:

Makefile:950: recipe for target 'drivers' failed
make[1]: *** [drivers] Error 2
make[1]: Leaving directory
'/home/ventura/rem-livecd/buildroot-2016.05/output/build/linux-4.5.4'
package/pkg-generic.mk:195: recipe for target
'/home/ventura/rem-livecd/buildroot-2016.05/output/build/linux-4.5.4/.stamp_built'
failed
make: ***
[/home/ventura/rem-livecd/buildroot-2016.05/output/build/linux-4.5.4/.stamp_built]
Error 2

I am using the option:

Kernel configuration (Using a custom (def)config file)  --->
($(TOPDIR)/../kernel-livecd.config) Configuration file path

Ventura
