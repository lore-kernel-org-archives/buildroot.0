Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4556C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AF6161116;
	Thu,  9 Jun 2022 20:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fudPnaoXlQz; Thu,  9 Jun 2022 20:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 083226060A;
	Thu,  9 Jun 2022 20:44:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 326611C1135
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EEC640ADD
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3KpZj2uvm9ly for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:43:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 688FA40327
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:43:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A1A0186F1D; Thu,  9 Jun 2022 20:31:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:43:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 637437b1d5215717463454a17abc1b578b2e5778
X-Git-Newrev: c9f7150957f13973826ea621ceda37f430a0a78b
X-Patchwork-Hint: ignore
Message-Id: <20220609203153.A1A0186F1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: bump to version 2.4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9f7150957f13973826ea621ceda37f430a0a78b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/libexpat/libexpat/blob/R_2_4_8/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
