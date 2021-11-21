Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7104DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 363DE60D63;
	Mon,  6 Dec 2021 18:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8fcosoO9sN8; Mon,  6 Dec 2021 18:19:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FDAB60715;
	Mon,  6 Dec 2021 18:19:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 273591BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 692C484B4F
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ythbJl7SKFne for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5AFE82AAA
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5140481503; Mon,  6 Dec 2021 18:07:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:49:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 033ef8497aba5a87e3812ca474af2320fbabe72f
X-Git-Newrev: 147e2a27151f5e35311f66e374f0ec5ea9c10505
X-Patchwork-Hint: ignore
Message-Id: <20211206180740.5140481503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jpeg-turbo: bump version to 2.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=147e2a27151f5e35311f66e374f0ec5ea9c10505
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelogs:
https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.0
https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.1
https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.2

Updated license hashes due to upstream commits:
https://github.com/libjpeg-turbo/libjpeg-turbo/commits/main/LICENSE.md
https://github.com/libjpeg-turbo/libjpeg-turbo/commits/main/README.ijg

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 12 ++++++------
 package/jpeg-turbo/jpeg-turbo.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 1a22b1d6ff..de82199659 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.6/
-sha1  5406c7676d7df89fb4da791ad5af51202910fb25  libjpeg-turbo-2.0.6.tar.gz
-md5  4cada3f0bdc93d826fa31bf9e4469ef6  libjpeg-turbo-2.0.6.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.2/
+sha1  65c51c543b1fbba6db9ff5bee474ccb0b52a929f  libjpeg-turbo-2.1.2.tar.gz
+md5  e181bd78884dd5392a869209bfa41d4a  libjpeg-turbo-2.1.2.tar.gz
 # Locally computed
-sha256  d74b92ac33b0e3657123ddcf6728788c90dc84dcb6a52013d758af3c4af481bb  libjpeg-turbo-2.0.6.tar.gz
-sha256  0b7a24c3906d26dfbe24e96e9415549b387c3227140dc6b7ab2fb924254e37a1  LICENSE.md
-sha256  01ccef626ec864773c681d4a4056f72af9052d619e0609df0d369117f8b3efdf  README.ijg
+sha256  09b96cb8cbff9ea556a9c2d173485fd19488844d55276ed4f42240e1e2073ce5  libjpeg-turbo-2.1.2.tar.gz
+sha256  7d8683a7f048e715e08b4cada8b7f0d9a6ab8afad88ed09c1143ef764ecbc0f2  LICENSE.md
+sha256  4b7b9f8c03bb8d60270dfd12684e70ab21e4abfd27e73905cd1a7c4cae6f5cdb  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 5c977dc029..ddae019839 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.0.6
+JPEG_TURBO_VERSION = 2.1.2
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
