From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 00:15:22 +0200
Subject: [Buildroot] [PATCH 3/3] New <pkg>-update-last-config-fragment
 target in pkg-kconfig.mk
In-Reply-To: <20180815202922.GE2556@scaer>
References: <20180730155153.24091-1-m.patzlaff@pilz.de>
 <20180730155153.24091-4-m.patzlaff@pilz.de>
 <20180730234643.34315d11@windsurf> <20180731154948.GB8537@scaer>
 <20180814162705.505476fe@windsurf>
 <83afeab5-baf8-122e-15ab-17889c3a300d@mind.be>
 <20180815140413.62984968@windsurf> <20180815161657.GC2556@scaer>
 <20180815193528.6fc47d7b@windsurf> <20180815202922.GE2556@scaer>
Message-ID: <20180816001522.40f4ff83@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Aug 2018 22:29:22 +0200, Yann E. MORIN wrote:

> > Indeed, this looks very good, and diffconfig is an existing tool.  
> 
> Note that this was the diffconfig tool frm the kernel. The one we have
> behave differently (and badly I think), given the same config files as
> input:
> 
>     $ ./utils/diffconfig linux-config.000 linux-config.001
>     +IG_FOO n
> 
> Which is not nice... :-/

Well, I guess we can import the diffconfig from the kernel, no?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
