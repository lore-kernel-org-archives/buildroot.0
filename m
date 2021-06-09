From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Jun 2021 23:16:55 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/gdb: fix gdbserver build with m68k and uclibc
In-Reply-To: <20210527055729.407660-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 27 May 2021 07:57:29 +0200")
References: <20210527055729.407660-1-fontaine.fabrice@gmail.com>
Message-ID: <87sg1qn3g8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Allow to build gdbserver with m68k and uclibc. This patch is not needed
 > for version above 9.2 because build_gdbserver as been
 > moved to its own file since
 > https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=919adfe8409211c726c1d05b47ca59890ee648f1

 > This new file (gdbserver/configure.srv) does not seem to be affected by
 > this issue

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f4d6d9d8418c0da48a3db4ad5a82e19bd16eae34

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Peter Korsgaard):
 >  - Handle m68*-*-uclinux* like m68*-*-linux*

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
