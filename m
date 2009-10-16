From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 Oct 2009 09:49:26 +0200
Subject: [Buildroot] relocation R_MIPS_HI16 against `_gp' can not be
	used when making a shared object; recompile with -fPIC
In-Reply-To: <689310.86704.qm@web73402.mail.tp2.yahoo.com> (=?utf-8?B?Ig==?=
	=?utf-8?B?5Lit5Y6fIOW8tS4iJ3M=?= message of "Wed\, 7 Oct 2009 17\:21\:45
	+0800 \(CST\)")
References: <689310.86704.qm@web73402.mail.tp2.yahoo.com>
Message-ID: <878wfb22yh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "??" == ?? ? <tnndclub@yahoo.com.tw> writes:

Hi,

 ??> After trying to use the toolchain to compile a package, I
 ??> encounter the following error at link time.  mips-linux-ld:
 ??> init_mips.o: relocation R_MIPS_HI16 against `_gp' can not be used
 ??> when making a shared object; recompile with -fPIC init_mips.o:
 ??> could not read symbols: Bad value

 ??> Does any one know how to solve this problem?

What package is this?

 ??> This package could be compiled and linked well by using the
 ??> toolchain generated from buildroot-200807 release with gcc-4.2.4,
 ??> binutils-2.18, uClibc-0.9.29 and

200807 release? We didn't have a release called that. Do you mean a svn
snapshot from that day?

-- 
Bye, Peter Korsgaard
