From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Mar 2018 15:04:18 +0100
Subject: [Buildroot] Board defconfigs lacking maintainers
In-Reply-To: <CAAEAJfB-D3FFVrWdxkb2ENciYj=YpP4qSKwxd1NDLzgfFTrLnA@mail.gmail.com>
References: <20180304231547.7ed3f5af@windsurf.home>
 <20180305120722.GD7096@momiji>
 <20180305133713.0232b1b3@windsurf.home>
 <CAAEAJfB-D3FFVrWdxkb2ENciYj=YpP4qSKwxd1NDLzgfFTrLnA@mail.gmail.com>
Message-ID: <20180307150418.4b19ba57@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Mar 2018 10:41:37 -0300, Ezequiel Garcia wrote:

> >> One if my work colleagues has a ci20 around which I *think* he has been using
> >> mostly with Buildroot as the base system. I'll get to him and see whether it
> >> may be possible for one of us to adopt this one.  
> >
> > Great! This defconfig was initially contributed by Vicente Olivert
> > Riera, but he has left Imagination Technologies, so he is no longer
> > working on Buildroot or MIPS.
> >  
> 
> Should nobody adopt Ci20, I will. I'm working on it as pet project.

Please submit a patch to the DEVELOPERS file then :-)

The ci20_defconfig build is currently broken, due to MIPS gcc flags
issues. A patch has been submitted, but we haven't merged it yet.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
