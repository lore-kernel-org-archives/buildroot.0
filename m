Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D997BC43334
	for <buildroot@archiver.kernel.org>; Thu,  7 Jul 2022 13:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76A1E41A69;
	Thu,  7 Jul 2022 13:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A1E41A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rKnFSXI_Z-8t; Thu,  7 Jul 2022 13:16:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 437C141A66;
	Thu,  7 Jul 2022 13:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 437C141A66
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B6BB1BF40E
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 13:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 177F984064
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 13:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 177F984064
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iddnq6AvKB62 for <buildroot@lists.busybox.net>;
 Thu,  7 Jul 2022 13:16:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3852984027
 for <buildroot@buildroot.org>; Thu,  7 Jul 2022 13:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3852984027
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D220383537; Thu,  7 Jul 2022 13:03:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Jul 2022 15:15:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb7bd0cc4f5437665dc059659c33775330effdfd
X-Git-Newrev: 3eb61f5884539f5ecf26c86d19ec64962f034e51
X-Patchwork-Hint: ignore
Message-Id: <20220707130304.D220383537@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kbd: bump to version 2.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3eb61f5884539f5ecf26c86d19ec64962f034e51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYING (upstream license file used since
https://github.com/legionus/kbd/commit/1c47fec4fe12dc016bc1d881d19c48a37504bbc0)

https://github.com/legionus/kbd/releases/tag/v2.5.0
https://github.com/legionus/kbd/releases/tag/v2.5.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kbd/kbd.hash | 4 ++--
 package/kbd/kbd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
index 324ba065d0..63f7286d30 100644
--- a/package/kbd/kbd.hash
+++ b/package/kbd/kbd.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
-sha256  55f0740458cfd3a84e775e50d7e8b92dc01846db1edad8e2411ccc293ece9b9f  kbd-2.4.0.tar.xz
-sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
+sha256  ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683  kbd-2.5.1.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index ea2c00a373..15912419f8 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KBD_VERSION = 2.4.0
+KBD_VERSION = 2.5.1
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
