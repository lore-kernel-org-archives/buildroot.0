Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4C4C38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACA124081F;
	Mon, 24 Oct 2022 21:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACA124081F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ncnkGPXu4w5F; Mon, 24 Oct 2022 21:44:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20C6C40474;
	Mon, 24 Oct 2022 21:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20C6C40474
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32B621BF976
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5804C40325
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5804C40325
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P1DNswhJD9CF for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:43:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8569402E8
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8569402E8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C31728704A; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 23:27:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa371ee5341b8a3e445d83557a413c821fd0309d
X-Git-Newrev: cf8e0288c003b39ebc852cb3876c3b78608296ff
X-Patchwork-Hint: ignore
Message-Id: <20221024214302.C31728704A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lensfun: bump to version 0.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf8e0288c003b39ebc852cb3876c3b78608296ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to new upstream site to get latest release

https://lensfun.github.io/changelog/2022/02/22/Release-0.3.3-Changelog/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lensfun/Config.in    | 2 +-
 package/lensfun/lensfun.hash | 5 +----
 package/lensfun/lensfun.mk   | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/lensfun/Config.in b/package/lensfun/Config.in
index 7ec49020ee..7c424f5351 100644
--- a/package/lensfun/Config.in
+++ b/package/lensfun/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LENSFUN
 	  actually use Lensfun to process your images you need an
 	  image editing application with Lensfun support.
 
-	  http://lensfun.sourceforge.net
+	  https://lensfun.github.io
 
 if BR2_PACKAGE_LENSFUN
 
diff --git a/package/lensfun/lensfun.hash b/package/lensfun/lensfun.hash
index cb56f32b56..f03d0b54ae 100644
--- a/package/lensfun/lensfun.hash
+++ b/package/lensfun/lensfun.hash
@@ -1,7 +1,4 @@
-# From https://sourceforge.net/projects/lensfun/files/0.3.2
-sha1  1d978b15aa7304d66a4931fa37ca9f8f89396c16  lensfun-0.3.2.tar.gz
-md5  247e59a0812ec451f6cd0d20b3379cb5  lensfun-0.3.2.tar.gz
 # Locally calculated
-sha256  ae8bcad46614ca47f5bda65b00af4a257a9564a61725df9c74cb260da544d331  lensfun-0.3.2.tar.gz
+sha256  57ba5a0377f24948972339e18be946af12eda22b7c707eb0ddd26586370f6765  lensfun-0.3.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  docs/gpl-3.0.txt
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  docs/lgpl-3.0.txt
diff --git a/package/lensfun/lensfun.mk b/package/lensfun/lensfun.mk
index 9258409f57..f82ed44495 100644
--- a/package/lensfun/lensfun.mk
+++ b/package/lensfun/lensfun.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LENSFUN_VERSION = 0.3.2
-LENSFUN_SITE = https://sourceforge.net/projects/lensfun/files/$(LENSFUN_VERSION)
+LENSFUN_VERSION = 0.3.3
+LENSFUN_SITE = $(call github,lensfun,lensfun,v$(LENSFUN_VERSION))
 LENSFUN_LICENSE = LGPL-3.0+ (libraries), GPL-3.0+ (programs)
 LENSFUN_LICENSE_FILES = docs/gpl-3.0.txt docs/lgpl-3.0.txt
 LENSFUN_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
