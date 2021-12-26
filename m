Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97771C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 15:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 580C760D88;
	Sun, 26 Dec 2021 15:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aq-9Nnp4R0_e; Sun, 26 Dec 2021 15:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C51A460D79;
	Sun, 26 Dec 2021 15:02:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE42A1BF2F4
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDB7360D79
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hOrNu_W_aYZm for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 15:02:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BA3360C15
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 15:02:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 23A8182AF2; Sun, 26 Dec 2021 14:56:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 16:02:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30d1b3e573a852bc44e9c1e3c75c724b24dce533
X-Git-Newrev: dde6b3b9dbffdb68c2ec724b8b142bd2dc07dc3c
X-Patchwork-Hint: ignore
Message-Id: <20211226145640.23A8182AF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gssdp: bump to version 1.4.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=dde6b3b9dbffdb68c2ec724b8b142bd2dc07dc3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/gssdp/-/blob/gssdp-1.4.0.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gssdp/gssdp.hash | 4 ++--
 package/gssdp/gssdp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index 4954568420..c9bbd66083 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.3/gssdp-1.3.1.sha256sum:
-sha256  affbf145c26e02dda9d31f9da9fd5182bd2cc36565ab8ee2e877567b2fd206cd  gssdp-1.3.1.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.4/gssdp-1.4.0.1.sha256sum:
+sha256  8676849d57fb822b8728856dbadebf3867f89ee47a0ec47a20045d011f431582  gssdp-1.4.0.1.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index c7982f16c5..f1fed3713d 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GSSDP_VERSION_MAJOR = 1.3
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).1
+GSSDP_VERSION_MAJOR = 1.4
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).0.1
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
