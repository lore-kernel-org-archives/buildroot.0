Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49396CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D03A61785;
	Thu, 21 Aug 2025 19:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVAD0KIYEpSg; Thu, 21 Aug 2025 19:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A5861BE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07A5861BE3;
	Thu, 21 Aug 2025 19:21:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76D391C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53D7740D75
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nqd9vTjc0JIO for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 447E140D21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 447E140D21
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35F8887106; Thu, 21 Aug 2025 19:20:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 16:35:00 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: a91ff57b489990dbd96dc1a7b8909fd43165c543
X-Git-Newrev: 47369efd0bedf699c81d0981a1e799ed8502d073
X-Patchwork-Hint: ignore
Message-Id: <20250821192021.35F8887106@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/gst1-python: bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=47369efd0bedf699c81d0981a1e799ed8502d073
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fbc7d7b7fff4b76cdafe4a46769e5f278ad825f7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gstreamer1/gst1-python/gst1-python.hash | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index 44bf778fd7..917ec1e6dc 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.11.tar.xz.sha256sum
-sha256  f4c8761bfee98508f57e2efd738ef36a99e2f7644860877d54d235a7092cf056  gst-python-1.24.11.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.13.tar.xz.sha256sum
+sha256  abb9a1edc11d67a463b6cef7b74a8b10ea6c342760c012d597102a7bfb7e09da  gst-python-1.24.13.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 18e03d4b06..87120fbc74 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.24.11
+GST1_PYTHON_VERSION = 1.24.13
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
