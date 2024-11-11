Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D630FD3ABF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DCE4606FF;
	Mon, 11 Nov 2024 20:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3qTJsJ5k3uv; Mon, 11 Nov 2024 20:27:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9756C60708
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9756C60708;
	Mon, 11 Nov 2024 20:27:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50CC5DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82BD840092
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jt-cVfLm6Vkl for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7481840131
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7481840131
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:27:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C73A860B4; Mon, 11 Nov 2024 20:27:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 21:22:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6febbd6f1e99fa55419049a305e8cbbecf1d683e
X-Git-Newrev: 799d43ae051339e08f443664d61122788764045d
X-Patchwork-Hint: ignore
Message-Id: <20241111202736.5C73A860B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/blake3: bump version to 1.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=799d43ae051339e08f443664d61122788764045d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 1.5.1, see: [1] [2] [3].

Also, v1.5.2 added the new license "Apache-2.0 with (LLVM)
exceptions". The initial LICENSE file was split in three
different files (one file per license). See [4] [5].
This commit updates _LICENSE, _LICENSE_FILES and the hash
file accordingly.

[1] https://github.com/BLAKE3-team/BLAKE3/releases/tag/1.5.2
[2] https://github.com/BLAKE3-team/BLAKE3/releases/tag/1.5.3
[3] https://github.com/BLAKE3-team/BLAKE3/releases/tag/1.5.4
[4] https://github.com/BLAKE3-team/BLAKE3/commit/bb8761256a6a6144f330907b74c80f0ed0ecab4a
[5] https://github.com/BLAKE3-team/BLAKE3/commit/0b2c630cc5c59ac76a184cdc9540092a97d33e7f

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/blake3/blake3.hash | 6 ++++--
 package/blake3/blake3.mk   | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
index 2a00d19b02..9c3792edf6 100644
--- a/package/blake3/blake3.hash
+++ b/package/blake3/blake3.hash
@@ -1,3 +1,5 @@
 # sha256 computed locally
-sha256  822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37  blake3-1.5.1.tar.gz
-sha256  6a94bedb8b707ed97f6e310d0d015ab14e0683ffa0a612b02958581b9cc9fc0e  LICENSE
+sha256  ddd24f26a31d23373e63d9be2e723263ac46c8b6d49902ab08024b573fd2a416  blake3-1.5.4.tar.gz
+sha256  00fcc7a934ddbc9ece2a7cc063ac788e284b703b1d705ccbba72d462aa97921e  LICENSE_A2
+sha256  a5695f57ea0c221e0e8b7d784ff774c35e88c3d3270353646a925880bb3492cc  LICENSE_A2LLVM
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSE_CC0
diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
index 3b1ccb44cc..f8ef2386f5 100644
--- a/package/blake3/blake3.mk
+++ b/package/blake3/blake3.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-BLAKE3_VERSION = 1.5.1
+BLAKE3_VERSION = 1.5.4
 BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,$(BLAKE3_VERSION))
 BLAKE3_SUBDIR = c
-BLAKE3_LICENSE = Apache-2.0, CC0-1.0
-BLAKE3_LICENSE_FILES = LICENSE
+BLAKE3_LICENSE = Apache-2.0 or Apache-2.0 with exceptions or CC0-1.0
+BLAKE3_LICENSE_FILES = LICENSE_A2 LICENSE_A2LLVM LICENSE_CC0
 
 # The package is a dependency to ccache so ccache cannot be a dependency
 HOST_BLAKE3_ADD_CCACHE_DEPENDENCY = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
