Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ED5C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 551D0829DC;
	Mon,  4 Apr 2022 18:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xIWC4VZcdh7X; Mon,  4 Apr 2022 18:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8740781D4D;
	Mon,  4 Apr 2022 18:14:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2E321BF294
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C08C660C16
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OtYRUuleOWyj for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:13:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15256607BC
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:13:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8541881238; Mon,  4 Apr 2022 18:04:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 20:03:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7b921e59ada62bee0f3c960dd50ac0838b96a70
X-Git-Newrev: a456a7d898977366ce48974ea0c312f1dd8ac748
X-Patchwork-Hint: ignore
Message-Id: <20220404180428.8541881238@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgeotiff: bump to version 1.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a456a7d898977366ce48974ea0c312f1dd8ac748
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license, "X style license" means MIT:
https://github.com/OSGeo/libgeotiff/commit/5d6619c1168845c5bd77686f01e197a82854cbf1)

https://github.com/OSGeo/libgeotiff/releases/tag/1.7.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libgeotiff/libgeotiff.hash | 4 ++--
 package/libgeotiff/libgeotiff.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgeotiff/libgeotiff.hash b/package/libgeotiff/libgeotiff.hash
index ec9fccb492..883199501d 100644
--- a/package/libgeotiff/libgeotiff.hash
+++ b/package/libgeotiff/libgeotiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fc304d8839ca5947cfbeb63adb9d1aa47acef38fc6d6689e622926e672a99a7e  libgeotiff-1.7.0.tar.gz
-sha256  6a22340b8293c50a34ce8e95589489bd3ec65bcb8b93e61cbda3daaafe498375  LICENSE
+sha256  05ab1347aaa471fc97347d8d4269ff0c00f30fa666d956baba37948ec87e55d6  libgeotiff-1.7.1.tar.gz
+sha256  a822a731a7ac4ba7d8f18fa0dc29db2e68a5dcfc315b46e4a4c8956720d55d93  LICENSE
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index c49528565d..6ab60c93fc 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBGEOTIFF_VERSION = 1.7.0
+LIBGEOTIFF_VERSION = 1.7.1
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
-LIBGEOTIFF_LICENSE = X11-style, public domain
+LIBGEOTIFF_LICENSE = MIT, public domain
 LIBGEOTIFF_LICENSE_FILES = LICENSE
 LIBGEOTIFF_DEPENDENCIES = proj tiff host-pkgconf
 LIBGEOTIFF_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
