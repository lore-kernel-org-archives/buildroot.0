Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4F1C369D5
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E1C540907;
	Mon, 21 Apr 2025 21:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kidlsBsK4MCS; Mon, 21 Apr 2025 21:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D76C40824
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D76C40824;
	Mon, 21 Apr 2025 21:22:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E2591BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE9F760B3B
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aLMbrOXd3rj for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2539D60B3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2539D60B3C
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:21:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21E2085FEF; Mon, 21 Apr 2025 21:21:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 19:08:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e75e166c4e1ed464056608354bdf1a2deff594af
X-Git-Newrev: 10370cd77bb31d569b0bd47cabae7cdc2b681db2
X-Patchwork-Hint: ignore
Message-Id: <20250421212158.21E2085FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-packages: bump to version
 2df1c3a524131e35d6e385eb9465c47d530e341b
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=10370cd77bb31d569b0bd47cabae7cdc2b681db2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

native_assets.yaml are now native_assets.json

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../flutter-adaptive-scaffold-example.mk                                | 2 +-
 .../flutter-animations-example/flutter-animations-example.mk            | 2 +-
 .../flutter-go-router-example/flutter-go-router-example.mk              | 2 +-
 package/flutter-packages/flutter-image-example/flutter-image-example.mk | 2 +-
 .../flutter-markdown-example/flutter-markdown-example.mk                | 2 +-
 package/flutter-packages/flutter-packages.hash                          | 2 +-
 package/flutter-packages/flutter-packages.mk                            | 2 +-
 .../flutter-rfw-local-example/flutter-rfw-local-example.mk              | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk
index f6ac086115..e8e27d4383 100644
--- a/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk
+++ b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk
@@ -26,7 +26,7 @@ endef
 define FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILD_CMDS
 	cd $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR) && \
 		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			--native-assets $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
 			package:$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_PKG_NAME)/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
diff --git a/package/flutter-packages/flutter-animations-example/flutter-animations-example.mk b/package/flutter-packages/flutter-animations-example/flutter-animations-example.mk
index 2b5c896736..440aec4964 100644
--- a/package/flutter-packages/flutter-animations-example/flutter-animations-example.mk
+++ b/package/flutter-packages/flutter-animations-example/flutter-animations-example.mk
@@ -26,7 +26,7 @@ endef
 define FLUTTER_ANIMATIONS_EXAMPLE_BUILD_CMDS
 	cd $(FLUTTER_ANIMATIONS_EXAMPLE_BUILDDIR) && \
 		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_ANIMATIONS_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			--native-assets $(FLUTTER_ANIMATIONS_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
 			package:$(FLUTTER_ANIMATIONS_EXAMPLE_PKG_NAME)/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
diff --git a/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk b/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk
index a7fa36ca9e..9279a4503f 100644
--- a/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk
+++ b/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk
@@ -29,7 +29,7 @@ define FLUTTER_GO_ROUTER_EXAMPLE_BUILD_CMDS
 			-Dflutter.dart_plugin_registrant=file://$(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
 			--source file://$(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
 			--source package:flutter/src/dart_plugin_registrant.dart \
-			--native-assets $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			--native-assets $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
 			package:$(FLUTTER_GO_ROUTER_EXAMPLE_PKG_NAME)/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
diff --git a/package/flutter-packages/flutter-image-example/flutter-image-example.mk b/package/flutter-packages/flutter-image-example/flutter-image-example.mk
index 20f185896d..5d754c0ff6 100644
--- a/package/flutter-packages/flutter-image-example/flutter-image-example.mk
+++ b/package/flutter-packages/flutter-image-example/flutter-image-example.mk
@@ -26,7 +26,7 @@ endef
 define FLUTTER_IMAGE_EXAMPLE_BUILD_CMDS
 	cd $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR) && \
 		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			--native-assets $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
 			package:$(FLUTTER_IMAGE_EXAMPLE_PKG_NAME)/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
diff --git a/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
index eb6792fb02..0859b947eb 100644
--- a/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
+++ b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
@@ -26,7 +26,7 @@ endef
 define FLUTTER_MARKDOWN_EXAMPLE_BUILD_CMDS
 	cd $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR) && \
 		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			--native-assets $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
 			package:$(FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME)/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 615c1142b8..00346a8a6a 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  769de0bbccc6c5b04ccc0be72652c1a9b22d6b4e03b0477a3c7fccacfdb04177  flutter-packages-3976c1bbd8ffba10007e5beeaddff37bfbaa2ae1.tar.gz
+sha256  9b6fdc8660ac3c601887c3c7e8859662e7fca19584af56dfac9c8acb86298a01  flutter-packages-2df1c3a524131e35d6e385eb9465c47d530e341b.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 3dbbebb067..40a586f7e0 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = 3976c1bbd8ffba10007e5beeaddff37bfbaa2ae1
+FLUTTER_PACKAGES_VERSION = 2df1c3a524131e35d6e385eb9465c47d530e341b
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
diff --git a/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk
index b57c021f8b..49f1dc4dda 100644
--- a/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk
+++ b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk
@@ -26,7 +26,7 @@ endef
 define FLUTTER_RFW_LOCAL_EXAMPLE_BUILD_CMDS
 	cd $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR) && \
 		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			--native-assets $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
 			package:$(FLUTTER_RFW_LOCAL_EXAMPLE_PKG_NAME)/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
