Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168C9C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 20:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B992A40541;
	Wed,  9 Mar 2022 20:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8IVTjpdjYi_e; Wed,  9 Mar 2022 20:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34D564051F;
	Wed,  9 Mar 2022 20:28:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6419F1BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 544768431C
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JcEmIBLbms-8 for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 20:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81B2A8430E
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 20:28:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4BF5783949; Wed,  9 Mar 2022 20:19:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 9 Mar 2022 21:26:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1f3dacf4568dc1b995ca89ed04b44d2cf2416a4
X-Git-Newrev: f73e257cdf859c67ed2c3769f9ef15dc8f9b4878
X-Patchwork-Hint: ignore
Message-Id: <20220309201939.4BF5783949@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jpeg-turbo: bump to version 2.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f73e257cdf859c67ed2c3769f9ef15dc8f9b4878
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license file (date updated with
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/172972394a51352d0b67c30f20041e69a98d78b7)

https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 10 +++++-----
 package/jpeg-turbo/jpeg-turbo.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index de82199659..a892fd3eaa 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.2/
-sha1  65c51c543b1fbba6db9ff5bee474ccb0b52a929f  libjpeg-turbo-2.1.2.tar.gz
-md5  e181bd78884dd5392a869209bfa41d4a  libjpeg-turbo-2.1.2.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.3/
+sha1  6dec48193bb27e1c07abae8230031ce9ecb1cfec  libjpeg-turbo-2.1.3.tar.gz
+md5  85244dedeaf06f636a9e7ddea6d236d8  libjpeg-turbo-2.1.3.tar.gz
 # Locally computed
-sha256  09b96cb8cbff9ea556a9c2d173485fd19488844d55276ed4f42240e1e2073ce5  libjpeg-turbo-2.1.2.tar.gz
-sha256  7d8683a7f048e715e08b4cada8b7f0d9a6ab8afad88ed09c1143ef764ecbc0f2  LICENSE.md
+sha256  467b310903832b033fe56cd37720d1b73a6a3bd0171dbf6ff0b620385f4f76d0  libjpeg-turbo-2.1.3.tar.gz
+sha256  ee1eaf194d5924b6360af8a6ba6a4e1554037091f7505943300cdeec65f1aebb  LICENSE.md
 sha256  4b7b9f8c03bb8d60270dfd12684e70ab21e4abfd27e73905cd1a7c4cae6f5cdb  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index ddae019839..475eb5fa84 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.1.2
+JPEG_TURBO_VERSION = 2.1.3
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
