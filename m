Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F996C7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 20:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B2FA42B91;
	Tue,  9 May 2023 20:59:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B2FA42B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75jG8HajAXQS; Tue,  9 May 2023 20:59:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E2BB42B66;
	Tue,  9 May 2023 20:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E2BB42B66
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B22B11BF86B
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8877C616A2
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8877C616A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hm1dt49F7Ezc for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 20:59:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D248660AFC
 for <buildroot@buildroot.org>; Tue,  9 May 2023 20:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D248660AFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2E73862C7; Tue,  9 May 2023 20:59:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 9 May 2023 22:21:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7ac206c52ecd7d37d8b5b6bea4876bc80f563af
X-Git-Newrev: bebf552287cb4e224d706bb6820410cc6994eb17
X-Patchwork-Hint: ignore
Message-Id: <20230509205911.C2E73862C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/restorecond: bump to version 3.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=bebf552287cb4e224d706bb6820410cc6994eb17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change the license file to LICENSE. The hash remains the same.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/restorecond/restorecond.hash | 4 ++--
 package/restorecond/restorecond.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index b38c6dcf14..215c9192f4 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  218c3d8873f31764e3c82d53ac713c0c9faaa07caf42ed7184e93ca2b27d8f27  restorecond-3.3.tar.gz
+sha256  f00d8caddb6aba2793c65e69154d04671b52f3d37e081b0e96c1b443fe23c2fe  restorecond-3.5.tar.gz
 
 # Hash for license file
-sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index 7d6ed86f08..cd40905230 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.3
+RESTORECOND_VERSION = 3.5
 RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(RESTORECOND_VERSION)
 RESTORECOND_LICENSE = GPL-2.0
-RESTORECOND_LICENSE_FILES = COPYING
+RESTORECOND_LICENSE_FILES = LICENSE
 
 RESTORECOND_DEPENDENCIES = libglib2 libsepol libselinux dbus-glib
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
