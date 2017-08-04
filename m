From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Aug 2017 16:41:45 +0200
Subject: [Buildroot] Howto handle fork of an existing package
In-Reply-To: <6947b9e4-bf6e-ace7-c8c9-e440a494e225@gmail.com>
References: <6947b9e4-bf6e-ace7-c8c9-e440a494e225@gmail.com>
Message-ID: <20170804164145.21595c6d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Aug 2017 14:21:26 +0200, Atilla Filiz wrote:

> I have made a package of Wiring Pi for Lemaker boards Banana Pi and 
> Banana Pro. Since this is a fork from an older version, the site, teh 
> versioning, the patches etc are all different. I would like to ask, 
> whoat would be the best way to merge this package properly. Either
> 
> 1. Make it a completely new package, like wiringpi-lemaker and make it 
> depend on !BR2_PACKAGE_WIRINGPI and vice versa. Easiest way.
> 
> 2. Turn wiringpi into a subtree, with a radio button for board 
> selection: Raspberry Pi, Banana Pi, Banana Pro and enable teh proper 
> package. Raspberry Pi being the default option. Slightly intrusive way.
> 
> 3. Have one wiringpi to rule them all. Make the board selection as a 
> mere set of parameters. Make a bit more complicated wirinpi.mk that 
> selects correct site, version, patch directory etc depending on a bunch 
> of defined flags. Possibly unnecessarily complicated.

4. Contribute to the official wiringpi project instead of doing a fork,
so that a single project supports multiple platforms.

I think I have a preference for option (4). If not possible, option (3)
will be acceptable, but not as nice :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
