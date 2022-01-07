Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CEDC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26E3581750;
	Fri,  7 Jan 2022 20:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZ3VP6h3mtm7; Fri,  7 Jan 2022 20:35:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80F228174D;
	Fri,  7 Jan 2022 20:35:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 526511BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40C6E8174D
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PcqY_b7oBjG5 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:34:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76A29814AB
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:34:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BB31682A92; Fri,  7 Jan 2022 20:28:39 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 21:34:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7f2b73fa510fd247aaadcf250d154893bde044d
X-Git-Newrev: d2249821d3f30202ca2a35ad24918378d9a0a0e8
X-Patchwork-Hint: ignore
Message-Id: <20220107202839.BB31682A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: bump to version 2.0.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2249821d3f30202ca2a35ad24918378d9a0a0e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

RISC-V is supported since
https://github.com/zlib-ng/zlib-ng/commit/81f1c8a41bd1427707f402450de8820816760fca

https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.6
https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.5
https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.4
https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.3
https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.2
https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.1
https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zlib-ng/zlib-ng.hash | 2 +-
 package/zlib-ng/zlib-ng.mk   | 2 +-
 package/zlib/Config.in       | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
index 3e1dba35ba..a799cfe253 100644
--- a/package/zlib-ng/zlib-ng.hash
+++ b/package/zlib-ng/zlib-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  379723c0c954679a50d1d7df43084e2194dc51ecbc9987c889cb129d1f6734bc  zlib-ng-1.9.9-b1.tar.gz
+sha256  8258b75a72303b661a238047cb348203d88d9dddf85d480ed885f375916fcab6  zlib-ng-2.0.6.tar.gz
 sha256  d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436  LICENSE.md
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index c56fa72d6f..fb497b8c11 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLIB_NG_VERSION = 1.9.9-b1
+ZLIB_NG_VERSION = 2.0.6
 ZLIB_NG_SITE = $(call github,zlib-ng,zlib-ng,$(ZLIB_NG_VERSION))
 ZLIB_NG_LICENSE = Zlib
 ZLIB_NG_LICENSE_FILES = LICENSE.md
diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index 550c2efa93..d6d94889a7 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_i386
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_riscv
 	default y if BR2_s390x
 	default y if BR2_x86_64
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
