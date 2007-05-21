From: Stuart Wood <stuart.wood@labxtechnologies.com>
Date: Mon, 21 May 2007 09:53:39 -0400
Subject: [Buildroot] configure: error: zlib.h was not found
Message-ID: <003801c79baf$6f87a090$7100a8c0@SDW>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I can't seem to get rid of this error. It's being generated from the
configure 
file for libid3tag-0.15.1b. The host system has the zlib installed, but this

looks like its for the target? 

Buildroot is set up as:
Target Architecture (arm)
Target Architecture Variant (arm920t)
Target ABI (OABI)
Toolchain type (Build toolchain)
Toolchain Options
????????Kernel Headers (Linux 2.6.20)
????????uClibc C library Version (uClibc 0.9.29)
????????Binutils Version (2.17)
????????GCC compiler Version (4.1.2)
Package Selection
????????BusyBox Version (1.5.0)
????????Audio Libraries and Applications
????????????????[*] madplay
????????????????[*] mpg123

Any thoughts on what I'm doing wrong? Or is this a bug?

checking for assert.h... yes
checking for unistd.h... (cached) yes
checking zlib.h usability... no
checking zlib.h presence... no
checking for zlib.h... no
SDW no
configure: error: zlib.h was not found
*** You must first install zlib (libz) before you can build this package.
*** If zlib is already installed, you may need to use the CPPFLAGS
*** environment variable to specify its installed location, e.g. -I<dir>.
make: *** 
[/home/stuart/ArmLinux/buildroot/build_arm/libid3tag-0.15.1b/.configured] 
Error 1

-- 
Sincerely, 

Stuart Wood
Lab X Technologies,LLC
176 Anderson Ave., Suite 302
Rochester, NY 14607
