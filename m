From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 23 Jun 2012 21:34:28 +0200
Subject: [Buildroot] [PATCH] Remove REAL_GNU_TARGET_NAME
In-Reply-To: <1339156336-20778-1-git-send-email-rbraun@sceen.net> (Richard
 Braun's message of "Fri, 8 Jun 2012 13:52:16 +0200")
References: <1339156336-20778-1-git-send-email-rbraun@sceen.net>
Message-ID: <87fw9lddq3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Richard" == Richard Braun <rbraun@sceen.net> writes:

 Richard> Instead of providing two variables, make GNU_TARGET_NAME give
 Richard> the real target name, and remove REAL_GNU_TARGET_NAME
 Richard> altogether.

Committed, thanks.

I have reinstated the host/usr/bin/$arch-linux-* symlinks for the
gcc/gdb binaries though, as people might be using them in local scripts
and so on.

-- 
Bye, Peter Korsgaard
