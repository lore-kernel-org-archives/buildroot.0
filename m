From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 21:02:19 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-17
In-Reply-To: <1471628924.31233.27.camel@synopsys.com>
References: <20160818063027.302C6102F5A@stock.ovh.net>
 <20160818231053.37c1b26b@free-electrons.com>
 <1471628924.31233.27.camel@synopsys.com>
Message-ID: <20160819210219.7bdf6383@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 17:48:45 +0000, Vlad Zakharov wrote:

> Seems like all these failures happens due to the same toolchain issue our team working at. We will send a patch when the
> problem is solved. We hope it will happen soon =)

Ok, great, thanks!

> Also I send two patches that fixes another issues:
> 1)?https://patchwork.ozlabs.org/patch/660918/
> This patch fixes binutils failure:
> > ? ? ? ? ?arc |????binutils-arc-2016.09-eng008 | NOK | http://autobuild.buildroot.net/results/00455b6a8324920ad843d90ce
> > 0413451522691a8/  
> 
> 2)?https://patchwork.ozlabs.org/patch/660917/
> And this one is for Qt4:
> http://autobuild.buildroot.net/results/541/54172d55f39b2fcfa5b7fb4d4ee01566678babbc//

Yes, seen them. I'll have a look shortly.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
