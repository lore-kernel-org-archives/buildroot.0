Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9ACECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 10:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B41964098F;
	Sun, 28 Aug 2022 10:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B41964098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZ89mBzDwx3n; Sun, 28 Aug 2022 10:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69A564090E;
	Sun, 28 Aug 2022 10:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69A564090E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30C7C1BF5AA
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BEF160585
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BEF160585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YquQ7jNbkDH7 for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 10:15:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4460E6002E
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 10:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4460E6002E
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 98F6687EA2; Sun, 28 Aug 2022 10:00:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 12:11:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6c7061f3a855d789a225a78ec0c96882463c8c17
X-Git-Newrev: 836f49e7f9c6a536e6ddb96fff541b4373eabb02
X-Patchwork-Hint: ignore
Message-Id: <20220828100020.98F6687EA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libxslt: bump to
 version 1.1.36
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

commit: https://git.buildroot.net/buildroot/commit/?id=836f49e7f9c6a536e6ddb96fff541b4373eabb02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://gitlab.gnome.org/GNOME/libxslt/-/tags/v1.1.36

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libxslt/libxslt.hash | 4 ++--
 package/libxslt/libxslt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index 39523a6953..8d1a2af193 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
-# from https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.35.sha256sum
-sha256  8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79  libxslt-1.1.35.tar.xz
+# from https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.36.sha256sum
+sha256  12848f0a4408f65b530d3962cd9ff670b6ae796191cfeff37522b5772de8dc8e  libxslt-1.1.36.tar.xz
 
 # Hash for license file:
 sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  COPYING
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index df0286e986..d908e3c552 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.35
+LIBXSLT_VERSION = 1.1.36
 LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
 LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
 LIBXSLT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
