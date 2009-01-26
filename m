From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 26 Jan 2009 20:03:54 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcgicc
In-Reply-To: <87myde6pj8.fsf@macbook.be.48ers.dk>
References: <20090121002712.88E7B77099@busybox.osuosl.org>
	<874oztuqjg.fsf@macbook.be.48ers.dk>
	<87myde6pj8.fsf@macbook.be.48ers.dk>
Message-ID: <1232996634.2298.98.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-26 klockan 16:43 +0100 skrev Peter Korsgaard:
> >>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
> 
>  ulf> Log:
>  ulf> add patch form cgicc'upstream, build now completes\!
> 
>  ulf> +When built with gcc-4.3.2, cgicc-3.2.7 cannot be compiled any more; sort
>  ulf> +is now being part of <algorithm> and must be written as ::sort:
>  ulf> +
>  ulf> +cardgame.cpp:1232: error: 'sort' was not declared in this scope
>  ulf> +make[2]: *** [cardgame.o] Error 1
>  ulf> +
>  ulf> +Fix it.
>  ulf> +
>  ulf> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
>  ulf> +
>  ulf> +---
>  ulf> + demo/cardgame.cpp |    3 ++-
>  ulf> + 1 file changed, 2 insertions(+), 1 deletion(-)
> 
>  Peter> Why are we building demos in the first place?
> 
> Ping?

Feel free to remove them.
BR
Ulf Samuelsson
