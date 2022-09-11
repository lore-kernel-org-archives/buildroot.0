Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D61C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 18:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AF246FC2C;
	Sun, 11 Sep 2022 18:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AF246FC2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FHDD2mONQckw; Sun, 11 Sep 2022 18:25:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B43F36FC29;
	Sun, 11 Sep 2022 18:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B43F36FC29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51ED41BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B95E41888
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B95E41888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2NuGO5ugvQ3g for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 18:25:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49565400C6
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 18:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49565400C6
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 35433836CF; Sun, 11 Sep 2022 18:25:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 20:24:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ac4aa795ab8b6081f5fc1af3b1243c33cf28bc3
X-Git-Newrev: f7c841c75e84faedf2628a556b1e0bbbafbbf210
X-Patchwork-Hint: ignore
Message-Id: <20220911182524.35433836CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jpeg-turbo: bump to version 2.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7c841c75e84faedf2628a556b1e0bbbafbbf210
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jpeg-turbo/jpeg-turbo.hash | 8 ++++----
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index a892fd3eaa..6e1278b48a 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.3/
-sha1  6dec48193bb27e1c07abae8230031ce9ecb1cfec  libjpeg-turbo-2.1.3.tar.gz
-md5  85244dedeaf06f636a9e7ddea6d236d8  libjpeg-turbo-2.1.3.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.4/
+sha1  5a355c08caa326cef7c2a61e062edfe8dd02ac07  libjpeg-turbo-2.1.4.tar.gz
+md5  3241b54016c445e5d8f0ebb0ad9294ed  libjpeg-turbo-2.1.4.tar.gz
 # Locally computed
-sha256  467b310903832b033fe56cd37720d1b73a6a3bd0171dbf6ff0b620385f4f76d0  libjpeg-turbo-2.1.3.tar.gz
+sha256  d3ed26a1131a13686dfca4935e520eb7c90ae76fbc45d98bb50a8dc86230342b  libjpeg-turbo-2.1.4.tar.gz
 sha256  ee1eaf194d5924b6360af8a6ba6a4e1554037091f7505943300cdeec65f1aebb  LICENSE.md
 sha256  4b7b9f8c03bb8d60270dfd12684e70ab21e4abfd27e73905cd1a7c4cae6f5cdb  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 475eb5fa84..e5bc8e7cf2 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.1.3
+JPEG_TURBO_VERSION = 2.1.4
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
