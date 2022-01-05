Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51148C433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 09:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB7D26FB50;
	Wed,  5 Jan 2022 09:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PtW0R2cSLmaV; Wed,  5 Jan 2022 09:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 210846FB4E;
	Wed,  5 Jan 2022 09:20:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A889A1BF390
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 09:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 969566FB4E
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 09:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1FL4bcwqbzk for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 09:20:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D14A86FB4C
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 09:20:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BD89382DD7; Wed,  5 Jan 2022 09:14:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Jan 2022 10:20:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9290c6ea591ec1280c9a526c412a6a2ecf33d2a
X-Git-Newrev: eea674afbf5b437af3d31cc9fc003768cdde3e8b
X-Patchwork-Hint: ignore
Message-Id: <20220105091431.BD89382DD7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: bump to version 0.186
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

commit: https://git.buildroot.net/buildroot/commit/?id=eea674afbf5b437af3d31cc9fc003768cdde3e8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sourceware.org/pipermail/elfutils-devel/2021q4/004346.html

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/elfutils/elfutils.hash | 4 ++--
 package/elfutils/elfutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index 9148758e29..3274b32650 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,5 @@
-# From https://sourceware.org/elfutils/ftp/0.184/sha512.sum
-sha512  5920c354edd6b28bb7e713d674bf6f2221e8ee91b90d582de39b1f45446aea1e7e3d4b6671024c391675b5e7530fe952c1320d730bb625c02d4c647ceb938bc8  elfutils-0.184.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.186/sha512.sum
+sha512  c9180b27ec62935f18b9431268d176f6023d1bb938731d2af6e7626ae460af6608a70ba68483aa1ec7e6cb0fa0528b661ca8b68bc4f58ea8e18af527c5950c78  elfutils-0.186.tar.bz2
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index c64224a90f..8116ae5972 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.184
+ELFUTILS_VERSION = 0.186
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
