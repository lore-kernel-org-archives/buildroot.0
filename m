Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47934D767FA
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 19:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0031D60BDD;
	Thu, 31 Oct 2024 19:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DNX4hQVgbbl; Thu, 31 Oct 2024 19:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1503E60BE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1503E60BE8;
	Thu, 31 Oct 2024 19:58:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 430F55E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23EEA60BE8
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7HSOcebYdtG for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 19:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 505D660BDD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 505D660BDD
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:58:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 354F18555D; Thu, 31 Oct 2024 19:58:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 20:56:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ab8eb3cac0c87c850c800d639004205807faf27
X-Git-Newrev: 02540771bccf7b10c7daecce5f0e1e41a73c1e07
X-Patchwork-Hint: ignore
Message-Id: <20241031195854.354F18555D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/v4l2loopback: bump version to
 0.13.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02540771bccf7b10c7daecce5f0e1e41a73c1e07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/umlaeute/v4l2loopback/blob/v0.13.2/ChangeLog

Fixes:
http://autobuild.buildroot.net/results/356/356be839ce23154e9f808469b4483e7eaae316e1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/v4l2loopback/v4l2loopback.hash | 2 +-
 package/v4l2loopback/v4l2loopback.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/v4l2loopback/v4l2loopback.hash b/package/v4l2loopback/v4l2loopback.hash
index d897fd48ff..c7fb226add 100644
--- a/package/v4l2loopback/v4l2loopback.hash
+++ b/package/v4l2loopback/v4l2loopback.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e0782b8abe8f2235e2734f725dc1533a0729e674c4b7834921ade43b9f04939b  v4l2loopback-0.12.7.tar.gz
+sha256  1e57e1e382d7451aa2a88d63cc9f146eab1f425b90e76104d4c3d73127e34771  v4l2loopback-0.13.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 50a168fcab..abc2929d12 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-V4L2LOOPBACK_VERSION = 0.12.7
+V4L2LOOPBACK_VERSION = 0.13.2
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
