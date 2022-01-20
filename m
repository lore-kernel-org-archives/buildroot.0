Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B3FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 21:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A3968146A;
	Thu, 20 Jan 2022 21:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xinaK0RjyY1o; Thu, 20 Jan 2022 21:02:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF5483145;
	Thu, 20 Jan 2022 21:02:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1B31C1135
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 21:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54AD6812B8
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 21:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxxk5L_-RVlv for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 21:01:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3399812B7
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 21:01:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9912F82A91; Thu, 20 Jan 2022 20:55:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 Jan 2022 21:54:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b61f0d74c9b91f225e1ec15766c572fe4c9e0b24
X-Git-Newrev: 9757e7d99ec02f2464bbd4120c2c260d8bfc7e22
X-Patchwork-Hint: ignore
Message-Id: <20220120205513.9912F82A91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hwloc: bump version to 2.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9757e7d99ec02f2464bbd4120c2c260d8bfc7e22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://github.com/open-mpi/hwloc/blob/hwloc-2.7.0/NEWS

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/hwloc/hwloc.hash | 4 ++--
 package/hwloc/hwloc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index e207a6bb1a..ca77e3301c 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,4 +1,4 @@
-# From https://www.open-mpi.org/software/hwloc/v2.4/
-sha256  392421e69f26120c8ab95d151fe989f2b4b69dab3c7735741c4e0a6d7de5de63  hwloc-2.4.1.tar.bz2
+# From https://www.open-mpi.org/software/hwloc/v2.7/
+sha256  028cee53ebcfe048283a2b3e87f2fa742c83645fc3ae329134bf5bb8b90384e0  hwloc-2.7.0.tar.bz2
 # Locally computed
 sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 2a5a82cea4..04543a7e64 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HWLOC_VERSION_MAJOR = 2.4
-HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).1
+HWLOC_VERSION_MAJOR = 2.7
+HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).0
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
 HWLOC_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
