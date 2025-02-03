Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F3AC02197
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 18:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D48160A43;
	Mon,  3 Feb 2025 18:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69u1FDT-QyID; Mon,  3 Feb 2025 18:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E67F60C2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E67F60C2E;
	Mon,  3 Feb 2025 18:44:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3285C185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21B22607B1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRWMjoFwqFAH for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 18:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C69E4607A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C69E4607A8
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:44:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B552286A04; Mon,  3 Feb 2025 18:44:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 19:44:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 633bbb40d6cdfb7fee7302d5012253dfb7777952
X-Git-Newrev: f3ef04114b146a91515eff8a1e207b4bdab89c0a
X-Patchwork-Hint: ignore
Message-Id: <20250203184444.B552286A04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-packages: bump to version
 3976c1bbd8ffba10007e5beeaddff37bfbaa2ae1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3ef04114b146a91515eff8a1e207b4bdab89c0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/flutter-packages/flutter-packages.hash | 2 +-
 package/flutter-packages/flutter-packages.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 9730f65bf2..615c1142b8 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe87edffd828f7081f5622c592cb5871a2bc107dc03ff2610ddb6599f4f0137b  flutter-packages-85c4934bda545beff36133dc63e47de5b5c5c56b.tar.gz
+sha256  769de0bbccc6c5b04ccc0be72652c1a9b22d6b4e03b0477a3c7fccacfdb04177  flutter-packages-3976c1bbd8ffba10007e5beeaddff37bfbaa2ae1.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 37f8141e7a..3dbbebb067 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = 85c4934bda545beff36133dc63e47de5b5c5c56b
+FLUTTER_PACKAGES_VERSION = 3976c1bbd8ffba10007e5beeaddff37bfbaa2ae1
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
