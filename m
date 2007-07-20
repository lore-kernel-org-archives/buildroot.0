From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Fri, 20 Jul 2007 09:04:38 -0500
Subject: [Buildroot] [RFC] Support for "distributions" in buildroot
In-Reply-To: <1184934649.6382.10.camel@elrond.sweden.atmel.com>
References: <1184934649.6382.10.camel@elrond.sweden.atmel.com>
Message-ID: <20070720140438.GB29640@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 20, 2007 at 02:30:49PM +0200, Ulf Samuelsson wrote:
> There is an inherent problem in buildroot, that things
> are downloaded from a volatile Internet.
> When packages disappear from Internet,
> the build breaks for new users.
> If we then update the package/<package>/<package>.mk
> without testing too much, this might break someones
> stable build, which is undesirable.
> 
> By introducing "distributions" defined in a separate
> file containing lines like:
> 
Sorry to keep saying "No", but "No". If people want to stay with older
versions, then they should download the source they need and keep it
with their current buildroot system.

-Steve
