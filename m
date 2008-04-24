From: Li Liang <li.liang@neomeridian.com>
Date: Thu, 24 Apr 2008 13:51:05 +1000
Subject: [Buildroot] Error:
	gcc-4.2.3/gcc/config/arm/lib1funcs.asm:1000:undefined
	reference to 'raise'
Message-ID: <1209009065.481003a919dc5@www.server101.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was trying to compile the kernel for arm, and then the error message
encountered :

/home/ll/work/MFSP/uCroot/buildroot/toolchain_build_arm/gcc-4.2.3/gcc/config/arm/lib1funcs.asm:1000:
undefined reference to `raise'
make[5]: *** [lib] Error 1
make[5]: Leaving directory `/home/ll/work/MFSP/snapgear/uClibc/ldso/ldso'
make[4]: *** [all] Error 2
make[4]: Leaving directory `/home/ll/work/MFSP/snapgear/uClibc/ldso'
make[3]: *** [_dir_ldso] Error 2

A google search leads me to:

http://buildroot.uclibc.org/lists/buildroot/2006-October/000362.html

Unfortunately, I couldn't download the mentioned patch from the SVN due to
authentication is required. So anyone can help me out? Thank you.

~LL
