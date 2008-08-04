From: Richard <mr.resistor@gmail.com>
Date: Mon, 4 Aug 2008 11:28:14 +0100
Subject: [Buildroot] problem with kernel 2.6.26 and VFP
Message-ID: <ea6597e70808040328s6a5d41eeyd26295990b9a04f3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hey

i am having no luck compiling a 2.6.26 kernel with GCC 4.2.4, keep
failing with the following error:

/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ld:
ERROR: arch/arm/vfp/entry.o uses VFP instructions, whereas
arch/arm/vfp/vfp.o does not

i have left the busybox and uclibc settings as default, and the
processor is an ARM926T. does anyone know how i can resolve this?
