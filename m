Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5D3C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 400AC8200C;
	Thu,  1 Aug 2024 21:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hENvrA5dD0kl; Thu,  1 Aug 2024 21:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 458D281F5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 458D281F5E;
	Thu,  1 Aug 2024 21:42:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38C571BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 269D68202B
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUIhgL8ETwM5 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:42:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E6E281F5E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E6E281F5E
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:42:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37F4A83A1A; Thu,  1 Aug 2024 21:42:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Aug 2024 23:41:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1b28a8c428c31dcb7388f2c81e974ff7de159b4
X-Git-Newrev: da77020c8ecc742b84fef007355b6719bb6e0f6b
X-Patchwork-Hint: ignore
Message-Id: <20240801214216.37F4A83A1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imx-mkimage: bump to version
 lf-6.6.23-2.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=da77020c8ecc742b84fef007355b6719bb6e0f6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/nxp-imx/imx-mkimage/compare/lf-6.1.22-2.0.0...lf-6.6.23-2.0.0

Note: the Buildroot package version name before this commit was
"lf-6.6.3_1.0.0" (with an underscore "_"), which was in fact a
branch git reference. See:
https://github.com/nxp-imx/imx-mkimage/tree/lf-6.6.3_1.0.0

It should have been the tag name "lf-6.6.3-1.0.0" (with the dash "-").
See:
https://github.com/nxp-imx/imx-mkimage/releases/tag/lf-6.6.3-1.0.0

This commit fixes this issue by updating to a new git tag reference.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imx-mkimage/imx-mkimage.hash | 2 +-
 package/imx-mkimage/imx-mkimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index 3161d66ad2..02205def1e 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  48e7bad4a49e693415418859bb0330b63938a77bbb12660bc64761a5daa915c9  imx-mkimage-lf-6.6.3_1.0.0.tar.gz
+sha256  0a5654229c063e4e87b5d69f47a4a913ecee51f8a817ae2346a2a407e765ed3b  imx-mkimage-lf-6.6.23-2.0.0.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  LICENSE
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index a82854eb6e..f7396ba1b2 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_MKIMAGE_VERSION = lf-6.6.3_1.0.0
+IMX_MKIMAGE_VERSION = lf-6.6.23-2.0.0
 IMX_MKIMAGE_SITE = $(call github,nxp-imx,imx-mkimage,$(IMX_MKIMAGE_VERSION))
 IMX_MKIMAGE_LICENSE = GPL-2.0+
 IMX_MKIMAGE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
