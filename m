Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B82BC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C11A707C3;
	Mon, 19 May 2025 10:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ha3RY2RCQ8vp; Mon, 19 May 2025 10:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BE59707C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BE59707C7;
	Mon, 19 May 2025 10:53:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10B7FD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7851A411FB
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeSMFVhrAYBi for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD1F64121D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD1F64121D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B968882A2E; Mon, 19 May 2025 10:39:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 10:44:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e984d89e1980b0bfc8d4fc0a7a3584ba5120bd93
X-Git-Newrev: 898b6b9638ecce60c06d1afef1694b72d2b31ce3
X-Patchwork-Hint: ignore
Message-Id: <20250519103953.B968882A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/atkmm2_28: bump to
 version 2.28.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=898b6b9638ecce60c06d1afef1694b72d2b31ce3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://gitlab.gnome.org/GNOME/atkmm/-/blob/2.28.4/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/atkmm2_28/atkmm2_28.hash | 4 ++--
 package/atkmm2_28/atkmm2_28.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atkmm2_28/atkmm2_28.hash b/package/atkmm2_28/atkmm2_28.hash
index 776c9851b8..b7c106d2d0 100644
--- a/package/atkmm2_28/atkmm2_28.hash
+++ b/package/atkmm2_28/atkmm2_28.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/atkmm/2.28/atkmm-2.28.3.sha256sum
-sha256  7c2088b486a909be8da2b18304e56c5f90884d1343c8da7367ea5cd3258b9969  atkmm-2.28.3.tar.xz
+# From https://download.gnome.org/sources/atkmm/2.28/atkmm-2.28.4.sha256sum
+sha256  0a142a8128f83c001efb8014ee463e9a766054ef84686af953135e04d28fdab3  atkmm-2.28.4.tar.xz
 # locally computed
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/atkmm2_28/atkmm2_28.mk b/package/atkmm2_28/atkmm2_28.mk
index b56da61ec0..47924e64b6 100644
--- a/package/atkmm2_28/atkmm2_28.mk
+++ b/package/atkmm2_28/atkmm2_28.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ATKMM2_28_VERSION_MAJOR = 2.28
-ATKMM2_28_VERSION = $(ATKMM2_28_VERSION_MAJOR).3
+ATKMM2_28_VERSION = $(ATKMM2_28_VERSION_MAJOR).4
 ATKMM2_28_SOURCE = atkmm-$(ATKMM2_28_VERSION).tar.xz
 ATKMM2_28_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM2_28_VERSION_MAJOR)
 ATKMM2_28_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
