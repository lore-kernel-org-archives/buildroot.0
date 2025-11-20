Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4EECF885D
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 20:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74AF16F4B1;
	Thu, 20 Nov 2025 20:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CICyrrqh8qb; Thu, 20 Nov 2025 20:14:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA1360DC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA1360DC7;
	Thu, 20 Nov 2025 20:14:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0B02117
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3182404B7
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SK07fIdhLH6n for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 20:14:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4E5340460
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4E5340460
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:14:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B048585C4C; Thu, 20 Nov 2025 20:14:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 21:07:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2f67d3f173038e15658317f2af7ced499169e44
X-Git-Newrev: d62053fd1a674c3a36aea42fb2065a98d503f11a
X-Patchwork-Hint: ignore
Message-Id: <20251120201403.B048585C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-artifact: bump version to
 4.2.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d62053fd1a674c3a36aea42fb2065a98d503f11a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/mendersoftware/mender-artifact/releases/tag/4.2.0

https://github.com/mendersoftware/mender-artifact/releases/tag/4.1.1
(mentions CVE-2025-22868 as fixed, but this is a host-only package)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mender-artifact/mender-artifact.hash | 2 +-
 package/mender-artifact/mender-artifact.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 914c210b77..19f650046a 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d82cd2f802033d53f2e947ed8d9d6cdd7a036fadbd92a2696b72122bd2070039  mender-artifact-4.1.0-go2.tar.gz
+sha256  14ba008df9b24321de72821de394bc4326e4dd9e17ed7c111340689e90d8b596  mender-artifact-4.2.0-go2.tar.gz
 sha256  a99c495576ecc6d6e137e471c515d38757179240ff6cc41bd481e29d3504f334  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 7d6f0929e2..609ce05c5a 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 4.1.0
+HOST_MENDER_ARTIFACT_VERSION = 4.2.0
 HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, MPL-2.0
 # Vendor license paths generated with:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
