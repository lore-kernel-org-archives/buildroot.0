Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420DBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:54:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 058A760F9C
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 058A760F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC23A40288;
	Sun, 26 Sep 2021 19:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3WfYTKkrombT; Sun, 26 Sep 2021 19:54:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29CDF40217;
	Sun, 26 Sep 2021 19:54:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E8D31BF95D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F12D781B7B
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qp4LN3jQICQ0 for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34AD981A3E
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BC3F38D26A; Sun, 26 Sep 2021 19:50:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:29:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b92b0d5b7611dc25af4791d469f431aa345a88f
X-Git-Newrev: 9ac689c57ef7a82448ba483491042e96c0161a7e
X-Patchwork-Hint: ignore
Message-Id: <20210926195018.BC3F38D26A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-screensaver-matrixtrails:
 bump version to 19.0.0-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ac689c57ef7a82448ba483491042e96c0161a7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash    | 2 +-
 package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 1f35f11b7d..8434a7596e 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  49986b82e7319e25ef2b3ec84b3892bbf1cb0b5253bd541da730c5cf5dd1940b  kodi-screensaver-matrixtrails-2.6.0-Matrix.tar.gz
+sha256  309e4808ad76989b4c50dd0b55b859bff00b952da0a9dcead7157f935a047fe6  kodi-screensaver-matrixtrails-19.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index a89ea72d5d..ac4303a719 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 2.6.0-Matrix
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 19.0.0-Matrix
 KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
