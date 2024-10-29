Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F70DD3A67C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 18:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A91E60A61;
	Tue, 29 Oct 2024 18:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFxie5wj2p9o; Tue, 29 Oct 2024 18:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5036960A70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5036960A70;
	Tue, 29 Oct 2024 18:33:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B528D5E4F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E83240B98
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kw_ZzXWm4Qn9 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 18:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96F3E40B77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96F3E40B77
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:33:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C9B7846ED; Tue, 29 Oct 2024 18:33:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 18:52:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed60187920631e444af50ef99f95802222ed5a43
X-Git-Newrev: 028e99c0383fbb186ca05bef0aeb5abc287785a1
X-Patchwork-Hint: ignore
Message-Id: <20241029183302.8C9B7846ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-packages: bump version to
 85c4934bda545beff36133dc63e47de5b5c5c56b
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

commit: https://git.buildroot.net/buildroot/commit/?id=028e99c0383fbb186ca05bef0aeb5abc287785a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flutter-packages/flutter-packages.hash | 2 +-
 package/flutter-packages/flutter-packages.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 1a8613ecb3..9730f65bf2 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ddaa74f1d4a7d2c07dc620ccd5d33743b2c1ec6261d1cd00df74bdcf78aebb3a  flutter-packages-df88c814248ddc88fdc0ac0a75d94179f39d644b.tar.gz
+sha256  fe87edffd828f7081f5622c592cb5871a2bc107dc03ff2610ddb6599f4f0137b  flutter-packages-85c4934bda545beff36133dc63e47de5b5c5c56b.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index bf39bb4488..37f8141e7a 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = df88c814248ddc88fdc0ac0a75d94179f39d644b
+FLUTTER_PACKAGES_VERSION = 85c4934bda545beff36133dc63e47de5b5c5c56b
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
