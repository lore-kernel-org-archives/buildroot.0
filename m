From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Mar 2012 13:48:45 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh: add recursivity when
	scanning patchdir
In-Reply-To: <1332336387-3434-2-git-send-email-ludovic.desroches@atmel.com>
 (ludovic desroches's message of "Wed, 21 Mar 2012 14:26:27 +0100")
References: <87k42e5nt8.fsf@macbook.be.48ers.dk>
 <1332336387-3434-1-git-send-email-ludovic.desroches@atmel.com>
 <1332336387-3434-2-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <87ty1i3ys2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ludovic" == ludovic desroches <ludovic.desroches@atmel.com> writes:

 ludovic> From: Ludovic Desroches <ludovic.desroches@atmel.com>
 ludovic> Recursivity is needed with some tarballs containing debian patches:
 ludovic> .
 ludovic>   debian
 ludovic>     changelog
 ludovic>     control
 ludovic>     patches
 ludovic>       02-COPYRIGHT.patch
 ludovic> [...]

Committed, thanks!

-- 
Bye, Peter Korsgaard
