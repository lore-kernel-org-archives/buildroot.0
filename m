Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70195C2BA1A
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28273415B7;
	Wed, 19 Jun 2024 20:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEDBEZZCMrgu; Wed, 19 Jun 2024 20:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDDFC4036F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDDFC4036F;
	Wed, 19 Jun 2024 20:16:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAB5B1BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98EE6606EA
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WVJR3qvGo-J for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D64E46065F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D64E46065F
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:16:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD74180286; Wed, 19 Jun 2024 20:16:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Jun 2024 22:11:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7f2903f3ed88ef5c2f10171c93e90bd9ad5d83e
X-Git-Newrev: c6b6587629e4fb902b990bab1fe7acbf7424c248
X-Patchwork-Hint: ignore
Message-Id: <20240619201642.BD74180286@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imx-mkimage: bump version to
 lf-6.6.3-1.0.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2841586722855630999=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2841586722855630999==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c6b6587629e4fb902b990bab1fe7acbf7424c248
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/imx-mkimage/imx-mkimage.hash | 2 +-
 package/imx-mkimage/imx-mkimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index 034b3d02ed..3161d66ad2 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fd538dc571ce06609d6a4d9ee8cfd7d0c93ec4685afa9f1079e5a5931ad3bdbc  imx-mkimage-lf-6.1.36_2.1.0.tar.gz
+sha256  48e7bad4a49e693415418859bb0330b63938a77bbb12660bc64761a5daa915c9  imx-mkimage-lf-6.6.3_1.0.0.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  LICENSE
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index 6e70a946bf..a82854eb6e 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_MKIMAGE_VERSION = lf-6.1.36_2.1.0
+IMX_MKIMAGE_VERSION = lf-6.6.3_1.0.0
 IMX_MKIMAGE_SITE = $(call github,nxp-imx,imx-mkimage,$(IMX_MKIMAGE_VERSION))
 IMX_MKIMAGE_LICENSE = GPL-2.0+
 IMX_MKIMAGE_LICENSE_FILES = LICENSE

--===============2841586722855630999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2841586722855630999==--
