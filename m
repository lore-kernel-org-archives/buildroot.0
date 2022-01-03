Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428C8C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 09:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B33618134D;
	Mon,  3 Jan 2022 09:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3A-ZsSz9GxmL; Mon,  3 Jan 2022 09:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10FEC8131F;
	Mon,  3 Jan 2022 09:08:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 241C51BF360
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 09:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 550C660B87
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 09:07:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63MMQ9qDfEEZ for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 09:07:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0F5760B64
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 09:07:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2170882BCC; Mon,  3 Jan 2022 09:01:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jan 2022 10:04:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51dc39eed390e2b0f86f6e5d5d8c083067c17c51
X-Git-Newrev: 4fb70b49b615ace33730f0b0fee0cc02e06624d3
X-Patchwork-Hint: ignore
Message-Id: <20220103090129.2170882BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-audioencoder-lame: bump
 version to 19.1.2-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=4fb70b49b615ace33730f0b0fee0cc02e06624d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index f39b1f7a82..a9cb12af6a 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb75e1cb069e977887003d3f11cc73a1ecf885c7fb9c03950cd5c918dc64820a  kodi-audioencoder-lame-19.1.1-Matrix.tar.gz
+sha256  774e75b051b1872620a706aa5e6c8741708364ac8d9d849286c4a265dd1a22f7  kodi-audioencoder-lame-19.1.2-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index 9048d4d730..fbc7489782 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 19.1.1-Matrix
+KODI_AUDIOENCODER_LAME_VERSION = 19.1.2-Matrix
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
