Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB73CA0EC1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 09:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1754B6112B;
	Mon, 11 Aug 2025 09:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSBI6wW8wJpY; Mon, 11 Aug 2025 09:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBA0E61252
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBA0E61252;
	Mon, 11 Aug 2025 09:27:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D1551C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6240840291
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWt1k-lfDxmD for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 09:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51C7640182
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51C7640182
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:27:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FAD087374; Mon, 11 Aug 2025 09:27:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 11:18:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 947dbc92a20c5acea7882166cae7893e6ea661e1
X-Git-Newrev: c38ea1d496c69108beff7590adf1c2a521bbfe2b
X-Patchwork-Hint: ignore
Message-Id: <20250811092755.3FAD087374@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update Benetti Engineering URLs to new ones
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

commit: https://git.buildroot.net/buildroot/commit/?id=c38ea1d496c69108beff7590adf1c2a521bbfe2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The company name was changed from "benetti-engineering-sas" to "benetti-engineering"
to be agnostic to the company legal form. Update all GitHub and LinkedIn links
accordingly.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/support.html                                    | 2 +-
 package/rtl8188eu/Config.in                                  | 2 +-
 package/rtl8188eu/rtl8188eu.mk                               | 2 +-
 package/rtl8723bu/Config.in                                  | 2 +-
 package/rtl8723bu/rtl8723bu.mk                               | 2 +-
 package/rtl8723ds/Config.in                                  | 2 +-
 package/rtl8723ds/rtl8723ds.mk                               | 2 +-
 package/rtl8821au/Config.in                                  | 2 +-
 package/rtl8821au/rtl8821au.mk                               | 2 +-
 package/sunxi-mali-utgard-driver/Config.in                   | 2 +-
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 9c44980e67..81f7e863e0 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -139,7 +139,7 @@
 	    <a href="https://www.amarulasolutions.com/services/integrated-system/">
 	      <img src="images/amarula-solutions-logo.png" style="max-width:200px; margin-right:40px;"/>
 	    </a>
-	    <a href="https://www.linkedin.com/company/benetti-engineering-sas">
+	    <a href="https://www.linkedin.com/company/benetti-engineering">
 	      <img src="images/benetti-engineering-logo.png" style="max-width:260px; margin-right:40px;"/>
 	    </a>
 	  </center>
diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
index 5acef3cd32..102e8d7bf7 100644
--- a/package/rtl8188eu/Config.in
+++ b/package/rtl8188eu/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_RTL8188EU
 	help
 	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
 
-	  https://github.com/benetti-engineering-sas/rtl8188eu
+	  https://github.com/benetti-engineering/rtl8188eu
 
 comment "rtl8188eu needs a Linux kernel to be built"
 	depends on !BR2_s390x
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 1ad9452f82..6161ffd5d6 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTL8188EU_VERSION = 702a90b02edca722cc0d139260ba02c23f406333
-RTL8188EU_SITE = $(call github,benetti-engineering-sas,rtl8188eu,$(RTL8188EU_VERSION))
+RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
 RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
diff --git a/package/rtl8723bu/Config.in b/package/rtl8723bu/Config.in
index 70d597d23e..2f2f96dfe5 100644
--- a/package/rtl8723bu/Config.in
+++ b/package/rtl8723bu/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_RTL8723BU
 	help
 	  rtl8723bu wifi driver
 
-	  https://github.com/benetti-engineering-sas/rtl8723bu
+	  https://github.com/benetti-engineering/rtl8723bu
 
 comment "rtl8723bu needs a Linux kernel to be built"
 	depends on !BR2_s390x
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 05447ecef9..d9719a2cad 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTL8723BU_VERSION = 523cb38e4c62bb181d6b95024884e938835cf8cf
-RTL8723BU_SITE = $(call github,benetti-engineering-sas,rtl8723bu,$(RTL8723BU_VERSION))
+RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
 RTL8723BU_MODULE_MAKE_OPTS = \
diff --git a/package/rtl8723ds/Config.in b/package/rtl8723ds/Config.in
index 0921a55d37..018e70489d 100644
--- a/package/rtl8723ds/Config.in
+++ b/package/rtl8723ds/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_RTL8723DS
 	help
 	  rtl8723bs wifi driver
 
-	  https://github.com/benetti-engineering-sas/rtl8723ds
+	  https://github.com/benetti-engineering/rtl8723ds
 
 comment "rtl8723ds needs a Linux kernel to be built"
 	depends on !BR2_s390x
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index f1b345d548..67104fd5d7 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTL8723DS_VERSION = 97d714fdbfc562f71f2e72e5ce6cceb8e2a8be8a
-RTL8723DS_SITE = $(call github,benetti-engineering-sas,rtl8723ds,$(RTL8723DS_VERSION))
+RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
 
diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
index 66e7334148..24ea9b8c7d 100644
--- a/package/rtl8821au/Config.in
+++ b/package/rtl8821au/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_RTL8821AU
 	help
 	  rtl8821au wifi driver
 
-	  https://github.com/benetti-engineering-sas/rtl8821au
+	  https://github.com/benetti-engineering/rtl8821au
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 9ecbbbb0b2..aa900839f5 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTL8821AU_VERSION = d0a49ba401a8661ef0cdc4cf8850bc7c927a062c
-RTL8821AU_SITE = $(call github,benetti-engineering-sas,rtl8821au,$(RTL8821AU_VERSION))
+RTL8821AU_SITE = $(call github,benetti-engineering,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
 
diff --git a/package/sunxi-mali-utgard-driver/Config.in b/package/sunxi-mali-utgard-driver/Config.in
index ba4d1919ce..22f93d0a0e 100644
--- a/package/sunxi-mali-utgard-driver/Config.in
+++ b/package/sunxi-mali-utgard-driver/Config.in
@@ -36,4 +36,4 @@ config BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER
 	    since the driver requires at least double buffering and
 	    fails to work with the default value(100).
 
-	  https://github.com/giuliobenetti/sunxi-mali/blob/master/README.md
+	  https://github.com/benetti-engineering/sunxi-mali/blob/master/README.md
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index ea3bc258a6..38946aa1e4 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUNXI_MALI_UTGARD_DRIVER_VERSION = b47f74c92fbcbdf175a16052d1b0ce8345efc6b2
-SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,benetti-engineering-sas,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
+SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,benetti-engineering,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
 SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
 SUNXI_MALI_UTGARD_DRIVER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
