From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Jun 2019 10:44:34 +0200
Subject: [Buildroot] [PATCH v2 2/3] autobuild-run: initial
 implementation of do_reproducible_build()
In-Reply-To: <e4f040d2-1b8c-73a1-9142-eb4dac4a3570@mind.be>
References: <20190607064657.3571-1-itsatharva@gmail.com>
 <20190607064657.3571-2-itsatharva@gmail.com>
 <20190607103338.0431cf9e@windsurf>
 <e4f040d2-1b8c-73a1-9142-eb4dac4a3570@mind.be>
Message-ID: <20190607104434.7ba3712d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 7 Jun 2019 10:39:40 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Exactly.
> 
>  Though the solution with a different output path is probably even simpler, in
> the end.
> 
>  The issue, though, is that it requires a bit of refactoring of the
> autobuild-run code, so it takes a bit of time to develop and even more time to
> review. On the other hand, we want to start running reproducibility tests as
> soon as possible, so we can get some results from the autobuilders and have an
> idea of how bad it is.

Makes sense.

>  Therefore, we've chosen to resubmit the patches with the same output dir and
> hope that they can be applied quickly. Hint, hint :-)

Hehe :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
