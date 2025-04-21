Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0867C369D3
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 09:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F2A2812EB;
	Mon, 21 Apr 2025 09:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9u5dSahauWK; Mon, 21 Apr 2025 09:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BE29812F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BE29812F9;
	Mon, 21 Apr 2025 09:50:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EDD91C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC3B940842
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDK4MBVuYvgR for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 09:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BA58406CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BA58406CE
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:50:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2820C80236; Mon, 21 Apr 2025 09:50:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 10:44:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 592a9d07747d2d43ab72173ad3408657ff58a0dc
X-Git-Newrev: 34fdd488bd1684f906568f0c630f9fec5abaf330
X-Patchwork-Hint: ignore
Message-Id: <20250421095000.2820C80236@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibmm2_66: bump to version 2.66.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=34fdd488bd1684f906568f0c630f9fec5abaf330
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.66.8/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibmm2_66/glibmm2_66.hash | 4 ++--
 package/glibmm2_66/glibmm2_66.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibmm2_66/glibmm2_66.hash b/package/glibmm2_66/glibmm2_66.hash
index 19272d2b90..20249977e8 100644
--- a/package/glibmm2_66/glibmm2_66.hash
+++ b/package/glibmm2_66/glibmm2_66.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.6.sha256sum
-sha256  5358742598181e5351d7bf8da072bf93e6dd5f178d27640d4e462bc8f14e152f  glibmm-2.66.6.tar.xz
+# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.8.sha256sum
+sha256  64f11d3b95a24e2a8d4166ecff518730f79ecc27222ef41faf7c7e0340fc9329  glibmm-2.66.8.tar.xz
 # License files, locally calculated
 sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/glibmm2_66/glibmm2_66.mk b/package/glibmm2_66/glibmm2_66.mk
index 7f28342c52..bbf1a97f3f 100644
--- a/package/glibmm2_66/glibmm2_66.mk
+++ b/package/glibmm2_66/glibmm2_66.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GLIBMM2_66_VERSION_MAJOR = 2.66
-GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).6
+GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).8
 GLIBMM2_66_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM2_66_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM2_66_SOURCE = glibmm-$(GLIBMM2_66_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
