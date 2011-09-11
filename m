From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Sep 2011 00:13:02 +0200
Subject: [Buildroot] [PATCH 01/22] Makefile: auto-target automatically
	pass --program-prefix=""
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 (Yann E. MORIN's message of "Wed, 10 Aug 2011 00:12:34 +0200")
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87k49ed8y9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> When cross-compiled, some packages incorrectly prefix their executables
 Yann> with the target tuple.

 Yann> Fix that by forcing the program prefix to the empty string when calling
 Yann> ./configure, but only when compiling for target, not for host.

Committed entire series, thanks!

-- 
Bye, Peter Korsgaard
