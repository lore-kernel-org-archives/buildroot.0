From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Feb 2020 16:22:23 +0100
Subject: [Buildroot] [PATCH v2] package/libnspr: remove
 BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
In-Reply-To: <b1fbe4c2-03eb-9c45-484d-043a2f7b60b4@mind.be>
References: <20200204095059.7315-1-giulio.benetti@benettiengineering.com>
 <20200204110416.074754d8@windsurf>
 <b1fbe4c2-03eb-9c45-484d-043a2f7b60b4@mind.be>
Message-ID: <20200204162223.50db5e36@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 4 Feb 2020 15:36:01 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> > Arnout and I both agreed that we want to keep this blind option, so I'm
> > not sure I understand why you're sending this patch. Did we miss something?  
> 
>  Actually, Giulio replied that in the other thread (but it should be part of the
> commit log here, maybe): adding architecture support is trivial (just a matter
> of defining the right sizes), so we should never need to re-add this option.
> Just fix libnspr.

Yes, it is true that the architecture support in libnspr is trivial.
Though we lived for quite some time without it for some CPU
architectures :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
