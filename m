Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22B3ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82CE040BC2;
	Sun, 11 Sep 2022 09:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82CE040BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfO4PtwCWPso; Sun, 11 Sep 2022 09:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A473540B88;
	Sun, 11 Sep 2022 09:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A473540B88
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A36CD1BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EB5F60F64
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EB5F60F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UU1VkEQyA2m4 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B56460812
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B56460812
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 769F083622; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 22:08:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3c944e4214ad30f98e0dbc5e409b4c9e9aea71d
X-Git-Newrev: 62f1164cc9084a5e9b5ff99836db9279b0228ac9
X-Patchwork-Hint: ignore
Message-Id: <20220911084828.769F083622@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzip: bump to version 1.9.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=62f1164cc9084a5e9b5ff99836db9279b0228ac9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license file (contact email address updated with
https://github.com/nih-at/libzip/commit/401ef3dd977066bc8f9b9ae53ce60934501b47d0)

https://libzip.org/news/release-1.9.2.html
https://libzip.org/news/release-1.9.1.html
https://libzip.org/news/release-1.9.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libzip/libzip.hash | 4 ++--
 package/libzip/libzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index 5afdfd7cb8..26c038e4b6 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f0763bda24ba947e80430be787c4b068d8b6aa6027a26a19923f0acfa3dac97e  libzip-1.8.0.tar.xz
-sha256  deae392de70503672793ee784d603bfa8069dcd5974a325dfbf91160f3a147d6  LICENSE
+sha256  c93e9852b7b2dc931197831438fee5295976ee0ba24f8524a8907be5c2ba5937  libzip-1.9.2.tar.xz
+sha256  01c022eca6d566e2e8792fd0f091a28653b2a608319922bcd4de91c49d1438e1  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 6bc5c5c193..0c9d66d877 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.8.0
+LIBZIP_VERSION = 1.9.2
 LIBZIP_SITE = https://libzip.org/download
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
