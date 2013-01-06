From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jan 2013 21:17:56 +0100
Subject: [Buildroot] [PATCH] pacakge/tvheadend: fix failures due to
	-Werror
In-Reply-To: <1357425633-11040-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 5 Jan 2013 23:40:33 +0100")
References: <1357425633-11040-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87r4lyf4ln.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> (Partially) apply upstream patch 1334869bf0ea668e58e1c72daa3c09c1a95b5d81
 Yann> to properly protect code-paths depending on execinfo.h (for backtrace(3)).

 Yann> Fixes:
 Yann>     http://autobuild.buildroot.net/results/fe25485bde8894daff5bdf806eb4bb2fa776dc55/

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Cc: Peter Korsgaard <jacmet@uclibc.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
