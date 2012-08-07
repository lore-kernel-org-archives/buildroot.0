From: Scott Moore <scott.moore@sri.com>
Date: Tue, 07 Aug 2012 11:13:10 -0700
Subject: [Buildroot] Known good x86-64 host/target configuration with dev
	tools?
Message-ID: <50215AB6.3050800@sri.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've been trying for some time to build a chroot jail for compiling code 
against uclibc on a x86_64 platform without worrying about contamination 
from the system glibc, etc. To do this, I've been trying to use 
buildroot with development files on the target and gcc/make/etc packages 
enabled. I keep running into problems with the resulting target 
toolchain, though. With NPTL support on, all executables compiled by my 
target gcc segfault. With linuxthreads instead, I still encounter what 
appear to be mis-compiles (though could be bugs in the code I'm compiling).

Since I'm not confident in my configuration, I was wondering if anyone 
has a known good buildroot/uClibc configuration that targets x86_64 with 
a target toolchain with C++ support.

Thanks,
Scott
