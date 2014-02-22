From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Feb 2014 00:05:32 +0100
Subject: [Buildroot] [PATCH] binutils: install libiberty
In-Reply-To: <1393108410-9568-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 22 Feb 2014 23:33:30 +0100")
References: <1393108410-9568-1-git-send-email-arnout@mind.be>
Message-ID: <877g8mrbnn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Some packages (actually, just oprofile) need to link against libiberty.
 > This option just installs libiberty.a so it has no effect on the target,
 > therefore it's not needed to add a config option for it.

 > Before binutils-2.24, there was a bug in libiberty/Makefile.in that
 > caused libiberty to be installed regardless of the
 > --enable-install-libiberty option. This problem wasn't noticed before
 > because binutils-2.24 is not selected on any of the autobuilders: the
 > version can only be selected if an internal toolchain is used, and it
 > defaults to 2.21.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
