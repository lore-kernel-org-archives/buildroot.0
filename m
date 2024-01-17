Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB9EC47DA2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 14:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F8D141FF8;
	Wed, 17 Jan 2024 14:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F8D141FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCqZy1or4WiM; Wed, 17 Jan 2024 14:09:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3476541FE5;
	Wed, 17 Jan 2024 14:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3476541FE5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 034051BF479
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 14:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE76043644
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 14:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE76043644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id igsyc8PHT-cr for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 14:09:10 +0000 (UTC)
X-Greylist: delayed 694 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 17 Jan 2024 14:09:10 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8538C40260
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8538C40260
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 14:09:10 +0000 (UTC)
Feedback-ID: 3578:1022:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1290523682; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 17 Jan 2024 13:57:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 08:57:13 -0500
Message-Id: <20240117135713.36729-1-wdouglass@carnegierobotics.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opencv4: bump to version 4.9.0
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
From: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woodrow Douglass <wdouglass@carnegierobotics.com>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/opencv/opencv/wiki/ChangeLog#version490

Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
---
 package/opencv4-contrib/opencv4-contrib.hash | 2 +-
 package/opencv4-contrib/opencv4-contrib.mk   | 2 +-
 package/opencv4/opencv4.hash                 | 2 +-
 package/opencv4/opencv4.mk                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/opencv4-contrib/opencv4-contrib.hash b/package/opencv4-contrib/opencv4-contrib.hash
index 954a0c2beb..2e20717c76 100644
--- a/package/opencv4-contrib/opencv4-contrib.hash
+++ b/package/opencv4-contrib/opencv4-contrib.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0c082a0b29b3118f2a0a1856b403bb098643af7b994a0080f402a12159a99c6e  opencv4-contrib-4.8.1.tar.gz
+sha256  8952c45a73b75676c522dd574229f563e43c271ae1d5bbbd26f8e2b6bc1a4dae  opencv4-contrib-4.9.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4-contrib/opencv4-contrib.mk
index 52d2682b26..cd44ca37e5 100644
--- a/package/opencv4-contrib/opencv4-contrib.mk
+++ b/package/opencv4-contrib/opencv4-contrib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV4_CONTRIB_VERSION = 4.8.1
+OPENCV4_CONTRIB_VERSION = 4.9.0
 OPENCV4_CONTRIB_SITE = $(call github,opencv,opencv_contrib,$(OPENCV4_CONTRIB_VERSION))
 OPENCV4_CONTRIB_INSTALL_TARGET = FALSE
 OPENCV4_CONTRIB_LICENSE = Apache-2.0
diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
index 2736752633..15f5e37278 100644
--- a/package/opencv4/opencv4.hash
+++ b/package/opencv4/opencv4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  62f650467a60a38794d681ae7e66e3e8cfba38f445e0bf87867e2f2cdc8be9d5  opencv4-4.8.1.tar.gz
+sha256  ddf76f9dffd322c7c3cb1f721d0887f62d747b82059342213138dc190f28bc6c  opencv4-4.9.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 74cec511a9..b535761cb2 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV4_VERSION = 4.8.1
+OPENCV4_VERSION = 4.9.0
 OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
