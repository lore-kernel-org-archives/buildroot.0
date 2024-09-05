Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7675CCE7A96
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7B0040E9C;
	Thu,  5 Sep 2024 20:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZIDbTY4Nb_c; Thu,  5 Sep 2024 20:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B003F40F8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B003F40F8B;
	Thu,  5 Sep 2024 20:23:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5ABC81BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2A5640361
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEPCTFbvy7lr for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE38F4051D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE38F4051D
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6FB286E3F; Thu,  5 Sep 2024 20:23:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 22:18:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d6559e0f58b9962a82df0db009a622ffc4b8db1c
X-Git-Newrev: 5bd8ab48c12b583cb35c323955a41c567d5449eb
X-Patchwork-Hint: ignore
Message-Id: <20240905202320.A6FB286E3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/flutter-packages: bump
 version to 71e827e7df6833e6942873361f189adcb041d7f1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bd8ab48c12b583cb35c323955a41c567d5449eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flutter-packages/flutter-packages.hash | 2 +-
 package/flutter-packages/flutter-packages.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 1fbe601396..b51eefbe80 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  388ec45142ddfab711aa82958c82657b8c2238deb6c131cec94a5a993ba4c760  flutter-packages-8af79fbca12699248e96b50b4705da74396cd6a3.tar.gz
+sha256  9de635d61d9efc0fd42762c1814086ead28ea6a372a6f8a99ee97060a3323fb3  flutter-packages-71e827e7df6833e6942873361f189adcb041d7f1.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 1a1913043b..407dd31a0f 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = 8af79fbca12699248e96b50b4705da74396cd6a3
+FLUTTER_PACKAGES_VERSION = 71e827e7df6833e6942873361f189adcb041d7f1
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
