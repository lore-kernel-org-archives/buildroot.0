Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EF0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6D5360E5A;
	Sat, 12 Mar 2022 17:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1yBY4i_vf4m; Sat, 12 Mar 2022 17:10:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B190C60BD5;
	Sat, 12 Mar 2022 17:10:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D12521BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD65F404BF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VCWksqIjSdO2 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:09:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC20D401D5
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 20EA582AD8; Sat, 12 Mar 2022 17:01:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 18:08:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a599e9f3717bc9c875b6ebed0f1baa8310ed096
X-Git-Newrev: f8aefa8807ecaf219b0dc7988e6bd14c70c9c761
X-Patchwork-Hint: ignore
Message-Id: <20220312170118.20EA582AD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnids: bump version to 1.26
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8aefa8807ecaf219b0dc7988e6bd14c70c9c761
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change repo source to official github.com repository which
is actively maintained. Previous sourceforge.net sources
remained untouched since 2010.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libnids/libnids.hash | 4 ++--
 package/libnids/libnids.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libnids/libnids.hash b/package/libnids/libnids.hash
index 4a2949c39d..e51dbf151c 100644
--- a/package/libnids/libnids.hash
+++ b/package/libnids/libnids.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 314b4793e0902fbf1fdb7fb659af37a3c1306ed1aad5d1c84de6c931b351d359  libnids-1.24.tar.gz
-sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
+sha256  3f3e9f99a83cd37bc74af83d415c5e3a7505f5b190dfaf456b0849e0054f6733  libnids-1.26.tar.gz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index 3e36838c40..57e68654dc 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNIDS_VERSION = 1.24
-LIBNIDS_SITE = https://sourceforge.net/projects/libnids/files/libnids/$(LIBNIDS_VERSION)
+LIBNIDS_VERSION = 1.26
+LIBNIDS_SITE = $(call github,MITRECND,libnids,$(LIBNIDS_VERSION),$(LIBNIDS_VERSION).tar.gz)
 LIBNIDS_LICENSE = GPL-2.0
 LIBNIDS_LICENSE_FILES = COPYING
 LIBNIDS_CPE_ID_VENDOR = libnids_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
