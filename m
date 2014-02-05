From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Feb 2014 23:58:50 +0100
Subject: [Buildroot] [PATCH 1/1] dependencies.sh: stop stray a.out being
	created for ia32 compiler test
In-Reply-To: <1391551823-1216-1-git-send-email-martin@barkynet.com> (Martin
 Bark's message of "Tue, 4 Feb 2014 22:10:23 +0000")
References: <1391551823-1216-1-git-send-email-martin@barkynet.com>
Message-ID: <87zjm5yxn9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > If the grub package is selected it also selects
 > BR2_HOSTARCH_NEEDS_IA32_COMPILER.  This triggers a test in dependencies.sh
 > to verify the host compiler can build 32 bit executables.  Currently this
 > test does not set any output for the compiler which causes a stray a.out
 > to be create outside the output directory.  This patch sets the compiler
 > output to /dev/null so no a.out is created but the test is still performed.

 > Signed-off-by: Martin Bark <martin@barkynet.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
