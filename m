Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9034C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 821514F259;
	Fri, 28 Feb 2025 16:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJNX5vUZ9Rjs; Fri, 28 Feb 2025 16:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD3F4F25A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD3F4F25A;
	Fri, 28 Feb 2025 16:36:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19FE1711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CBC5424AE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akcRrY6ta1WF for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D48AA41A1C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D48AA41A1C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE97F844AB; Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Dec 2024 23:34:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 900bf91d104d412853ccc6970cad752c3d217699
X-Git-Newrev: 0c6b8c989fcca8d057f7598f28eff377a018ed2f
X-Patchwork-Hint: ignore
Message-Id: <20250228162935.CE97F844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wilc-firmware: fix
 'acceptable' typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c6b8c989fcca8d057f7598f28eff377a018ed2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wilc-firmware/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wilc-firmware/Config.in b/package/wilc-firmware/Config.in
index 72a9c73206..813a75ecf2 100644
--- a/package/wilc-firmware/Config.in
+++ b/package/wilc-firmware/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_WILC1000_FIRMWARE
 
 	  These binary blobs are provided directly from Microchip.
 	  Ideally, the firmware version should match driver version.
-	  Generally, the latest firmware would be acceptible regardless
+	  Generally, the latest firmware would be acceptable regardless
 	  of driver version.
 
 	  These will be installed to /lib/firmware/mchp/
@@ -26,7 +26,7 @@ config BR2_PACKAGE_WILC3000_FIRMWARE
 
 	  These binary blobs are provided directly from Microchip.
 	  Ideally, the firmware version should match driver version.
-	  Generally, the latest firmware would be acceptible regardless
+	  Generally, the latest firmware would be acceptable regardless
 	  of driver version.
 
 	  These will be installed to /lib/firmware/mchp/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
