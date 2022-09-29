Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B5AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 13:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C280141B3B;
	Thu, 29 Sep 2022 13:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C280141B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GcuPBjonOHWn; Thu, 29 Sep 2022 13:52:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 881AC41B39;
	Thu, 29 Sep 2022 13:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 881AC41B39
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C07B61BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A74DB41B39
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A74DB41B39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WXieNiTl2Gpo for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 13:52:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8096A41A6A
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 13:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8096A41A6A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CF33864B9; Thu, 29 Sep 2022 13:52:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 15:52:02 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: beb98993cbd7b0ba2aa025a15a0ce9f07480d182
X-Git-Newrev: 48b2ea9a5ec4aaaa097c99627c7a1fa501056fe1
X-Patchwork-Hint: ignore
Message-Id: <20220929135247.6CF33864B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/expat: bump to
 version 2.4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=48b2ea9a5ec4aaaa097c99627c7a1fa501056fe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

https://github.com/libexpat/libexpat/blob/R_2_4_8/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c9f7150957f13973826ea621ceda37f430a0a78b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 26f1098b7a..b8e7aa27f1 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.7/
-md5  75a1f475e30281a00cb6f083ea481159  expat-2.4.7.tar.xz
-sha1  032ceaa11cd791d4bc622bbf0d835b8766207796  expat-2.4.7.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.8/
+md5  0584a7318a4c007f7ec94778799d72fe  expat-2.4.8.tar.xz
+sha1  e30345a20d0cc29a0c307eb3703e7a9bb62afa90  expat-2.4.8.tar.xz
 
 # Locally calculated
-sha256  9875621085300591f1e64c18fd3da3a0eeca4a74f884b9abac2758ad1bd07a7d  expat-2.4.7.tar.xz
+sha256  f79b8f904b749e3e0d20afeadecf8249c55b2e32d4ebb089ae378df479dcaf25  expat-2.4.8.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index a42c77e0fb..e89de81da7 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.7
+EXPAT_VERSION = 2.4.8
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
