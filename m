From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 22:31:32 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
	arc-2016.09-eng008
In-Reply-To: <1470857474.3428.41.camel@synopsys.com>
References: <1470849040-9200-1-git-send-email-vzakhar@synopsys.com>
 <20160810212736.6a814ad9@free-electrons.com>
 <1470857474.3428.41.camel@synopsys.com>
Message-ID: <20160810223132.29fd6aff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 19:32:57 +0000, Alexey Brodkin wrote:

> > Beware that using GCC 6 is causing to cause a number of issues related
> > to GCC 6 itself and not to ARC. We already have one GCC 6 toolchain for
> > ARM, and we have a number of build failures caused by this toolchain
> > due to the use of GCC 6.  
> 
> That bump will for sure introduce new breakages while fixing some we already
> know about. But we had to make that bold movement at some point because that
> make us use almost upstream GCC with very few off-the-tree patches for ARC.

Sure, makes sense.

> And indeed our goal is to find and fix as many issues as we can in that new
> toolchain. So we'll continue to monitor BR autobuilder failures on daily basis.

So this means we'll get more help from you guys to fix GCC 6 related
issues ? :-)

> As usual it would be good to rebuild BR pre-built tools for ARC out of this
> commit so we have better coverage in running build jobs.

Sure. As soon as I merge the commit, I'll re-spin the pre-built ARC
toolchain(s).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
