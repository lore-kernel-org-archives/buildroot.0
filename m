From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
Date: Tue, 25 Nov 2014 17:54:20 +0100
Subject: [Buildroot] [PATCH v2] mx53loco_defconfig: switch to VFPv3(d32)
In-Reply-To: <1416931943-3504-1-git-send-email-vincent.stehle@freescale.com>
References: <20141019163952.19c7c080@free-electrons.com>
 <1416931943-3504-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <20141125175420.7b6ff884@e6520eb.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

Le Tue, 25 Nov 2014 17:12:23 +0100,
Vincent Stehl? <vincent.stehle@freescale.com> a ?crit :

> Switch to VFPv3(d32), as i.MX53 Cortex-A8 supports it (MVFR0 = 0x11110222).
> 
> While at it, switch to EABIHF.
> 
unless mistaken, switching to hard float prevent the usage of the AMD
GPU libraries as these binaries are soft float only.

May you please ask inside Freescale to provide AMD GPU libraries
compiled for hard float ? (we don't need support nor warranty, we just
need the binaries compiled for hard float to try if that can work).

Many thanks
Eric
