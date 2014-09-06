From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Sep 2014 23:43:42 +0200
Subject: [Buildroot] [PATCH] package/monit: do not forcibly build a
	static binary
In-Reply-To: <1409917481-14205-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 5 Sep 2014 13:44:41 +0200")
References: <1409917481-14205-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87vbp0l90x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Static linking with glibc is not really supported, because of the NSS
 > libraries that are still to be dynamically-loaded at runtime.

 > Also, Buildroot explicitly does not support statically linking with
 > glibc.

 > Reported-by: Peter K?mmel <syntheticpp@gmx.net>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
