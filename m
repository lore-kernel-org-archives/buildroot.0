From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 14:52:24 +0100
Subject: [Buildroot] [PATCH] m68k: add special gcc flag to avoid ICE for
 coldfire
In-Reply-To: <20161126085144.GA23223@waldemar-brodkorb.de>
References: <20161126085144.GA23223@waldemar-brodkorb.de>
Message-ID: <20161126145224.2aa5ef33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Nov 2016 09:51:44 +0100, Waldemar Brodkorb wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/d47fa41aa860d82471b83ac90967d3a3dacd8611
>   http://autobuild.buildroot.net/results/a21de4747f40a5ce93108c8979fbc0277d040e79
> 
> Requires this as prerequisite:
> http://patchwork.ozlabs.org/patch/683830/

Hum, thanks but this patch you're pointing to is really material for
next at this point, so I cannot apply your patch, which should be
applied on master in order to fix the autobuilder issues.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
