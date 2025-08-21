Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B80CA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5381E845EF;
	Thu, 21 Aug 2025 18:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcHq5scPVvqU; Thu, 21 Aug 2025 18:57:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E7C9845EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E7C9845EE;
	Thu, 21 Aug 2025 18:57:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9C3F1C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB061407C0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRBgaO-8_dq3 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:56:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEF5E40CB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEF5E40CB1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:56:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 908A68760D; Thu, 21 Aug 2025 18:56:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:33:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 678c631c5e5b8ca3d6b50ef55b16274516fdff8b
X-Git-Newrev: f8d4073c2137f944fd33d56a3131588c62e51804
X-Patchwork-Hint: ignore
Message-Id: <20250821185658.908A68760D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Update Benetti
 Engineering URLs to new ones
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8d4073c2137f944fd33d56a3131588c62e51804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The company name was changed from "benetti-engineering-sas" to "benetti-engineering"
to be agnostic to the company legal form. Update all GitHub and LinkedIn links
accordingly.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c38ea1d496c69108beff7590adf1c2a521bbfe2b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/support.html                                    | 3 +++
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
 11 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 21c6e0a34e..81f7e863e0 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -139,6 +139,9 @@
 	    <a href="https://www.amarulasolutions.com/services/integrated-system/">
 	      <img src="images/amarula-solutions-logo.png" style="max-width:200px; margin-right:40px;"/>
 	    </a>
+	    <a href="https://www.linkedin.com/company/benetti-engineering">
+	      <img src="images/benetti-engineering-logo.png" style="max-width:260px; margin-right:40px;"/>
+	    </a>
 	  </center>
 	</div>
       </div>
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
index 98ee757425..9c60929d62 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTL8188EU_VERSION = f42fc9c45d2086c415dce70d3018031b54a7beef
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
index 6b9580643d..dbf99a866a 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTL8723BU_VERSION = af3a408d6399655b0db23c2c8720436ca725ca47
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
index e35364aa67..0fb20962e4 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTL8723DS_VERSION = 52e593e8c889b68ba58bd51cbdbcad7fe71362e4
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
index 875079703f..5d08c685fa 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTL8821AU_VERSION = 8ea0ed9da764448c7310a27744ab5814289f35a8
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
index 9c68285256..51bc2ff47e 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUNXI_MALI_UTGARD_DRIVER_VERSION = 9926236a20904ecfca68f3365657c11f92695546
-SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,giuliobenetti,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
+SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,benetti-engineering,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
 SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
 SUNXI_MALI_UTGARD_DRIVER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
