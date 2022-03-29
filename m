Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0AAC433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 20:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9295E419C9;
	Tue, 29 Mar 2022 20:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZMsmMRWCKjG; Tue, 29 Mar 2022 20:32:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40B71419C4;
	Tue, 29 Mar 2022 20:32:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 101921BF2E3
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51433843A7
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ak0-R7kzH1eP for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 20:29:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9322F843A8
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 20:29:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5C7F285F88; Tue, 29 Mar 2022 20:20:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 22:00:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9c2f016736037f22c2c286ee63ea82189b5a3968
X-Git-Newrev: a66f78923985a838ba5a8b2ed945ba2f77c7fb11
X-Patchwork-Hint: ignore
Message-Id: <20220329202022.5C7F285F88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libbluray: bump
 to version 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a66f78923985a838ba5a8b2ed945ba2f77c7fb11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

https://code.videolan.org/videolan/libbluray/-/blob/1.3.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 49413c6d97b72ef5f44341a3dc720b902a88279b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbluray/libbluray.hash | 4 ++--
 package/libbluray/libbluray.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index 4ab8c85866..6e62bb49a1 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,4 +1,4 @@
-# From http://download.videolan.org/pub/videolan/libbluray/1.3.0/libbluray-1.3.0.tar.bz2.sha512
-sha512  3d5145e6fd7de099c07f937282112c7abb12a5590b7c0b965b00bddee3837ddfd1a30076aaa6d6278d07a5beee3856f602125983ae075ab30eceb6ac1bd9bcdc  libbluray-1.3.0.tar.bz2
+# From http://download.videolan.org/pub/videolan/libbluray/1.3.1/libbluray-1.3.1.tar.bz2.sha512
+sha512  f39fc8a11771e8fdd5eeebf0ab23535ffab44721f64b350e5d153eee44555b31c618b6d765da114254dc83ff0ff89e84c6b185f61cdbcfedd2d47a5f6e26b75a  libbluray-1.3.1.tar.bz2
 # Locally computed
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 233797f38d..a9eb3c67c6 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.3.0
+LIBBLURAY_VERSION = 1.3.1
 LIBBLURAY_SITE = http://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
