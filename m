Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DF3C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E59B40948;
	Tue,  2 Jan 2024 20:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E59B40948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mvLQ35WR9zvy; Tue,  2 Jan 2024 20:23:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 556F240A62;
	Tue,  2 Jan 2024 20:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 556F240A62
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F26D1BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC13160FA6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC13160FA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pgsMzKgICJQI for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:23:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 371B360F93
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 371B360F93
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2162783CD0; Tue,  2 Jan 2024 20:23:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:20:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0aa56a81641862a3613d679bc662bc62cfc6b1e4
X-Git-Newrev: 1a287945306b8617e144dfb31f4dc4c5af21b256
X-Patchwork-Hint: ignore
Message-Id: <20240102202305.2162783CD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hidapi: bump to version 0.14.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1a287945306b8617e144dfb31f4dc4c5af21b256
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/libusb/hidapi/releases/tag/hidapi-0.14.0
https://github.com/libusb/hidapi/releases/tag/hidapi-0.13.1
https://github.com/libusb/hidapi/releases/tag/hidapi-0.13.0
https://github.com/libusb/hidapi/releases/tag/hidapi-0.12.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hidapi/hidapi.hash | 2 +-
 package/hidapi/hidapi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hidapi/hidapi.hash b/package/hidapi/hidapi.hash
index 95046386a7..cc2d13214d 100644
--- a/package/hidapi/hidapi.hash
+++ b/package/hidapi/hidapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  391d8e52f2d6a5cf76e2b0c079cfefe25497ba1d4659131297081fc0cd744632  hidapi-0.11.0.tar.gz
+sha256  a5714234abe6e1f53647dd8cba7d69f65f71c558b7896ed218864ffcf405bcbd  hidapi-0.14.0.tar.gz
 sha256  7d3b087c34f35d4d538e3bcddd1ff8f66e92f9ef336881999482800ddf840913  LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-gpl3.txt
 sha256  30eb1bef29b46f8ba7ab8b416035dbd93cb034a45481dd97815b944284582cd2  LICENSE-bsd.txt
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index 9341f0186c..9f5c0a3df2 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIDAPI_VERSION = 0.11.0
+HIDAPI_VERSION = 0.14.0
 HIDAPI_SITE = $(call github,libusb,hidapi,hidapi-$(HIDAPI_VERSION))
 HIDAPI_INSTALL_STAGING = YES
 # No configure provided, so we need to autoreconf.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
