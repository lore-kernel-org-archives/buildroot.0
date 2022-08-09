Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1AAC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 11:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76D2D410E8;
	Tue,  9 Aug 2022 11:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76D2D410E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZT15oZypWsg; Tue,  9 Aug 2022 11:28:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA58414C8;
	Tue,  9 Aug 2022 11:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BA58414C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AED71BF9B9
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56BB560E0B
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56BB560E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZeaOxeHMaM8 for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 11:28:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AD1560B0F
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 11:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AD1560B0F
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E296E86FDA; Tue,  9 Aug 2022 11:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Aug 2022 13:27:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b677db703dc0b976a707942bbc94ecd3f7b4b4b
X-Git-Newrev: 87bf8ddc067558acb0c96e102a3b5d67b89b9dfa
X-Patchwork-Hint: ignore
Message-Id: <20220809111348.E296E86FDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgudev: bump to version 237
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

commit: https://git.buildroot.net/buildroot/commit/?id=87bf8ddc067558acb0c96e102a3b5d67b89b9dfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/libgudev/-/blob/237/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgudev/libgudev.hash | 4 ++--
 package/libgudev/libgudev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgudev/libgudev.hash b/package/libgudev/libgudev.hash
index 1040ffb0c0..3933e55de4 100644
--- a/package/libgudev/libgudev.hash
+++ b/package/libgudev/libgudev.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libgudev/236/libgudev-236.sha256sum
-sha256  e50369d06d594bae615eb7aeb787de304ebaad07a26d1043cef8e9c7ab7c9524  libgudev-236.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libgudev/237/libgudev-237.sha256sum
+sha256  0d06b21170d20c93e4f0534dbb9b0a8b4f1119ffb00b4031aaeb5b9148b686aa  libgudev-237.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
index eabd446d7b..27244c3072 100644
--- a/package/libgudev/libgudev.mk
+++ b/package/libgudev/libgudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGUDEV_VERSION = 236
+LIBGUDEV_VERSION = 237
 LIBGUDEV_SOURCE = libgudev-$(LIBGUDEV_VERSION).tar.xz
 LIBGUDEV_SITE = http://ftp.gnome.org/pub/GNOME/sources/libgudev/$(LIBGUDEV_VERSION)
 LIBGUDEV_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
