From: zhuzhenhua <zzh.hust@gmail.com>
Date: Mon, 22 Oct 2007 11:24:05 +0800
Subject: [Buildroot] libstdc++.so: undefined reference to `__towupper_l'
Message-ID: <50c9a2250710212024j7d459361obd241a1025fcf8ac@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello, all:

i have try to build a mips-linux toolchain by buildroot
with follow packages:
            buildroot-20070804.tar.bz2,  gcc-3.4.4.tar.gz,
binutils-2.15.tar.gz   uClibc-0.9.29.tar.bz2

after build, i use my toolchain to compile qte, and got message as
follow(error messages):

and i find the same question on maillist
http://www.busybox.net/lists/uclibc/2006-April/015141.html
but  the answer
"either disable XLOCALE (locales) or apply the 203* patch from
gcc-4.2.0(haven't looked if 203* is complete for
gcc-3.4.x though)"
does not work.
is there any other way to resolve it ?
thanks for any hints!

zzh





----error messages--------------------------
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__towupper_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtold_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strftime_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__nl_langinfo_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__newlocale'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__freelocale'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcsxfrm_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__iswctype_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__towlower_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtod_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__uselocale'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strcoll_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wctype_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strxfrm_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcsftime_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__strtof_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__wcscoll_l'
/usr/local/actions_lsdk_devtools/mipsel-linux-uclibc-cygwin/bin/../lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libstdc++.so:
undefined reference to `__duplocale'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071022/81002004/attachment.htm 
