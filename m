From: Richard Braun <rbraun@sceen.net>
Date: Wed, 14 Nov 2012 16:28:24 +0100
Subject: [Buildroot] How to build Kernel 2.6.x
In-Reply-To: <20121114162456.01d6258b@skate>
References: <k7vnmj$27j$1@ger.gmane.org> <20121114153158.5de351df@skate>
 <201211141547.42502.yann.morin.1998@free.fr>
 <CAAsE_ucA-Gag0v-9g4AObY=yB4DZH7AEuvA3zkwGEvUPv5JgWA@mail.gmail.com>
 <20121114160302.50eb8ca8@skate>
 <CAAsE_ueNA-H3u2EHg0vMpEURR+u4+z8COmY-cY4ATyo_xpr1DA@mail.gmail.com>
 <20121114162456.01d6258b@skate>
Message-ID: <20121114152824.GA15406@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 14, 2012 at 04:24:56PM +0100, Thomas Petazzoni wrote:
> > The one reason I feel hestitate to use 3.6 is
> > that I am not sure 3.6 will results in a zImage too large thant that I
> > could got with 2.6.  Do you have an experience in this? Thanks.
> 
> Depends on what configuration options you enable in the kernel, and how
> small your zImage needs to be. Most likely on a S3C2410 based platform
> you have enough flash space to handle a reasonably sized zImage.

Not to mention the improvements regarding kernel compression.

-- 
Richard Braun
