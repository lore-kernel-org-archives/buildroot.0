Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD98C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD7A260B31;
	Thu, 12 May 2022 19:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qb4tZqux5pWI; Thu, 12 May 2022 19:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D09F160B2B;
	Thu, 12 May 2022 19:53:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B9511BF9CB
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62C8A60601
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQlOgO-GVJtv for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93EA860B22
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D78E885C8A; Thu, 12 May 2022 19:41:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:49:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c11038c393a6d5bf2e0620d0c76563fd635d4aa
X-Git-Newrev: c800c9a56cbc559b61d1772ee5b7dcf9f1844ee7
X-Patchwork-Hint: ignore
Message-Id: <20220512194100.D78E885C8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_appres: bump version to
 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=c800c9a56cbc559b61d1772ee5b7dcf9f1844ee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003141.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_appres/xapp_appres.hash | 10 ++++------
 package/x11r7/xapp_appres/xapp_appres.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_appres/xapp_appres.hash b/package/x11r7/xapp_appres/xapp_appres.hash
index 8750e2d14c..17190e60e7 100644
--- a/package/x11r7/xapp_appres/xapp_appres.hash
+++ b/package/x11r7/xapp_appres/xapp_appres.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002847.html
-md5 f544e701043249d2bb3deed48314bc55  appres-1.0.5.tar.bz2
-sha1 5e5dbffd0a125732bb8bb8a202e04555a9604089  appres-1.0.5.tar.bz2
-sha256 ffad893712c81943b919e3cbfe46fc65259cc0d9eb96d5e658670e3fbb265928  appres-1.0.5.tar.bz2
-sha512 70825563cd80f0f433c48ab2fdae888072939c1b22fb22340b70b9444c97916275ed92c9e5bf9a06bb76c32a5371b89ff7c0211a9a47a227c88311078c2c4137  appres-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003141.html
+sha256  8b2257e2a0a1ad8330323aec23f07c333075d7fe4e6efd88e0c18fba8223590b  appres-1.0.6.tar.xz
+sha512  6d14f6a2ad5c83a4d42d4c51ec9a9f32652dfe7624881f1f41c0b1f4946904e7e5ca81a2fd9f4f4824488ce1bd2a4047f92320626bf33b0f1afc5e6b89d3e2b9  appres-1.0.6.tar.xz
 # Locally computed
-sha256 5969302729a9621fd526a7f9942a51a29b858e0b682ffd28eeda5fc4dfaddf55  COPYING
+sha256  5969302729a9621fd526a7f9942a51a29b858e0b682ffd28eeda5fc4dfaddf55  COPYING
diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
index 4159332bd3..9beada295c 100644
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ b/package/x11r7/xapp_appres/xapp_appres.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_APPRES_VERSION = 1.0.5
-XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.bz2
+XAPP_APPRES_VERSION = 1.0.6
+XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.xz
 XAPP_APPRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_APPRES_LICENSE = MIT
 XAPP_APPRES_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
