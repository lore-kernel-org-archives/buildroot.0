Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6B0C7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 22:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42BAC4156F;
	Thu,  8 Jun 2023 22:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42BAC4156F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tc9VPJJdDq0x; Thu,  8 Jun 2023 22:11:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BFE64154A;
	Thu,  8 Jun 2023 22:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BFE64154A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34FC71BF97D
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 22:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F0208408D
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 22:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F0208408D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DtSE_k1BDJwV for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 22:11:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AA0B84075
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 22:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AA0B84075
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7FC2821FA; Thu,  8 Jun 2023 22:11:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Jun 2023 23:05:09 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d1432aa62314a5d78db7e380729a44754d8d6227
X-Git-Newrev: bff0536e4c642ff87c8a3f45a6d42d34a096b5fd
X-Patchwork-Hint: ignore
Message-Id: <20230608221116.E7FC2821FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/glibmm2_66: bump
 to version 2.66.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=bff0536e4c642ff87c8a3f45a6d42d34a096b5fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

https://gitlab.gnome.org/GNOME/glibmm/-/raw/2.66.6/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit feb16bd9878bcde7d690a1887604ddc861f5f30d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
