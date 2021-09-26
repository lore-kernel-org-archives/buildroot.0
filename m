Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3298DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:57:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E16F660FDC
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E16F660FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC9C66077F;
	Sun, 26 Sep 2021 19:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fvCxbjMbeIHq; Sun, 26 Sep 2021 19:57:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB20160769;
	Sun, 26 Sep 2021 19:57:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5B81BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 293C4607C3
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xy6PY2WbTheK for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 436B36072E
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CCB818D25E; Sun, 26 Sep 2021 19:50:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:08:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb5fbda96e23092d26c3814fbe220b0dac00d07e
X-Git-Newrev: cb7a3f2b20a0fcac8e92d2f8bec2263ed6d37075
X-Patchwork-Hint: ignore
Message-Id: <20210926195017.CCB818D25E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-visualisation-goom: bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb7a3f2b20a0fcac8e92d2f8bec2263ed6d37075
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index ab5bda33c4..e4970972ec 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8de34cd33977bb8fa5fd721993341f7d64bbf5b08e481438740287dd2a366079  kodi-visualisation-goom-3.4.0-Matrix.tar.gz
+sha256  03f4228421a1fe38d619d5599f31de04e2207647c5aae7ac83809e5324890437  kodi-visualisation-goom-19.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 45f2f05ece..37adccc9bf 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 3.4.0-Matrix
+KODI_VISUALISATION_GOOM_VERSION = 19.0.0-Matrix
 KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
