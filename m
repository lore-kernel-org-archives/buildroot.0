From: =?big5?B?pKSt7CCxaQ==?= <tnndclub@yahoo.com.tw>
Date: Wed, 7 Oct 2009 17:21:45 +0800 (CST)
Subject: [Buildroot] relocation R_MIPS_HI16 against `_gp' can not be used
	when making a shared object; recompile with -fPIC
Message-ID: <689310.86704.qm@web73402.mail.tp2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am using the MIPS cross toolchain built from buildroot-200908 release.

I choose gcc-4.3.4, binutils-2.19.1, uClibc-0.9.30.1 and linux-2.6.29 in the menuconfig.
The toolchain is generated very well.

After trying to use the toolchain to compile a package, I encounter the following error at link time.
mips-linux-ld:
init_mips.o: relocation R_MIPS_HI16 against `_gp' can not be used when
making a shared object; recompile with -fPIC
init_mips.o: could not read symbols: Bad value

Does any one know how to solve this problem?

This
package could be compiled and linked well by using the toolchain
generated from buildroot-200807 release with gcc-4.2.4, binutils-2.18,
uClibc-0.9.29 and linux-2.6.24.


___________________________________________________ 
 ??????? ? ???????????????? 
 http://messenger.yahoo.com.tw/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091007/ed5e756c/attachment.htm>
