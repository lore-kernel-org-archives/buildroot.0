Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A05C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:00:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5CC60FDC
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D5CC60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1756605C2;
	Sun, 26 Sep 2021 20:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4sewnzesCghi; Sun, 26 Sep 2021 20:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2384E6071A;
	Sun, 26 Sep 2021 20:00:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07BC91BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D2A8403A4
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I-cFWkaYtKex for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32FD240109
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A4BD38D25E; Sun, 26 Sep 2021 19:50:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:29:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5051888b9e5c4083200ab158311aa153c6169f37
X-Git-Newrev: 95cedf8ee48c4ff2cd87090bdd5a3ff53c6c5434
X-Patchwork-Hint: ignore
Message-Id: <20210926195019.A4BD38D25E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-visualisation-shadertoy: bump
 version to 19.1.1-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=95cedf8ee48c4ff2cd87090bdd5a3ff53c6c5434
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream added a dependency to jsoncpp:
https://github.com/xbmc/visualization.shadertoy/commit/5cdc855df6c3f755be68c83da0ea63c3b0f4857a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-shadertoy/Config.in                       | 5 +++++
 .../kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash   | 2 +-
 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk | 4 ++--
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/kodi-visualisation-shadertoy/Config.in b/package/kodi-visualisation-shadertoy/Config.in
index aa671aae13..50fd38c247 100644
--- a/package/kodi-visualisation-shadertoy/Config.in
+++ b/package/kodi-visualisation-shadertoy/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY
 	bool "kodi-visualisation-shadertoy"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
 	select BR2_PACKAGE_GLM
+	select BR2_PACKAGE_JSONCPP
 	help
 	  Shadertoy visualiser for Kodi
 
 	  https://github.com/notspiff/visualization.shadertoy
+
+comment "kodi-visualisation-shadertoy needs a toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index 74cbfc5efc..a27334d2cc 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f489d404332d1832d9b45612e4564c4aabcfe03504a46899e29bae8a1c27e0f3  kodi-visualisation-shadertoy-19.0.1-Matrix.tar.gz
+sha256  c556003a46ebf11595fb04343bf21a135365342f09e2280da2e7fd5e802944e7  kodi-visualisation-shadertoy-19.1.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index 0340cd6c6c..e15264bb44 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 19.0.1-Matrix
+KODI_VISUALISATION_SHADERTOY_VERSION = 19.1.1-Matrix
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = LICENSE.md
-KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = glm kodi
+KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = glm jsoncpp kodi
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
