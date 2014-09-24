From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Wed, 24 Sep 2014 14:38:35 +0200
Subject: [Buildroot] [PATCH 2/2] freescale/imx6-sabresd: use up-to-date
	mainline Linux
In-Reply-To: <1411560193-9697-3-git-send-email-luca@lucaceresoli.net>
References: <1411560193-9697-1-git-send-email-luca@lucaceresoli.net>
 <1411560193-9697-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <5422BB4B.7050703@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/24/2014 02:03 PM, Luca Ceresoli wrote:
> Move to mainline Linux and upgrade the kernel version to the same version
> used for the toolchain kernel headers.

Hi Luca,

I am not sure if abandoning the Freescale release kernel is the best
option for i.MX6. Indeed, if you want e.g. proper video
(package/freescale-imx/imx-vpu) and 3D
(package/freescale-imx/gpu-viv-bin-mx6q) support to still work as
expected you need to stay with the 3.10.17.

Wouldn't you prefer to align the headers instead?

Best regards,

V.
