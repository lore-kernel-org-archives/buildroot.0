Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5027C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 12:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8072260E2E;
	Thu, 17 Mar 2022 12:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cysUWuKdktZF; Thu, 17 Mar 2022 12:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A76A8612C3;
	Thu, 17 Mar 2022 12:10:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 777041BF36E
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B2A94046A
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uG-b8i1hRjEs for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 12:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 492FF40141
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 12:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B3423841CD; Thu, 17 Mar 2022 12:01:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 08:46:19 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: ef91c95dafa91b4b685a13acda616544fafb8c5a
X-Git-Newrev: f22eb3abec86226135141c31374e8a19c7bdb2b1
X-Patchwork-Hint: ignore
Message-Id: <20220317120131.B3423841CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/expat: bump to
 version 2.4.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=f22eb3abec86226135141c31374e8a19c7bdb2b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

This release relaxes the fix to CVE-2022-25236 (introduced with release
2.4.5) which some of you have been waiting for, due to related
incompatibilities.

https://blog.hartwork.org/posts/expat-2-4-7-released
https://github.com/libexpat/libexpat/blob/R_2_4_7/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 402d85ef4e3d5161869d5da918ec679a9571c417)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 0d9f60931f..26f1098b7a 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.6/
-md5  22a30c888752fdda9f8dd1b7281c54b0  expat-2.4.6.tar.xz
-sha1  26e223c4795c242814b0e3299a5027c22b9dc733  expat-2.4.6.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.7/
+md5  75a1f475e30281a00cb6f083ea481159  expat-2.4.7.tar.xz
+sha1  032ceaa11cd791d4bc622bbf0d835b8766207796  expat-2.4.7.tar.xz
 
 # Locally calculated
-sha256  de55794b7a9bc214852fdc075beaaecd854efe1361597e6268ee87946951289b  expat-2.4.6.tar.xz
+sha256  9875621085300591f1e64c18fd3da3a0eeca4a74f884b9abac2758ad1bd07a7d  expat-2.4.7.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index c481b5c225..b29b0e1d26 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.6
+EXPAT_VERSION = 2.4.7
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
