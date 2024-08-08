Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448DBC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 19:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9730140D0F;
	Thu,  8 Aug 2024 19:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6DKvXmjnhyP; Thu,  8 Aug 2024 19:40:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 891C540D6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 891C540D6B;
	Thu,  8 Aug 2024 19:39:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7238C1BF2A3
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BBC540E78
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OE56pmdfI5S0 for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 19:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 455F840E83
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 455F840E83
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 19:39:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33002848BF; Thu,  8 Aug 2024 19:39:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Aug 2024 19:13:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbd1dce67dd2deacaea726dd3380cc348c602cfc
X-Git-Newrev: 0b771887ca01a076b9169c1ac880e523c5fe6f44
X-Patchwork-Hint: ignore
Message-Id: <20240808193950.33002848BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-pi: bump version to
 37bd9773c1938e5f76208bc4e8632fdbbb4190ff
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b771887ca01a076b9169c1ac880e523c5fe6f44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flutter-pi/flutter-pi.hash | 2 +-
 package/flutter-pi/flutter-pi.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index 135a0deb32..6a73524745 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a7ce5c8d960735923f6897dd9852b89c8010a01b9a29f4f6bbbf7c016dac623c  flutter-pi-783db32ec6441b878783bfa241777d3bfe6b35e2-git4.tar.gz
+sha256  c3c7df5712cd7c45539b325b0d8d58d0942b08a6f66c55e3f53aa5225cbe86af  flutter-pi-37bd9773c1938e5f76208bc4e8632fdbbb4190ff-git4.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index ee54a2bf4e..fad1da3215 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = 783db32ec6441b878783bfa241777d3bfe6b35e2
+FLUTTER_PI_VERSION = 37bd9773c1938e5f76208bc4e8632fdbbb4190ff
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
@@ -33,7 +33,8 @@ FLUTTER_PI_CONF_OPTS = \
 	-DTRY_ENABLE_VULKAN=OFF \
 	-DVULKAN_DEBUG="OFF" \
 	-DUSE_LEGACY_KMS=OFF \
-	-DWARN_MISSING_FIELD_INITIALIZERS=OFF
+	-DWARN_MISSING_FIELD_INITIALIZERS=OFF \
+	-DBUILD_SENTRY_PLUGIN=OFF
 
 ifeq ($(BR2_ENABLE_LTO),y)
 FLUTTER_PI_CONF_OPTS += -DLTO=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
