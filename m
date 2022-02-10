Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06298C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BA0C607F0;
	Thu, 10 Feb 2022 21:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mbULfHOOYHY0; Thu, 10 Feb 2022 21:39:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF64160E81;
	Thu, 10 Feb 2022 21:39:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 181A41BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 054AB40926
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zDJZEN0GEBtF for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:38:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C5D040576
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:38:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F2A0582DFF; Thu, 10 Feb 2022 21:30:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 22:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac89223b747add3b1bc15fa45d876d545c50cdd3
X-Git-Newrev: 4648090a89a2478a4b0fa8cc43a49bc94668622c
X-Patchwork-Hint: ignore
Message-Id: <20220210213036.F2A0582DFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lzip: bump to version 1.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=4648090a89a2478a4b0fa8cc43a49bc94668622c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.nongnu.org/archive/html/lzip-bug/2022-02/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lzip/lzip.hash | 4 ++--
 package/lzip/lzip.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index 57e7eb43f4..5e285a5ad8 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,4 @@
-# From https://lists.nongnu.org/archive/html/lzip-bug/2021-01/msg00008.html
-sha256  c3342d42e67139c165b8b128d033b5c96893a13ac5f25933190315214e87a948  lzip-1.22.tar.gz
+# From https://lists.nongnu.org/archive/html/lzip-bug/2022-02/msg00000.html
+sha256  ea02b9e6fb25d0e1a1d3ef4fdeb6ab26b931f1ece66fa1cee2983c95215e930a  lzip-1.23.tar.lz
 # Locally calculated
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index cca6da07d0..e3cc86b956 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.22
+LZIP_VERSION = 1.23
+LZIP_SOURCE = lzip-$(LZIP_VERSION).tar.lz
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
