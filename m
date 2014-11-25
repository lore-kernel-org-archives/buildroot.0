From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Tue, 25 Nov 2014 18:03:25 +0100
Subject: [Buildroot] [PATCH v2] mx53loco_defconfig: switch to VFPv3(d32)
In-Reply-To: <20141125175420.7b6ff884@e6520eb.localdomain>
References: <20141019163952.19c7c080@free-electrons.com>	<1416931943-3504-1-git-send-email-vincent.stehle@freescale.com>
 <20141125175420.7b6ff884@e6520eb.localdomain>
Message-ID: <5474B65D.5010401@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/25/2014 05:54 PM, Eric B?nard wrote:
(switching i.mx53 to hard floats)
> unless mistaken, switching to hard float prevent the usage of the AMD
> GPU libraries as these binaries are soft float only.

You are right of course; silly me :-S

> May you please ask inside Freescale to provide AMD GPU libraries
> compiled for hard float ? (we don't need support nor warranty, we just
> need the binaries compiled for hard float to try if that can work).

Ok, I'll ask. No promise that you will get an answer, though :)

...also I wonder, shall I maybe submit a "v3" of the patch, with no EABIHF?

Best regards,

V.
