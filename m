Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9DCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:09:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D46C760FDA
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D46C760FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5CF6605A2;
	Thu, 14 Oct 2021 21:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtA-HK_BtgaF; Thu, 14 Oct 2021 21:09:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBD7C607EE;
	Thu, 14 Oct 2021 21:09:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 210501BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D16A940160
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y6jF9GI3qg9F for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2106940177
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 019E794EA3; Thu, 14 Oct 2021 21:05:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 22:58:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 243948cb877667ca8bf42170aa138622bde3d916
X-Git-Newrev: 36866eefeebceb249a7224645151a7be9ff653eb
X-Patchwork-Hint: ignore
Message-Id: <20211014210542.019E794EA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-peripheral-xarcade: bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=36866eefeebceb249a7224645151a7be9ff653eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index a971493c02..7defa8cee3 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6fa8e1d0e6ebb6c385a7aef6e6c7629d2f1f52601ade7839093c1c3abb844894  kodi-peripheral-xarcade-1.2.0-Matrix.tar.gz
+sha256  b6d6161bdfd3cc4d60d3cd7f3452b1101fad48eea1816fed28865af4b985c244  kodi-peripheral-xarcade-19.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index fe5a9e41a0..8e9d2a8a62 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_XARCADE_VERSION = 1.2.0-Matrix
+KODI_PERIPHERAL_XARCADE_VERSION = 19.0.0-Matrix
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_XARCADE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
