Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E8AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:55:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B549760F9C
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B549760F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8622C4031E;
	Sun, 26 Sep 2021 19:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZI3CyTeCt5f; Sun, 26 Sep 2021 19:55:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FE9440226;
	Sun, 26 Sep 2021 19:55:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17B9F1BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6081760796
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4VxBGk5znnSi for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F9C96071D
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D71F38D25B; Sun, 26 Sep 2021 19:50:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:08:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb7a3f2b20a0fcac8e92d2f8bec2263ed6d37075
X-Git-Newrev: 0ee351d8bad66ff39f758768fe07d694ed9f1cb1
X-Patchwork-Hint: ignore
Message-Id: <20210926195017.D71F38D25B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-visualisation-matrix: bump
 version to 19.0.0-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ee351d8bad66ff39f758768fe07d694ed9f1cb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash | 2 +-
 package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
index 21bc6b072c..602dc3f2f0 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3a51499f60966abf75d2aec45e73d8f64322bb279bb9c4b0d6026e9f31d0fa4a  kodi-visualisation-matrix-1.0.1-Matrix.tar.gz
+sha256  e2cf98fa3cb9451dca595b2fad211ae34b5c449be07073c91aa73f182b208182  kodi-visualisation-matrix-19.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
index 58a0e0dc24..080823e124 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_MATRIX_VERSION = 1.0.1-Matrix
+KODI_VISUALISATION_MATRIX_VERSION = 19.0.0-Matrix
 KODI_VISUALISATION_MATRIX_SITE = $(call github,xbmc,visualization.matrix,$(KODI_VISUALISATION_MATRIX_VERSION))
 KODI_VISUALISATION_MATRIX_LICENSE = GPL-2.0+
 KODI_VISUALISATION_MATRIX_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
