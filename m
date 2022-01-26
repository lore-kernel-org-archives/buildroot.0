Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7A7C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BF92417F5;
	Wed, 26 Jan 2022 21:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZ48D1PTSjwm; Wed, 26 Jan 2022 21:45:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7EF3417F1;
	Wed, 26 Jan 2022 21:45:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2111BF4D6
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B69D60FF1
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2K8qP60cHETg for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:45:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F232F60FEF
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:45:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 00C9940003;
 Wed, 26 Jan 2022 21:45:15 +0000 (UTC)
Date: Wed, 26 Jan 2022 22:45:15 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220126224515.125150ef@windsurf>
In-Reply-To: <20220124140230.1697395-1-aperez@igalia.com>
References: <20220124140230.1697395-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.34.4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 24 Jan 2022 16:02:30 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a minor release which provides fixes for CVE-2021-30934,
> CVE-2021-30936, CVE-2021-30951, CVE-2021-30952, CVE-2021-30953,
> CVE-2021-30954, CVE-2021-30984, and the safarileaks.com vulnerability
> (which has not yet been assigned a CVE number). Release notes can be
> found at:
> 
>   https://wpewebkit.org/release/wpewebkit-2.34.4.html
> 
> An accompanying security advisory has been published at:
> 
>   https://wpewebkit.org/security/WSA-2022-0001.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpewebkit/wpewebkit.hash | 8 ++++----
>  package/wpewebkit/wpewebkit.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
