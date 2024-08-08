Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E677CC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 12:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B23ED60A81;
	Thu,  8 Aug 2024 12:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzDapMxzbJ6l; Thu,  8 Aug 2024 12:05:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C12EF60A8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C12EF60A8E;
	Thu,  8 Aug 2024 12:05:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 189C31BF2A6
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 12:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12FD540DE9
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 12:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ypgb_TrvTQRx for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 12:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1526240DE4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1526240DE4
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 12:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03A9D84716; Thu,  8 Aug 2024 12:05:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Aug 2024 14:01:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5746500439868712a5035c9a5145ee75d2b5efc5
X-Git-Newrev: 86f3b004d653833248d224f0e037402060278a21
X-Patchwork-Hint: ignore
Message-Id: <20240808120547.03A9D84716@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/uvw: bump to 3.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=86f3b004d653833248d224f0e037402060278a21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This allows uvw to be again in sync with the libuv package, following
the bump of libuv to v1.48 in commit
bd2f99246c253739a3d44d8345f2fbb5362b3fb5 ("package/libuv: security
bump to version 1.48")

The hash of the license file has changed due to a copyright year
update.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c54134bf6914593caaa9ed4aa11cbe3a17c59eca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uvw/uvw.hash | 4 ++--
 package/uvw/uvw.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
index 2dc6e879e1..d346ac1619 100644
--- a/package/uvw/uvw.hash
+++ b/package/uvw/uvw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bd5aed741765950074b1ea2507291dce81e528abdf56c406991ad4a27d8d1714  uvw-3.2.0_libuv_v1.46.tar.gz
-sha256  e2a4062818ab05e2a0908737ad49b7c01202247364e900167ac81105de8713f3  LICENSE
+sha256  c16600573871a5feeb524234b378ab832c8971b2a68d030c6bd0e3077d416ade  uvw-3.4.0_libuv_v1.48.tar.gz
+sha256  5e439d0ad6e1b16f2f14023872c49cb2cf1b62a172c30b864cb45a5aa6533454  LICENSE
diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index 12149d43ca..a1eff0e4dd 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UVW_VERSION = 3.2.0_libuv_v1.46
+UVW_VERSION = 3.4.0_libuv_v1.48
 UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
 UVW_INSTALL_STAGING = YES
 UVW_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
