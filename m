From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 May 2021 17:45:44 +0200
Subject: [Buildroot] [PATCH 1/2] package/jh71xx-tools: new package
In-Reply-To: <20210515121534.GF2506@scaer>
References: <20210514220316.1942381-1-thomas.petazzoni@bootlin.com>
 <20210514220316.1942381-2-thomas.petazzoni@bootlin.com>
 <20210515121534.GF2506@scaer>
Message-ID: <20210518174544.2a48bcf5@windsurf.orange-hotspot>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 May 2021 14:15:34 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +	source "package/jh71xx-tools/Config.in.host"  
> 
> Alphabetical order fixed, as spotted by Bin.

Thanks! It is interesting that this was not spotted by check-package.

> > +JH71XX_TOOLS_VERSION = 7a29f4b9d2355aa39afa8680680909bb74e4991d
> > +JH71XX_TOOLS_SITE = $(call github,kprasadvnsi,JH71xx-tools,$(JH71XX_TOOLS_VERSION))
> > +JH71XX_TOOLS_LICENSE = MIT
> > +JH71XX_TOOLS_LICENSE_FILES = jh7100-recover.c  
> 
> Not sure why you choose to use the source file as license file, when
> there is an actual LICENSE file in the tree. So I've switched to using
> that.

I'm not sure how I missed that, because I remember I looked at the code
base and thought "meh, there is no license file, I should file a github
issue about this". Anyway, you fixed it, so thanks for that!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
