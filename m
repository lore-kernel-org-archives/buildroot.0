Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3273C7EE22
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 20:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93717615BD;
	Thu, 11 May 2023 20:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93717615BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDglPtscndpT; Thu, 11 May 2023 20:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE1AC61393;
	Thu, 11 May 2023 20:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE1AC61393
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 787061BF283
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D77C70018
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D77C70018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnRtnP_VcUOe for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 20:26:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EED3661374
 for <buildroot@buildroot.org>; Thu, 11 May 2023 20:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EED3661374
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 998D18637D; Thu, 11 May 2023 20:26:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 22:24:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9868d37f5c07a1169e4c408433a57e2529bd3cfe
X-Git-Newrev: 015a9f441903f2d0f20bd5cfa492e888a11074d8
X-Patchwork-Hint: ignore
Message-Id: <20230511202611.998D18637D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xr819-xradio: bump to version
 2023-05-10
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

commit: https://git.buildroot.net/buildroot/commit/?id=015a9f441903f2d0f20bd5cfa492e888a11074d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this patch package builds with Linux up to version 6.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 8676f065f8..1ff36368ec 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  93388424f1f136db541ce056be017f2f0f6688278ac15a88bef34da8f12ffea6  xr819-xradio-119cad7d07aef6973dd44e4dae74d4c9defd06a2.tar.gz
+sha256  e27b6b5fb35ef44a93eb1f5b29bd61c06109e951c8a5ea2cc3e0310663f22001  xr819-xradio-547521df27d1a80fb5542e93fa13bd09fb2259a2.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 66c08e7921..1e4cdb6872 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 119cad7d07aef6973dd44e4dae74d4c9defd06a2
+XR819_XRADIO_VERSION = 547521df27d1a80fb5542e93fa13bd09fb2259a2
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
