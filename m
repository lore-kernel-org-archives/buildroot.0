Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6854C71136
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 21:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6361981307;
	Mon, 16 Jun 2025 21:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FozjZk5v-_pW; Mon, 16 Jun 2025 21:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 993FC8131A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 993FC8131A;
	Mon, 16 Jun 2025 21:02:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E53DE151
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBF1440175
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 21:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXWOK4khddoh for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 21:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12E9E40970
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12E9E40970
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 21:02:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFD9583AC8; Mon, 16 Jun 2025 21:02:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Jun 2025 22:57:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a085462e4e782fd2bd2779cd786e8e9f6ef46de
X-Git-Newrev: 93b40835dbc4fbffa6fd4a44e6e3771c8a867a91
X-Patchwork-Hint: ignore
Message-Id: <20250616210214.DFD9583AC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=93b40835dbc4fbffa6fd4a44e6e3771c8a867a91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to upstream commit:
https://github.com/tvheadend/tvheadend/commit/0eea8a59f0834e2a3babdd8028c02509428a097c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tvheadend/tvheadend.hash | 4 ++--
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 7b47e9ae71..a480302988 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9c2e13a70f97cf4c9b37cd93bfd03a7a1e0b7f3b18080c40ef99b8917642dbd7  tvheadend-653bd0400b4413db96b80c807f0f7524f9248adb.tar.gz
-sha256  16aaf037a2d00e6e7804de64619887fc7539f1ede99e3282c86dfbc61c2af63e  LICENSE.md
+sha256  24d45f9d5f0b92a706e827e553850cc4e0ed5d7f5f4555d16d4c56eaa2f606bb  tvheadend-730718c2888a121a00b96f3460b2e8f5ca8396d1.tar.gz
+sha256  0420f5d2e0df002e31320d9f58fc5454cbb8f53fa0ab1fc85afb8821c6b103e3  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index a9bd98ebea..a37d4dac57 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 653bd0400b4413db96b80c807f0f7524f9248adb
+TVHEADEND_VERSION = 730718c2888a121a00b96f3460b2e8f5ca8396d1
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
