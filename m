Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8D2C4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 16:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B852A81772;
	Mon, 15 Apr 2024 16:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNISvEH-vBLP; Mon, 15 Apr 2024 16:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C296D817A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C296D817A3;
	Mon, 15 Apr 2024 16:27:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA501BF95D
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 164E8404A6
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPk3f7Jhabof for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 16:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 300CE400FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 300CE400FE
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 16:27:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F84F860E0; Mon, 15 Apr 2024 16:27:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Apr 2024 18:06:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87943b75310190db05342232046790db0f8e4232
X-Git-Newrev: 47027fefa4a0c79b03dee381a75647d735a41f9f
X-Patchwork-Hint: ignore
Message-Id: <20240415162719.1F84F860E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bmap-tools: update GitHub URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=47027fefa4a0c79b03dee381a75647d735a41f9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in the README file of the old GitHub URL (i.e.
https://github.com/intel/bmap-tools), "The code at this location is no
longer maintained and will likely be removed in the future. This project
has moved to https://github.com/yoctoproject/bmaptool".

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bmap-tools/Config.in      | 2 +-
 package/bmap-tools/Config.in.host | 2 +-
 package/bmap-tools/bmap-tools.mk  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bmap-tools/Config.in b/package/bmap-tools/Config.in
index 91081069c7..425b7dfb9e 100644
--- a/package/bmap-tools/Config.in
+++ b/package/bmap-tools/Config.in
@@ -40,4 +40,4 @@ config BR2_PACKAGE_BMAP_TOOLS
 	  python-gpgme is not available. Optimized bzip2 decompression
 	  is not supported as pbzip2 is not available.
 
-	  https://github.com/intel/bmap-tools
+	  https://github.com/yoctoproject/bmaptool
diff --git a/package/bmap-tools/Config.in.host b/package/bmap-tools/Config.in.host
index a20829030d..cb4d35a437 100644
--- a/package/bmap-tools/Config.in.host
+++ b/package/bmap-tools/Config.in.host
@@ -9,4 +9,4 @@ config BR2_PACKAGE_HOST_BMAP_TOOLS
 	  image files, can be copied or flashed a lot faster with
 	  bmaptool than with traditional tools like "dd" or "cp".
 
-	  https://github.com/intel/bmap-tools
+	  https://github.com/yoctoproject/bmaptool
diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
index 32399ca151..69a22c4745 100644
--- a/package/bmap-tools/bmap-tools.mk
+++ b/package/bmap-tools/bmap-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BMAP_TOOLS_VERSION = 3.6
-BMAP_TOOLS_SITE = $(call github,intel,bmap-tools,v$(BMAP_TOOLS_VERSION))
+BMAP_TOOLS_SITE = $(call github,yoctoproject,bmaptool,v$(BMAP_TOOLS_VERSION))
 BMAP_TOOLS_LICENSE = GPL-2.0
 BMAP_TOOLS_LICENSE_FILES = COPYING
 BMAP_TOOLS_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
