Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6251FEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 11:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ECC7402D7;
	Sun, 18 Jun 2023 11:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ECC7402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ORJFbdJ_cq0; Sun, 18 Jun 2023 11:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13A434047D;
	Sun, 18 Jun 2023 11:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13A434047D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C8F6A1BF5AE
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFC6A60F66
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFC6A60F66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QP9KuTgdpTQ4 for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 11:45:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FD3660F85
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 11:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FD3660F85
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F34BB83BAF; Sun, 18 Jun 2023 11:45:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 13:36:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 043d0e6f6ca0e99ab36bf845a56a416850d70fb1
X-Git-Newrev: 9a141f7ec5048a840f06d18f4812cacbb54cc2d3
X-Patchwork-Hint: ignore
Message-Id: <20230618114558.F34BB83BAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mc: bump to version 4.8.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a141f7ec5048a840f06d18f4812cacbb54cc2d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index b0381474ff..5edfc79113 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,4 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.28.sha256
-sha256  e994d9be9a7172e9ac4a4ad62107921f6aa312e668b056dfe5b8bcebbaf53803  mc-4.8.28.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.29.sha256
+sha256  01d8a3b94f58180cca5bf17257b5078d1fd6fd27a9b5c0e970ec767549540ad4  mc-4.8.29.tar.xz
 # sha256 locally computed:
 sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 3858d62886..894b231445 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.28
+MC_VERSION = 4.8.29
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
