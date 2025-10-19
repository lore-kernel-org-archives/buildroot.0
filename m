Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28D0CCD195
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 19:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8242F84043;
	Sun, 19 Oct 2025 19:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NZ8Uq5O-IAL; Sun, 19 Oct 2025 19:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC79C84044
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC79C84044;
	Sun, 19 Oct 2025 19:36:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F08D1CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 656D640C64
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzYj3EdHQ4Tf for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 19:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9B3740A8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9B3740A8B
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:36:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3AAD87655; Sun, 19 Oct 2025 19:36:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 21:33:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52101ad09260c1874065b165167424794815ad14
X-Git-Newrev: c531fe65209defd356e5ee8142896478a20ab371
X-Patchwork-Hint: ignore
Message-Id: <20251019193635.A3AAD87655@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jpeg-turbo: bump to version 3.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c531fe65209defd356e5ee8142896478a20ab371
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/f2d1f1cbd431b5b5e3c0c354bddbf8360cdcabd1

Release notes:
https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.1
https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jpeg-turbo/jpeg-turbo.hash | 4 ++--
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 821e78438b..d6373f4998 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  9564c72b1dfd1d6fe6274c5f95a8d989b59854575d4bbee44ade7bc17aa9bc93  libjpeg-turbo-3.1.0.tar.gz
-sha256  96f5b328adbb78eeaaec6980d73fd558cb1e4d62560ed615646bc3cf5e532430  LICENSE.md
+sha256  8f0012234b464ce50890c490f18194f913a7b1f4e6a03d6644179fa0f867d0cf  libjpeg-turbo-3.1.2.tar.gz
+sha256  2189dc45a8fe96204069f8124caa53a148dfdc193f50f584c6ca7849a6072872  LICENSE.md
 sha256  75815e3bf6484201a3c3d17a1bbf10f2e8e3237f84df10a2357ea896db2a81d6  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index df76e4d92a..a25f9e3f38 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 3.1.0
+JPEG_TURBO_VERSION = 3.1.2
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
