From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Dec 2015 15:40:08 +0100
Subject: [Buildroot] [PATCH] package/pixman: disable tests
In-Reply-To: <1449316134-27852-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 5 Dec 2015 12:48:54 +0100")
References: <1449316134-27852-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87wpst6jsn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Tests are broken on some architectures because of an incomplete fenv.
 > Since the tests are not really useful in the Buildroot environment, just
 > disable them.

 > Fixes a lot of build failures:
 >     http://autobuild.buildroot.org/results/cd7/cd722620832c28d22eacfc43336f6952b82305ff/
 >     http://autobuild.buildroot.org/results/3f4/3f4f1e88988d66b052432885b4f044a0eddcee2c/
 >     ...

 > Pixman was already autoreconfed (but that was not needed). Since we now
 > really need to autoreconf it, add a comment stating why we do.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

> +---
> +Status: Buildroot specific, not suitable for upstream in this state.

Indeed. It would be good to work on an upstreamable solution
(E.G. probably a --disable-tests option) and send it upstream.

-- 
Bye, Peter Korsgaard
