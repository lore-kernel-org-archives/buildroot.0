Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55577C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 09:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FE5840680;
	Mon, 21 Apr 2025 09:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3x__Km-V0Lx2; Mon, 21 Apr 2025 09:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E3D34086A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E3D34086A;
	Mon, 21 Apr 2025 09:50:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DCE2D68
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3A6540774
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPxTkT4TvkHv for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 09:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E19640680
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E19640680
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:50:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEE7F80236; Mon, 21 Apr 2025 09:49:59 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 10:44:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 898b6b9638ecce60c06d1afef1694b72d2b31ce3
X-Git-Newrev: 24ef1c083e973575166e9477499a69db83996a7e
X-Patchwork-Hint: ignore
Message-Id: <20250421094959.EEE7F80236@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pangomm2_46: bump to version 2.46.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=24ef1c083e973575166e9477499a69db83996a7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/pangomm/-/blob/2.46.4/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pangomm2_46/pangomm2_46.hash | 4 ++--
 package/pangomm2_46/pangomm2_46.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pangomm2_46/pangomm2_46.hash b/package/pangomm2_46/pangomm2_46.hash
index 8d05dbc2ff..eb4e1c58e9 100644
--- a/package/pangomm2_46/pangomm2_46.hash
+++ b/package/pangomm2_46/pangomm2_46.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/pangomm/2.46/pangomm-2.46.3.sha256sum
-sha256  410fe04d471a608f3f0273d3a17d840241d911ed0ff2c758a9859c66c6f24379  pangomm-2.46.3.tar.xz
+# From https://download.gnome.org/sources/pangomm/2.46/pangomm-2.46.4.sha256sum
+sha256  b92016661526424de4b9377f1512f59781f41fb16c9c0267d6133ba1cd68db22  pangomm-2.46.4.tar.xz
 # Locally computed
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/pangomm2_46/pangomm2_46.mk b/package/pangomm2_46/pangomm2_46.mk
index 1725158491..3640641af1 100644
--- a/package/pangomm2_46/pangomm2_46.mk
+++ b/package/pangomm2_46/pangomm2_46.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGOMM2_46_VERSION_MAJOR = 2.46
-PANGOMM2_46_VERSION = $(PANGOMM2_46_VERSION_MAJOR).3
+PANGOMM2_46_VERSION = $(PANGOMM2_46_VERSION_MAJOR).4
 PANGOMM2_46_SOURCE = pangomm-$(PANGOMM2_46_VERSION).tar.xz
 PANGOMM2_46_SITE = https://download.gnome.org/sources/pangomm/$(PANGOMM2_46_VERSION_MAJOR)
 PANGOMM2_46_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
