Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B7EC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 20:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BB48830C0;
	Sat,  4 Dec 2021 20:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4rw9DRlhwu4n; Sat,  4 Dec 2021 20:55:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FED083065;
	Sat,  4 Dec 2021 20:55:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECAE81BF2C6
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC2D6408C6
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NvLd0k5T4a-S for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 20:55:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1456540664
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 20:55:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EFB0A928FC; Sat,  4 Dec 2021 20:50:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 21:55:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b017b8d3499fa1c86f5d23b084731a7ac104444d
X-Git-Newrev: ebc0d88434174b58f32183d7f74dbd9149170eb7
X-Patchwork-Hint: ignore
Message-Id: <20211204205026.EFB0A928FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fwup: bump to v1.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebc0d88434174b58f32183d7f74dbd9149170eb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also update download site to point to new location.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fwup/fwup.hash | 2 +-
 package/fwup/fwup.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fwup/fwup.hash b/package/fwup/fwup.hash
index 87263192e4..2e5b2b1f6c 100644
--- a/package/fwup/fwup.hash
+++ b/package/fwup/fwup.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9890f0328796f4315e6c1188df5c103855c530fbc14fbc8c12f4b24066c975f1  fwup-1.8.0.tar.gz
+sha256  18ae6753145cef2fd5f5fc83e29c2d883e570668d8aa064ee6c94d4c5e44d73d  fwup-1.9.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index 77eaa528f3..62016d94e3 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FWUP_VERSION = 1.8.0
-FWUP_SITE = $(call github,fhunleth,fwup,v$(FWUP_VERSION))
+FWUP_VERSION = 1.9.0
+FWUP_SITE = $(call github,fwup-home,fwup,v$(FWUP_VERSION))
 FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
 FWUP_DEPENDENCIES = host-pkgconf libconfuse libarchive
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
