From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 14:04:13 +0200
Subject: [Buildroot] [PATCH 3/3] New <pkg>-update-last-config-fragment
 target in pkg-kconfig.mk
In-Reply-To: <83afeab5-baf8-122e-15ab-17889c3a300d@mind.be>
References: <20180730155153.24091-1-m.patzlaff@pilz.de>
 <20180730155153.24091-4-m.patzlaff@pilz.de>
 <20180730234643.34315d11@windsurf> <20180731154948.GB8537@scaer>
 <20180814162705.505476fe@windsurf>
 <83afeab5-baf8-122e-15ab-17889c3a300d@mind.be>
Message-ID: <20180815140413.62984968@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Aug 2018 01:20:29 +0200, Arnout Vandecappelle wrote:

> > Marcel, do you think you could rework your patch series to go in the
> > direction of showing a diff rather than arbitrarily adjusting the last
> > fragment ?  
> 
>  Note that the diff really applies to the last fragment only, in the sense that
> if the last fragment is setting CONFIG_BAR, the "is unset" bit has to come after
> it. I don't think there is a way to say anything sensible automatically except
> for the last fragment.

Yes, the diff cannot be blindly applied to anything but the last
fragment. But the idea in showing the diff is not for the user to apply
it blindly, but rather to determine which parts of the diff should be
reflected to each fragment.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
