Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD1DC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA4994FD6F;
	Fri, 28 Feb 2025 16:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qk6kxyR5otI3; Fri, 28 Feb 2025 16:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA6C24FD6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA6C24FD6C;
	Fri, 28 Feb 2025 16:48:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20963711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE66F42E2B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFhRZ1uWIkFL for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1225424D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1225424D9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB613876C0; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 23:03:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 89061166eca2b48771426056ccd14e4d3e0850c9
X-Git-Newrev: a9c8a2cf18bbd1a9d8bdf442762ba0351121df56
X-Patchwork-Hint: ignore
Message-Id: <20250228162953.DB613876C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xorgproto: bump
 version to 2024.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9c8a2cf18bbd1a9d8bdf442762ba0351121df56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.x.org/archives/xorg-announce/2024-March/003495.html

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xorgproto/xorgproto.hash | 8 +++++---
 package/x11r7/xorgproto/xorgproto.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
index 37ad9c7c04..941ceabd49 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,6 +1,8 @@
-# From https://lists.x.org/archives/xorg-announce/2023-June/003408.html
-sha256  b61fbc7db82b14ce2dc705ab590efc32b9ad800037113d1973811781d5118c2c  xorgproto-2023.2.tar.xz
-sha512  af0a8c8094fc6a490a886a8c048175762b6334798f2e48b6f6e19a7bb39ddbef05fa1237c4e9d9f1d870d24f5ca7a7c463044c41ceebd108f8ab0816677a582d  xorgproto-2023.2.tar.xz
+# Verified from https://xorg.freedesktop.org/archive/individual/proto/xorgproto-2024.1.tar.xz.sig
+# with key 67DC86F2623FC5FD4BB5225D14706DBE1E4B4540
+# From https://lists.x.org/archives/xorg-announce/2024-March/003495.html
+sha256  372225fd40815b8423547f5d890c5debc72e88b91088fbfb13158c20495ccb59  xorgproto-2024.1.tar.xz
+sha512  63955cb604ff831575af2193548857c1b99e52d00206ea9421ce99e145094bcd907388c4574bc32174a01cbe2c940b0377bf75ae7d2c0f953157dc9c32e5a07f  xorgproto-2024.1.tar.xz
 
 # Locally computed
 sha256  aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index f6e5a5a434..0253167372 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2023.2
+XORGPROTO_VERSION = 2024.1
 XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.xz
 XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
