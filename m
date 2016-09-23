From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 07:47:10 +0200
Subject: [Buildroot] [PATCH 1/1] configs: new defconfig for TI am335x-evm
In-Reply-To: <f297e95d-443c-06e1-3430-4ab4a752e964@gmail.com>
References: <1471261882-5640-1-git-send-email-lothar.felten@gmail.com>
 <20160918193045.15a33be3@free-electrons.com>
 <87fuotya3r.fsf@dell.be.48ers.dk>
 <20160921105303.1832ad5e@free-electrons.com>
 <87bmzhy6ci.fsf@dell.be.48ers.dk>
 <20160921121803.487035d8@free-electrons.com>
 <877fa5y1y2.fsf@dell.be.48ers.dk>
 <20160921140912.29c4584e@free-electrons.com>
 <f297e95d-443c-06e1-3430-4ab4a752e964@gmail.com>
Message-ID: <20160923074710.4c8b372b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 00:21:42 +0200, Lothar Felten wrote:

> I changed the patches, they now update the current beaglebone, the 
> defconfigs will be: beaglebone_defconfig and beaglebone_qt_defconfig.
> The readme.txt lists the supported targets.

Sounds good.

> > Do you still have those early AM335x EVM boards? Are they widespread?
> > I'm wondering if it really makes sense to have this patch.  
> 
> I've only use two EVMs and they both have the issue, I'm not sure that 
> it ever got fixed. Any board will run in 1 bit mode, but some evms won't 
> run in 4 bit mode, so I think that's a safe choice. Anyway, it applies 
> to the uboot only.

OK, let's keep this then. What worries me is that the kind of patch
that has never any chance of being removed from Buildroot. I would have
preferred a solution that could potentially be accepted upstream.

> > Does this really work for the BeagleBone, which uses ttyO2 if I
> > remember correctly? Maybe another reason to have a defconfig that
> > supports just the am335x_evm.  
> 
> The beaglebone (ttyO0 on USB) beagleboneblack (ttyO0 on pinheader) and 
> the evm (sub d 9 pin) all use ttyO0

OK, my bad. I was probably confusing with the beagleboard where I think
it was the third serial port (ttyO2). So everything is fine.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
