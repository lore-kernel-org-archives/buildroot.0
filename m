Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59043C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B32E04EF77;
	Fri, 28 Feb 2025 17:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0D7Q9EGx7Au; Fri, 28 Feb 2025 17:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 811C24F651
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 811C24F651;
	Fri, 28 Feb 2025 17:09:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 135031DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D53340301
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsNAXnBb19Dw for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 239AF419EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 239AF419EF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D94785E25; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 19:44:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1526fac50ce698c34f3cffd64d2448fbc54e72d8
X-Git-Newrev: 633bbb40d6cdfb7fee7302d5012253dfb7777952
X-Patchwork-Hint: ignore
Message-Id: <20250228163027.1D94785E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/flutter-engine: bump
 to version 3.27.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=633bbb40d6cdfb7fee7302d5012253dfb7777952
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Other changes:
  - Upstream dropped the --enable-impeller-vulkan configuration option.
  - Add a .hash file for the LICENSE file
  - Change the wording of the comment to reflect the addition of the
    .hash file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/flutter-engine/flutter-engine.hash | 1 +
 package/flutter-engine/flutter-engine.mk   | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/flutter-engine/flutter-engine.hash b/package/flutter-engine/flutter-engine.hash
new file mode 100644
index 0000000000..3309082139
--- /dev/null
+++ b/package/flutter-engine/flutter-engine.hash
@@ -0,0 +1 @@
+sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 7f41defe68..a399296247 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -19,9 +19,10 @@
 #  - Create a source tarball.
 #  - Copy the source tarball to the $(FLUTTER_ENGINE_DL_DIR) directory.
 #
-# There is no hash provided, as the gn binary (used for configuration) relies
-# on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.24.4
+# There is no hash provided for the source tarball, as the gn binary
+# (used for configuration) relies on the .git directories. As such, a
+# reproducible tarball is not possible.
+FLUTTER_ENGINE_VERSION = 3.27.1
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
@@ -145,7 +146,7 @@ endif
 
 # There is no --disable-vulkan option
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
-FLUTTER_ENGINE_CONF_OPTS += --enable-vulkan --enable-impeller-vulkan
+FLUTTER_ENGINE_CONF_OPTS += --enable-vulkan
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBXCB),yy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
