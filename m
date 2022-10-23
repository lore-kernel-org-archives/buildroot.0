Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF9AECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 20:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11DD7606E6;
	Sun, 23 Oct 2022 20:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11DD7606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zbV_FF4gtW3u; Sun, 23 Oct 2022 20:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40AB16066D;
	Sun, 23 Oct 2022 20:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40AB16066D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3EF31BF38D
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 20:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCF3B813A2
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 20:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCF3B813A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrjZxrKdQV7k for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 20:29:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04A238139E
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 20:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04A238139E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E31AC86F54; Sun, 23 Oct 2022 20:29:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 22:28:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e78c580e2361f1d1055bc81e1a822d29c021b1b0
X-Git-Newrev: 8a08b862c6c22e7a7323efb82c8f3b3a662498f6
X-Patchwork-Hint: ignore
Message-Id: <20221023202923.E31AC86F54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdmtx: bump to version 0.7.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a08b862c6c22e7a7323efb82c8f3b3a662498f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/dmtx/libdmtx/compare/v0.7.5...v0.7.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdmtx/libdmtx.hash | 2 +-
 package/libdmtx/libdmtx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libdmtx/libdmtx.hash b/package/libdmtx/libdmtx.hash
index 98eef9aeeb..8b176d737a 100644
--- a/package/libdmtx/libdmtx.hash
+++ b/package/libdmtx/libdmtx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  be0c5275695a732a5f434ded1fcc232aa63b1a6015c00044fe87f3a689b75f2e  libdmtx-0.7.5.tar.gz
+sha256  7aa62adcefdd6e24bdabeb82b3ce41a8d35f4a0c95ab0c4438206aecafd6e1a1  libdmtx-0.7.7.tar.gz
 sha256  fcc277b7302645322c63de22b9b0bdae2df3dfa7d6cbc0d5bed7a4d3f1a9af79  LICENSE
diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index 04e089f1f7..00d37fb94e 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDMTX_VERSION = 0.7.5
+LIBDMTX_VERSION = 0.7.7
 LIBDMTX_SITE = $(call github,dmtx,libdmtx,v$(LIBDMTX_VERSION))
 LIBDMTX_LICENSE = BSD-2-Clause or Special Permission
 LIBDMTX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
