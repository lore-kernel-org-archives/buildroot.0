Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5382C77B7C
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 21:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5020442B91;
	Tue,  9 May 2023 21:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5020442B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcvJnRTXrdci; Tue,  9 May 2023 21:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 741FC42B67;
	Tue,  9 May 2023 21:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 741FC42B67
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED08F1BF2FF
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D910542050
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D910542050
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GgEJNI2nEk_r for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 20:59:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AED2542734
 for <buildroot@buildroot.org>; Tue,  9 May 2023 20:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AED2542734
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96625862C8; Tue,  9 May 2023 20:59:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 9 May 2023 22:08:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e960f272b24d44efb2b362914d617ccb1c582d4
X-Git-Newrev: e7dbd3cee0d71b30de63ef957f25225af6bcbc8f
X-Patchwork-Hint: ignore
Message-Id: <20230509205911.96625862C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsemanage: bump to version 3.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7dbd3cee0d71b30de63ef957f25225af6bcbc8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change the license file to LICENSE. The hash remains the same.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsemanage/libsemanage.hash | 4 ++--
 package/libsemanage/libsemanage.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 1f333aac30..73df34bde9 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  84d0ec5afa34bbbb471f602d8c1bf317d12443d07852a34b60741d428d597ce8  libsemanage-3.3.tar.gz
+sha256  f53534e50247538280ed0d76c6ce81d8fb3939bd64cadb89da10dba42e40dd9c  libsemanage-3.5.tar.gz
 
 # Hash for license file
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index db9f16bb6a..0fbdc5ae8d 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 3.3
+LIBSEMANAGE_VERSION = 3.5
 LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEMANAGE_VERSION)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
-LIBSEMANAGE_LICENSE_FILES = COPYING
+LIBSEMANAGE_LICENSE_FILES = LICENSE
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux bzip2
 LIBSEMANAGE_CPE_ID_VENDOR = selinuxproject
 LIBSEMANAGE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
