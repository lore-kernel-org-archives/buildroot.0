From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 14:42:24 +0200
Subject: [Buildroot] [PATCH 5/8] package/mender: add
 BR2_PACKAGE_MENDER_DEVICE_TYPE option
In-Reply-To: <CADHdJwA+gYRAc5r1PGaE4ubaudUhJh5cmQeuaAgAWACPV-oAZQ@mail.gmail.com>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-6-mirza.krak@northern.tech>
 <20180815135507.6c321a4a@windsurf>
 <CADHdJwA+gYRAc5r1PGaE4ubaudUhJh5cmQeuaAgAWACPV-oAZQ@mail.gmail.com>
Message-ID: <20180815144224.49d967a7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Aug 2018 14:26:46 +0200, Mirza Krak wrote:

> > I am a bit confused with "Note that /data is a mount point for the
> > persistent data partition". If /data is a different partition than the
> > root filesystem one, then what is the point of
> > having /data/mender/device_type in the root filesystem ? It will be
> > hidden by whatever partition gets mounted in /data.  
> 
> Understand the confusion, my intention was to convert the /data
> directory on target image to an ext4 image in a post build step

Why do you want to do this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
