Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E685AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:44:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF5560F38
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EF5560F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E48E606B3;
	Sun, 14 Nov 2021 14:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pmJqU1NZx5ae; Sun, 14 Nov 2021 14:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3E2C606A8;
	Sun, 14 Nov 2021 14:44:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86F831BF20B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81A7480DB1
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xEdCY8YK17k for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:44:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1BE980D5D
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:44:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 60F1B8D2F3; Sun, 14 Nov 2021 14:40:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:43:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 425a1e9f2013fee5a39531268326ba8b861d5af4
X-Git-Newrev: d191854b0e1049f052fb48155736c57cadb7003b
X-Patchwork-Hint: ignore
Message-Id: <20211114144017.60F1B8D2F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/kodi-audiodecoder-modplug: bump version to 19.0.1-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=d191854b0e1049f052fb48155736c57cadb7003b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash | 2 +-
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index f3736c192c..7bab017241 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ff3cb9816a30530d522f6a9a23eb49eb5301fb7880f402de6fc1dea31d3469f6  kodi-audiodecoder-modplug-19.0.0-Matrix.tar.gz
+sha256  4c422cacf456ab9eda5e2836d2789c3756bfbae03265a01647dd8f935261d9ec  kodi-audiodecoder-modplug-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index ce5619e8c7..9b2cf98dbc 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 19.0.0-Matrix
+KODI_AUDIODECODER_MODPLUG_VERSION = 19.0.1-Matrix
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,xbmc,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
