From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 May 2021 11:35:04 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/libtomcrypt: compile with
 -fPIC to enable linking to dynamic libraries/exectuables
In-Reply-To: <20210502105038.19483-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 2 May 2021 12:50:38 +0200")
References: <20210502105038.19483-1-ps.report@gmx.net>
 <20210502105038.19483-2-ps.report@gmx.net>
Message-ID: <8735uxzhyv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes:
 >   .../x86_64-buildroot-linux-gnu/bin/ld: .../host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libtomcrypt.a(md5.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - add -fPIC only for non static builds (suggested by Arnout Vandecappelle)

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
