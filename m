From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 16:43:55 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcgicc
In-Reply-To: <874oztuqjg.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Wed\, 21 Jan 2009 07\:22\:27 +0100")
References: <20090121002712.88E7B77099@busybox.osuosl.org>
	<874oztuqjg.fsf@macbook.be.48ers.dk>
Message-ID: <87myde6pj8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 ulf> Log:
 ulf> add patch form cgicc'upstream, build now completes\!

 ulf> +When built with gcc-4.3.2, cgicc-3.2.7 cannot be compiled any more; sort
 ulf> +is now being part of <algorithm> and must be written as ::sort:
 ulf> +
 ulf> +cardgame.cpp:1232: error: 'sort' was not declared in this scope
 ulf> +make[2]: *** [cardgame.o] Error 1
 ulf> +
 ulf> +Fix it.
 ulf> +
 ulf> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
 ulf> +
 ulf> +---
 ulf> + demo/cardgame.cpp |    3 ++-
 ulf> + 1 file changed, 2 insertions(+), 1 deletion(-)

 Peter> Why are we building demos in the first place?

Ping?

-- 
Bye, Peter Korsgaard
