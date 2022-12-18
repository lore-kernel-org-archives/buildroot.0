Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF69DC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E69E82560;
	Mon, 20 Feb 2023 23:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E69E82560
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfZABPSbPFZp; Mon, 20 Feb 2023 23:04:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C97928276E;
	Mon, 20 Feb 2023 23:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C97928276E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3E4D1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A42CB612CA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A42CB612CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ccckkurgm5R for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7C4C612BA
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7C4C612BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B495686495; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:45:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d005917d7256c79b2f50010d48f36846333a457a
X-Git-Newrev: 4b879cfe0e2b03373bdedc7ae97b956aa102e486
X-Patchwork-Hint: ignore
Message-Id: <20230220205211.B495686495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libfreeglut: bump
 version to 3.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b879cfe0e2b03373bdedc7ae97b956aa102e486
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/FreeGLUTProject/freeglut/releases/tag/v3.4.0

Upstream switched to github:
https://freeglut.sourceforge.net/news.php
https://sourceforge.net/p/freeglut/mailman/message/37622871/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfreeglut/libfreeglut.hash | 5 +----
 package/libfreeglut/libfreeglut.mk   | 4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/libfreeglut/libfreeglut.hash b/package/libfreeglut/libfreeglut.hash
index ce9fb9e299..249a780f04 100644
--- a/package/libfreeglut/libfreeglut.hash
+++ b/package/libfreeglut/libfreeglut.hash
@@ -1,6 +1,3 @@
-# From http://sourceforge.net/projects/freeglut/files/freeglut/3.2.2/
-md5  485c1976165315fc42c0b0a1802816d9  freeglut-3.2.2.tar.gz
-sha1  8e53cc0251165d02cce8d6d5054159c310958b74  freeglut-3.2.2.tar.gz
 # Locally computed
-sha256  c5944a082df0bba96b5756dddb1f75d0cd72ce27b5395c6c1dde85c2ff297a50  freeglut-3.2.2.tar.gz
+sha256  3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec  freeglut-3.4.0.tar.gz
 sha256  b6593d5ec4c113a274abb85b10e8615895cb0ddb89f7912af5fe5aa8df38a275  COPYING
diff --git a/package/libfreeglut/libfreeglut.mk b/package/libfreeglut/libfreeglut.mk
index 484b0f4b97..09309aeceb 100644
--- a/package/libfreeglut/libfreeglut.mk
+++ b/package/libfreeglut/libfreeglut.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBFREEGLUT_VERSION = 3.2.2
+LIBFREEGLUT_VERSION = 3.4.0
 LIBFREEGLUT_SOURCE = freeglut-$(LIBFREEGLUT_VERSION).tar.gz
-LIBFREEGLUT_SITE = http://downloads.sourceforge.net/freeglut
+LIBFREEGLUT_SITE = https://github.com/FreeGLUTProject/freeglut/releases/download/v$(LIBFREEGLUT_VERSION)
 LIBFREEGLUT_LICENSE = MIT
 LIBFREEGLUT_LICENSE_FILES = COPYING
 LIBFREEGLUT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
