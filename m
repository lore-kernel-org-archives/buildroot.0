Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895F1C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 17:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2146F4054B;
	Sat,  5 Feb 2022 17:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WzhWWrfz1rVY; Sat,  5 Feb 2022 17:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D5214052D;
	Sat,  5 Feb 2022 17:28:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B72771BF30E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 17:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A56694028C
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 17:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BVB_76gRbHVy for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 17:28:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F110B40259
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 17:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 67374827A2; Sat,  5 Feb 2022 17:21:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 18:23:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53fa10f4c91598d49c37b30ddce84daaf7d50216
X-Git-Newrev: 9229054bd54e49d868a5403401d407605297bfb6
X-Patchwork-Hint: ignore
Message-Id: <20220205172122.67374827A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgeotiff: bump to version 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9229054bd54e49d868a5403401d407605297bfb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/OSGeo/libgeotiff/releases/tag/1.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgeotiff/libgeotiff.hash | 2 +-
 package/libgeotiff/libgeotiff.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeotiff/libgeotiff.hash b/package/libgeotiff/libgeotiff.hash
index 51adcc2843..ec9fccb492 100644
--- a/package/libgeotiff/libgeotiff.hash
+++ b/package/libgeotiff/libgeotiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9311017e5284cffb86f2c7b7a9df1fb5ebcdc61c30468fb2e6bca36e4272ebca  libgeotiff-1.6.0.tar.gz
+sha256  fc304d8839ca5947cfbeb63adb9d1aa47acef38fc6d6689e622926e672a99a7e  libgeotiff-1.7.0.tar.gz
 sha256  6a22340b8293c50a34ce8e95589489bd3ec65bcb8b93e61cbda3daaafe498375  LICENSE
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index c6fb61b4a2..c49528565d 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOTIFF_VERSION = 1.6.0
+LIBGEOTIFF_VERSION = 1.7.0
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_LICENSE = X11-style, public domain
 LIBGEOTIFF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
