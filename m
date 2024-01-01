Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B0BC47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5F3760E37;
	Mon,  1 Jan 2024 20:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5F3760E37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obxh8Ug4BPZ8; Mon,  1 Jan 2024 20:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4253360E55;
	Mon,  1 Jan 2024 20:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4253360E55
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FEB71BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08E3760E47
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08E3760E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVl8xhYnOwxW for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:36:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 278F060E55
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 278F060E55
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5D4E83AC0; Mon,  1 Jan 2024 20:36:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 21:33:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 745e1ca054d466618c1cbe82bee6c9af5a405fdf
X-Git-Newrev: 7738907cc62f3aa166411353cfe22ebaf32007e7
X-Patchwork-Hint: ignore
Message-Id: <20240101203606.E5D4E83AC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncdu: bump to version 1.19
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7738907cc62f3aa166411353cfe22ebaf32007e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYING (update in year:
https://code.blicky.net/yorhel/ncdu/commit/c08340ee08120244834adb59fcee2abfeb8456a6)

https://dev.yorhel.nl/ncdu/changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncdu/ncdu.hash | 8 ++++----
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index 1e31eaea8e..553e128ed1 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,7 +1,7 @@
 # From https://dev.yorhel.nl/ncdu
-md5  4186b5be477cc3a0944619ade81f123b  ncdu-1.18.tar.gz
-sha1  d47ce3cdf317adadc1426817d07899c90b767aba  ncdu-1.18.tar.gz
-sha256  3c37a1a96580c9c5d2cc352dc3c5eef0d909158c05f1cc29db4712544c8b9f95  ncdu-1.18.tar.gz
+md5  7986451d5b222b8a99b5382f33a30831  ncdu-1.19.tar.gz
+sha1  3ee7aff60bdaa1c79eb4f27e3d277fc2d76e0043  ncdu-1.19.tar.gz
+sha256  30363019180cde0752c7fb006c12e154920412f4e1b5dc3090654698496bb17d  ncdu-1.19.tar.gz
 
 # computed locally
-sha256  4590cb935ff8a50cee76ce12c2cb0411c0b06e84c267b478579785dcf328660d  COPYING
+sha256  40372b6016a489b69a5d198526e0a1c284680900f48a8b725de440452098a97b  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index 240ef9d8ea..f14f61fec5 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.18
+NCDU_VERSION = 1.19
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
