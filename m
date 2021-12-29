Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E57C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4411D40183;
	Wed, 29 Dec 2021 09:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIYsz_a3kqyn; Wed, 29 Dec 2021 09:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 309FA4013F;
	Wed, 29 Dec 2021 09:19:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B4551BF4E7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A2C660AC3
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNNKb3grEDPo for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:19:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B88160808
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:19:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 33A2D240006;
 Wed, 29 Dec 2021 09:19:18 +0000 (UTC)
Date: Wed, 29 Dec 2021 10:19:17 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Eugen Hristev via buildroot <buildroot@buildroot.org>
Message-ID: <20211229101917.6067827f@windsurf>
In-Reply-To: <20211229074147.38135-1-eugen.hristev@microchip.com>
References: <20211229074147.38135-1-eugen.hristev@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/microchip,
 atmel: bump at91bootstrap to 4.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eugen Hristev <eugen.hristev@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 29 Dec 2021 09:41:47 +0200
Eugen Hristev via buildroot <buildroot@buildroot.org> wrote:

> Bump the AT91BOOTSTRAP bootloader package to new released version 4.0.1
> for all the supported boards (SAMA boards + SAM9X60).
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig       | 2 +-
>  configs/atmel_sama5d2_xplained_mmc_defconfig           | 2 +-
>  configs/atmel_sama5d2_xplained_mmc_dev_defconfig       | 2 +-
>  configs/atmel_sama5d3_xplained_defconfig               | 2 +-
>  configs/atmel_sama5d3_xplained_dev_defconfig           | 2 +-
>  configs/atmel_sama5d3_xplained_mmc_defconfig           | 2 +-
>  configs/atmel_sama5d3_xplained_mmc_dev_defconfig       | 2 +-
>  configs/atmel_sama5d4_xplained_defconfig               | 2 +-
>  configs/atmel_sama5d4_xplained_dev_defconfig           | 2 +-
>  configs/atmel_sama5d4_xplained_mmc_defconfig           | 2 +-
>  configs/atmel_sama5d4_xplained_mmc_dev_defconfig       | 2 +-
>  configs/microchip_sam9x60ek_mmc_defconfig              | 2 +-
>  configs/microchip_sam9x60ek_mmc_dev_defconfig          | 2 +-
>  configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig     | 2 +-
>  configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 2 +-
>  configs/microchip_sama5d2_icp_mmc_defconfig            | 2 +-
>  configs/microchip_sama5d2_icp_mmc_dev_defconfig        | 2 +-
>  configs/microchip_sama7g5ek_mmc_defconfig              | 2 +-
>  configs/microchip_sama7g5ek_mmc_dev_defconfig          | 2 +-
>  19 files changed, 19 insertions(+), 19 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
