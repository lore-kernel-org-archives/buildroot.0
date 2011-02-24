From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Wed, 23 Feb 2011 20:05:32 -0700
Subject: [Buildroot] Saving custom configs to buildroot, linux, uclibc,
 ...
In-Reply-To: <AANLkTinK3Y2T8_Bd9_ikamAMCN1iUVx241RObVV_0uZ5@mail.gmail.com>
References: <AANLkTimThq-otAmyU+UYWs6EHg6zfjXqv669OzrpE=Xd@mail.gmail.com>
	<AANLkTinK3Y2T8_Bd9_ikamAMCN1iUVx241RObVV_0uZ5@mail.gmail.com>
Message-ID: <1298516732.2712.85.camel@galileo.graphics-muse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2011-02-21 at 21:28 +0100, Daniel Nystr?m wrote:
> Not sure I fully understood your circumstances, but any progress
> making Buildroot a bit more product-centric would get my thumbs-up.

I think, for product orientation, Buildroot makes an excellent tool
wrapped inside a higher level metabuild.  I just responded to the
original poster about my project, BeagleBox, which does just that.  It
makes more sense to me to use generalized tools in specific ways by
wrapping them in higher layer builds.  This is essentially what the
OpenEmbedded, Angstrom, Poky and related projects are about.  However,
they also try to support a very wide range of products which I think
makes them harder to grasp up front (for new developers).  But that's
just IMHO and made without extensive experience with those tools.

> In my use-case I will be building the complete firmware for a couple
> of products using Buildroot, and my dream scenario would be "make
> myproductname" to use any custom configs (br, bb, uclibc, kernel) for
> that product.

BeagleBox essentially does that for a single board.  But it wouldn't be
hard to wrap additional products on top of it. There is already a a
"BOARD" setting though its use is limited to u-boot at the moment and
I'm pretty sure I wrapped a BOARD usage in with the kernel at work (but
we're not using it now that the prototype board has been dropped in
favor of the production board) for a PowerPC project.  

> Not sure how to get there myself yet, but I would support any work on it.

I could always use help with BeagleBox.  :-)

-- 
Michael J. Hammel <buildroot@graphics-muse.org>
