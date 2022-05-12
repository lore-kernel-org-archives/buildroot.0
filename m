Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E116DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0FF540436;
	Thu, 12 May 2022 19:55:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1T48bhOV4jZ; Thu, 12 May 2022 19:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AEFF40412;
	Thu, 12 May 2022 19:55:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25F4A1BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E102560B3A
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHwyxNUZJWHj for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FCA460B6C
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8436085C6F; Thu, 12 May 2022 19:41:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:50:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79b3c44bfa4a2b03dbe82eaed59cd4afa0733252
X-Git-Newrev: 53ca8dc693d1c74a65bd202594a93729c7ad8fff
X-Patchwork-Hint: ignore
Message-Id: <20220512194101.8436085C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/libxcb: bump version to 1.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=53ca8dc693d1c74a65bd202594a93729c7ad8fff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-May/003164.html

Reformatted license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/libxcb/libxcb.hash | 8 ++++----
 package/x11r7/libxcb/libxcb.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.hash b/package/x11r7/libxcb/libxcb.hash
index 1861ef8a6b..2e2179e8da 100644
--- a/package/x11r7/libxcb/libxcb.hash
+++ b/package/x11r7/libxcb/libxcb.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-February/003039.html
-sha256 a55ed6db98d43469801262d81dc2572ed124edc3db31059d4e9916eb9f844c34  libxcb-1.14.tar.xz
-sha512 b90a23204b0d2c29d8b115577edb01df0465e02d6a8876550fecd62375d24a5d5f872ddd5946772ddba077cadce75b12c7a6d218469dc30b5b92bc82188e8bc6  libxcb-1.14.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-May/003164.html
+sha256  cc38744f817cf6814c847e2df37fcb8997357d72fa4bcbc228ae0fe47219a059  libxcb-1.15.tar.xz
+sha512  f6c7d766b7cf9cab6abe948ee424cbae6951dbfe2f76fa58a109cdc05b0f0919dcc4e38176a22ff4b95fc1e38596115317e32ba33b24cae0035a4e30dbcbdad9  libxcb-1.15.tar.xz
 # Locally computed
-sha256 c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
+sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 4cbd9cf62f..4b293f9801 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCB_VERSION = 1.14
+LIBXCB_VERSION = 1.15
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.xz
 LIBXCB_SITE = http://xcb.freedesktop.org/dist
 LIBXCB_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
