Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E656C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10DE240347;
	Wed,  6 Jul 2022 21:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10DE240347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRH_10kPtCGI; Wed,  6 Jul 2022 21:29:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFE71402AF;
	Wed,  6 Jul 2022 21:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFE71402AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CEBD1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05A0261011
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05A0261011
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHFoq_A6GlAJ for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:28:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 141FE6112B
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 141FE6112B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3150F82BC8; Wed,  6 Jul 2022 21:15:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:28:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07b7f88668b1e51e3d17e14bd8795ef042df144e
X-Git-Newrev: cbd365b748b09c50cd2c89a3aea7db838e96919b
X-Patchwork-Hint: ignore
Message-Id: <20220706211543.3150F82BC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdvdread: bump to version 6.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbd365b748b09c50cd2c89a3aea7db838e96919b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://code.videolan.org/videolan/libdvdread/-/blob/6.1.3/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdvdread/libdvdread.hash | 8 ++++----
 package/libdvdread/libdvdread.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index de9afcfa30..7fe0210727 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,7 +1,7 @@
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.2/libdvdread-6.1.2.tar.bz2.sha1
-sha1  789d0780fbdcd7d6dadf0fda3d4a4b6198c16393  libdvdread-6.1.2.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.2/libdvdread-6.1.2.tar.bz2.sha256
-sha256  cc190f553758ced7571859e301f802cb4821f164d02bfacfd320c14a4e0da763  libdvdread-6.1.2.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.1.3/libdvdread-6.1.3.tar.bz2.sha1
+sha1  5e5721ff6ed01a9af9214be0d6563303e8bf2bed  libdvdread-6.1.3.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.1.3/libdvdread-6.1.3.tar.bz2.sha256
+sha256  ce35454997a208cbe50e91232f0e73fb1ac3471965813a13b8730a8f18a15369  libdvdread-6.1.3.tar.bz2
 
 # Hash for license file:
 sha256  d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572  COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 9ddb6721c7..bc486891ce 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 6.1.2
+LIBDVDREAD_VERSION = 6.1.3
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
 LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
