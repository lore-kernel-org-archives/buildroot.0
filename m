Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F5BC77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 19:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0C0040589;
	Mon,  8 May 2023 19:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0C0040589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_Mcis8BVtj3; Mon,  8 May 2023 19:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F119442A9A;
	Mon,  8 May 2023 19:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F119442A9A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 199801BF867
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D468542A90
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D468542A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6R2zvYOWsh4K for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 19:23:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E965E41D2E
 for <buildroot@buildroot.org>; Mon,  8 May 2023 19:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E965E41D2E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D86428618F; Mon,  8 May 2023 19:23:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 21:21:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a45c5f515d746adb09147f18585a78eb9a7557d
X-Git-Newrev: feb16bd9878bcde7d690a1887604ddc861f5f30d
X-Patchwork-Hint: ignore
Message-Id: <20230508192310.D86428618F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibmm2_66: bump to version 2.66.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=feb16bd9878bcde7d690a1887604ddc861f5f30d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/glibmm/-/raw/2.66.6/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibmm2_66/glibmm2_66.hash | 4 ++--
 package/glibmm2_66/glibmm2_66.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibmm2_66/glibmm2_66.hash b/package/glibmm2_66/glibmm2_66.hash
index b7d19b261c..19272d2b90 100644
--- a/package/glibmm2_66/glibmm2_66.hash
+++ b/package/glibmm2_66/glibmm2_66.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.5.sha256sum
-sha256  7b384662dd6ec3b86c0570331d32af05db2bd99a791602b767b4a0b2566ec149  glibmm-2.66.5.tar.xz
+# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.6.sha256sum
+sha256  5358742598181e5351d7bf8da072bf93e6dd5f178d27640d4e462bc8f14e152f  glibmm-2.66.6.tar.xz
 # License files, locally calculated
 sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/glibmm2_66/glibmm2_66.mk b/package/glibmm2_66/glibmm2_66.mk
index b58c7ca8df..7f28342c52 100644
--- a/package/glibmm2_66/glibmm2_66.mk
+++ b/package/glibmm2_66/glibmm2_66.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GLIBMM2_66_VERSION_MAJOR = 2.66
-GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).5
+GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).6
 GLIBMM2_66_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM2_66_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM2_66_SOURCE = glibmm-$(GLIBMM2_66_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
