From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Nov 2014 18:30:17 +0100
Subject: [Buildroot] [PATCH v2] mx53loco_defconfig: switch to VFPv3(d32)
In-Reply-To: <5474B65D.5010401@freescale.com>
References: <20141019163952.19c7c080@free-electrons.com>
 <1416931943-3504-1-git-send-email-vincent.stehle@freescale.com>
 <20141125175420.7b6ff884@e6520eb.localdomain>
 <5474B65D.5010401@freescale.com>
Message-ID: <20141125183017.31cb5e67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

On Tue, 25 Nov 2014 18:03:25 +0100, Vincent Stehl? wrote:

> > May you please ask inside Freescale to provide AMD GPU libraries
> > compiled for hard float ? (we don't need support nor warranty, we just
> > need the binaries compiled for hard float to try if that can work).
> 
> Ok, I'll ask. No promise that you will get an answer, though :)
> 
> ...also I wonder, shall I maybe submit a "v3" of the patch, with no EABIHF?

I'd say yes. Is 2.6.35 the latest kernel available for this platform,
or could we switch to a more recent version.

Also, Eric, you mention the AMD GPU libraries, but do we have packages
for those libraries in Buildroot? I know we have the ones for i.MX6,
but what about i.MX53 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
