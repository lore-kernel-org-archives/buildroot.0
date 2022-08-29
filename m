Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92F7ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 578C24088D;
	Mon, 29 Aug 2022 20:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 578C24088D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flGOjt4xJRXF; Mon, 29 Aug 2022 20:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 556A84088B;
	Mon, 29 Aug 2022 20:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 556A84088B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09D061BF3D9
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9ECA813D9
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9ECA813D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GepImxjUaLtN for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:08:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 152C3813D2
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 152C3813D2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 385F687FC0; Mon, 29 Aug 2022 19:53:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 22:08:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c3c944e4214ad30f98e0dbc5e409b4c9e9aea71d
X-Git-Newrev: 62f1164cc9084a5e9b5ff99836db9279b0228ac9
X-Patchwork-Hint: ignore
Message-Id: <20220829195336.385F687FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libzip: bump to
 version 1.9.2
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
