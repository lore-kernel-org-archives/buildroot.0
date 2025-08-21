Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671DDCA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E6A961BD8;
	Thu, 21 Aug 2025 18:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QlBIi8LDHI9y; Thu, 21 Aug 2025 18:58:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D626861BB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D626861BB4;
	Thu, 21 Aug 2025 18:58:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F1111C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21021616BC
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wb5TNeF16aR4 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50E77616DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50E77616DB
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D05C8106C; Thu, 21 Aug 2025 18:57:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 16:31:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b39c86294c4d4c196be20d8a2c6d95946d716f51
X-Git-Newrev: 67d996cde333ebf4c48ac0a2191a28d8b5b30bd3
X-Patchwork-Hint: ignore
Message-Id: <20250821185719.4D05C8106C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gst1-vaapi: bump
 to version 1.24.13
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=67d996cde333ebf4c48ac0a2191a28d8b5b30bd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b60aa70d4c50e2d210812cf9ef16dd1bd39741b8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index d53a962150..b01ff938af 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.24.11.tar.xz.sha256sum
-sha256  e85904a47d9ecb41d7f76b1d3fe887fa18c0b81a3793e7d7f61361ea7e90420d  gstreamer-vaapi-1.24.11.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.24.13.tar.xz.sha256sum
+sha256  b92c008841387043aec83b08b1fa8cf41e7866a106311a7d99e274e7d24ddc47  gstreamer-vaapi-1.24.13.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 1bd3dbf12e..418369c38e 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.24.11
+GST1_VAAPI_VERSION = 1.24.13
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
