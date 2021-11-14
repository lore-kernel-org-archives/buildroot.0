Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B09EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:45:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FE1861056
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FE1861056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02AD840294;
	Sun, 14 Nov 2021 14:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3auVqMVl1cG; Sun, 14 Nov 2021 14:45:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7323A402C4;
	Sun, 14 Nov 2021 14:45:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 274ED1BF20B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21332401FD
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kwv9bOR2uBV1 for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:44:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 151C8400F3
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:44:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9C9548D2F3; Sun, 14 Nov 2021 14:40:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:43:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0d00e1d703698fa94ebd2fb5ec6d9252b2c1ba36
X-Git-Newrev: 50610e7a4555e4c3493f8181dec6de835de48183
X-Patchwork-Hint: ignore
Message-Id: <20211114144017.9C9548D2F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/kodi-audiodecoder-timidity: bump version to 19.0.1-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=50610e7a4555e4c3493f8181dec6de835de48183
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash | 2 +-
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index 19efb1dfd5..0120c1ff3b 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c2a0701978e71102859c7cb308422fe26fb87741d0eab9656650eaea156c3d56  kodi-audiodecoder-timidity-19.0.0-Matrix.tar.gz
+sha256  c33bcf24a6a9ca8c594c3d587c0efa5f1469c9402b3a934aaa5d21f1cbf41e9a  kodi-audiodecoder-timidity-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index d6c47d11cd..824015a93f 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = 19.0.0-Matrix
+KODI_AUDIODECODER_TIMIDITY_VERSION = 19.0.1-Matrix
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
