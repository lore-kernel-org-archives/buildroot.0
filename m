Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B02CAC59F
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C5C361134;
	Tue, 16 Sep 2025 20:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id clXo458jLMU9; Tue, 16 Sep 2025 20:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82DCA61130
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82DCA61130;
	Tue, 16 Sep 2025 20:04:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D99E12D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94A3161114
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2P4otNjubZS for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE2F861119
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE2F861119
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:04:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC7E7849B1; Tue, 16 Sep 2025 20:04:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:02:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b14018a38d1f37f6200a2d8ee088a381622835b
X-Git-Newrev: 51fd6aaa8ab44c2eaa7a84b150b436b073c8653e
X-Patchwork-Hint: ignore
Message-Id: <20250916200429.BC7E7849B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/boot-wrapper-aarch64: bump to git
 commit b621b157b4 (2025-06-10)
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
Content-Type: multipart/mixed; boundary="===============4960497554405962208=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4960497554405962208==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=51fd6aaa8ab44c2eaa7a84b150b436b073c8653e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
git log --oneline ac6742520d..b621b157b4

b621b15 aarch64: Enable access into FEAT_SPE_FDS register from EL2 and below
785302c aarch64: Enable use of ZT0
7f5a545 aarch64: Enable use of FPMR
0f3a153 aarch64: shuffle ID_AA64PFR{0,1}_EL1 definitions
0e78492 Makefile: Ensure initrd parameters in /chosen are up-to-date
1571345 aarch64: Enable access into FEAT_PMUv3p9 registers from EL2 and below
e1b9137 aarch64: Enable access into FEAT_FGT2 registers from EL2 and below

Cc: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash | 2 +-
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash
index 427653d55a..d818161002 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  faa2843eaa3bc219da5ba9f69c02b45081a7634038faef5cba216d5e927ca2be  boot-wrapper-aarch64-ac6742520ded1da30d500f74e8affe86e27cabd5-git4.tar.gz
+sha256  c9fcac5e28e1501bcffb3b36d56487cbefcf7cb708e00f48fe6360ef82fb3847  boot-wrapper-aarch64-b621b157b42f1fe398520cf499db88aa654c78e2-git4.tar.gz
 
 # Hash for license files:
 sha256  bdaa479b497358151fc1166dc75a613e68321320b945e92ea07a4b6dc9a63271  LICENSE.txt
diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index 0f41d0d67f..75be23f243 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOT_WRAPPER_AARCH64_VERSION = ac6742520ded1da30d500f74e8affe86e27cabd5
+BOOT_WRAPPER_AARCH64_VERSION = b621b157b42f1fe398520cf499db88aa654c78e2
 BOOT_WRAPPER_AARCH64_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
 BOOT_WRAPPER_AARCH64_SITE_METHOD = git
 BOOT_WRAPPER_AARCH64_LICENSE = BSD-3-Clause

--===============4960497554405962208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4960497554405962208==--
