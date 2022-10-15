Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FD1C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 14:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCB9781B04;
	Sat, 15 Oct 2022 14:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCB9781B04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VpBkYRK4roWj; Sat, 15 Oct 2022 14:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20CD581465;
	Sat, 15 Oct 2022 14:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20CD581465
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B99EF1BF962
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 14:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95B3A405F6
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 14:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95B3A405F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMG8e3ieaxC4 for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 14:34:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCFF9405EF
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 14:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCFF9405EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9DE386BF8; Sat, 15 Oct 2022 14:34:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 16:32:59 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 5db6d5f143b989495b54c0b5fb751fa355c0c300
X-Git-Newrev: 886f8df73158eaf71e55c9a10be7dec1f912419d
X-Patchwork-Hint: ignore
Message-Id: <20221015143434.A9DE386BF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/volk: license
 list is comma-separated
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=886f8df73158eaf71e55c9a10be7dec1f912419d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ebc9beaa6af0bc27da8b9def4da758ac1bfbbf70)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/volk/volk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/volk/volk.mk b/package/volk/volk.mk
index 038b85ee86..ef18b69b3b 100644
--- a/package/volk/volk.mk
+++ b/package/volk/volk.mk
@@ -9,7 +9,7 @@ VOLK_SITE = https://github.com/gnuradio/volk/releases/download/v$(VOLK_VERSION)
 VOLK_SOURCE = volk-$(VOLK_VERSION).tar.xz
 # See https://github.com/gnuradio/volk/tree/v2.5.1#license for some
 # details on the licensing.
-VOLK_LICENSE = GPL-3.0+ LGPL-3.0+
+VOLK_LICENSE = GPL-3.0+, LGPL-3.0+
 VOLK_LICENSE_FILES = COPYING COPYING-LGPL
 
 VOLK_SUPPORTS_IN_SOURCE_BUILD = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
