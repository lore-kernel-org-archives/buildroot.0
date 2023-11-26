Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F58CC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEB566068F;
	Sun, 26 Nov 2023 21:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEB566068F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vYz_M0hnckb3; Sun, 26 Nov 2023 21:46:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A30360BEF;
	Sun, 26 Nov 2023 21:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A30360BEF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 894661BF909
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F6C160BE7
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F6C160BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zz0INjlSCbDi for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:46:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94D1460597
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94D1460597
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8035987452; Sun, 26 Nov 2023 21:46:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 22:40:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a382a7d55432918d2a1e47ae4cbe7ed50fa17a08
X-Git-Newrev: 6556bfba4f6e40186cdb7135b6ebde8a9fa9fa9f
X-Patchwork-Hint: ignore
Message-Id: <20231126214640.8035987452@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgeos: bump version
 to 3.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6556bfba4f6e40186cdb7135b6ebde8a9fa9fa9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog: https://github.com/libgeos/geos/releases/tag/3.12.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index bb433117a5..37fe7d6d23 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d96db96011259178a35555a0f6d6e75a739e52a495a6b2aa5efb3d75390fbc39  geos-3.12.0.tar.bz2
+sha256  d6ea7e492224b51193e8244fe3ec17c4d44d0777f3c32ca4fb171140549a0d03  geos-3.12.1.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 70f8ca3495..491168324f 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.12.0
+LIBGEOS_VERSION = 3.12.1
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
