From: Craig Swank <craigswank@fastmail.fm>
Date: Sun, 27 Dec 2015 05:34:40 -0800
Subject: [Buildroot] trying to use
 https://github.com/beagleboard/linux.git with buildroot
In-Reply-To: <20151227110817.288a2e3f@free-electrons.com>
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
 <20151227110817.288a2e3f@free-electrons.com>
Message-ID: <1451223280.497246.477065626.34AC2AD3@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'd like to help out, but it might take a bit of hand holding for me
since I'm pretty new to buildroot and submitting patches.  I suppose the
things that would need to be changed would be

1. configs/beaglbone_defconfig
2. the uEnv.txt file needs to be different in output/images
3. Chris attached a patch for the host dtc 
4. Two configs for the kernel build need to change

I have a diff for configs/beaglebone_defconfig but everything else I'm
not sure where to start.

If someone has time to coach me through this I'm happy to learn, but if
it is easier for someone else to do this I could learn from that too.  



On Sun, Dec 27, 2015, at 02:08 AM, Thomas Petazzoni wrote:
> Hello all,
> 
> On Sat, 26 Dec 2015 15:44:48 -0800, Craig Swank wrote:
> 
> > YES!  Using Chris's uEnv.txt and u-boot 2015.07 instead of 2015.10 it
> > finally booted up correctly.  Many thanks to Thomas, Chris, and, last
> > but not least, Frank, who swooped in with the secret sauce at the very
> > end.
> > 
> > I'm not even close to being able to figure out why the 07 version worked
> > and 10 did not, but I'm just too happy to care.
> 
> Glad to hear that you solved the different problems.
> 
> Our beaglebone_defconfig is utterly old, and it would be really great
> to update it to use newer kernel and u-boot versions.
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com


-- 
  Craig Swank
  craigswank at fastmail.fm
