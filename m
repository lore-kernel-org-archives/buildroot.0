From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 11:08:17 +0100
Subject: [Buildroot] trying to use
 https://github.com/beagleboard/linux.git with buildroot
In-Reply-To: <1451173488.3993354.476829962.2D827969@webmail.messagingengine.com>
References: <1450890296.2355509.475056490.71128E4E@webmail.messagingengine.com>
 <20151223184751.12365336@free-electrons.com>
 <1450893821.3034067.475093450.34890777@webmail.messagingengine.com>
 <1450894505.3036056.475106194.467AC874@webmail.messagingengine.com>
 <20151223193943.21a6f0fc@free-electrons.com>
 <1450910736.3752716.475291418.490BB3EA@webmail.messagingengine.com>
 <20151223235253.0afe702e@free-electrons.com>
 <1450917779.3775953.475348978.37FAC3A8@webmail.messagingengine.com>
 <n5mdi8$5go$1@ger.gmane.org>
 <1451154853.3394517.476716010.48669FA1@webmail.messagingengine.com>
 <CA+-urNRO0DWv7Xw+DctiFspDootbJRwbwdE66UYMbfCjL8jWuQ@mail.gmail.com>
 <1451173488.3993354.476829962.2D827969@webmail.messagingengine.com>
Message-ID: <20151227110817.288a2e3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Sat, 26 Dec 2015 15:44:48 -0800, Craig Swank wrote:

> YES!  Using Chris's uEnv.txt and u-boot 2015.07 instead of 2015.10 it
> finally booted up correctly.  Many thanks to Thomas, Chris, and, last
> but not least, Frank, who swooped in with the secret sauce at the very
> end.
> 
> I'm not even close to being able to figure out why the 07 version worked
> and 10 did not, but I'm just too happy to care.

Glad to hear that you solved the different problems.

Our beaglebone_defconfig is utterly old, and it would be really great
to update it to use newer kernel and u-boot versions.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
