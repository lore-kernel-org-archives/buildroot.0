Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD35C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 19:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EFE2408ED;
	Sat, 12 Mar 2022 19:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUrkqn-OMMc6; Sat, 12 Mar 2022 19:44:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D20E40872;
	Sat, 12 Mar 2022 19:44:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E8EF1BF969
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C1C560E65
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id viwk9l3BgUFq for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 19:44:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B504960E60
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 19:44:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C1DCA83A6B; Sat, 12 Mar 2022 19:35:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 20:44:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8adeaec8afacbc680edebae91524f6144926ac92
X-Git-Newrev: 691b1cebf56099e7f019281beb761c0b0fe4d5e0
X-Patchwork-Hint: ignore
Message-Id: <20220312193555.C1DCA83A6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-plugins: bump to version 1.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=691b1cebf56099e7f019281beb761c0b0fe4d5e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/alsa-project/alsa-plugins/releases/tag/v1.2.6

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/alsa-plugins/alsa-plugins.hash | 2 +-
 package/alsa-plugins/alsa-plugins.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-plugins/alsa-plugins.hash b/package/alsa-plugins/alsa-plugins.hash
index 8ecbd19965..2582a0d639 100644
--- a/package/alsa-plugins/alsa-plugins.hash
+++ b/package/alsa-plugins/alsa-plugins.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  42eef98433d2c8d11f1deeeb459643619215a75aa5a5bbdd06a794e4c413df20  alsa-plugins-1.2.5.tar.bz2
+sha256  068818a4b55d8c029daa00015d853d45113f56b224b7c64e1e117988c825b2a0  alsa-plugins-1.2.6.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING.GPL
diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
index 396f47adaf..b8819151ef 100644
--- a/package/alsa-plugins/alsa-plugins.mk
+++ b/package/alsa-plugins/alsa-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_PLUGINS_VERSION = 1.2.5
+ALSA_PLUGINS_VERSION = 1.2.6
 ALSA_PLUGINS_SOURCE = alsa-plugins-$(ALSA_PLUGINS_VERSION).tar.bz2
 ALSA_PLUGINS_SITE = https://www.alsa-project.org/files/pub/plugins
 ALSA_PLUGINS_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
