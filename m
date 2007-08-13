From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Mon, 13 Aug 2007 20:45:22 +0200 (CEST)
Subject: [Buildroot] .Position of ".PHONY" directive
In-Reply-To: <1186964471.25003.2.camel@elrond.sweden.atmel.com>
References: <1186964471.25003.2.camel@elrond.sweden.atmel.com>
Message-ID: <0708132043540.31104@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Aug 2007, Ulf Samuelsson wrote:

> The "make" info says that ".PHONY" should precede its arguments,
> but it most, if not all Makefiles, they are at the bottom.
>
> When I do "make -d" for debug, it looks like the PHONY targets
> are continously recalculated.
>
> Should we move the .PHONY statements?

Me thinks that is a good idea.


Cheers,

-- 
Cristian
