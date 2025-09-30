Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BBACAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3859C413DA;
	Wed,  1 Oct 2025 20:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hk8z4CAqGjKb; Wed,  1 Oct 2025 20:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CAD641331
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CAD641331;
	Wed,  1 Oct 2025 20:01:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF0972
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2907D84049
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8K36L--SCPxr for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E60E18404E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E60E18404E
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E431C8668C; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:06:10 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5daf105ff3667f65bdd44ef9f6e04a001dc09ef2
X-Git-Newrev: bc3e295081c09cc83a8d6028ef8dd5c833db74a1
X-Patchwork-Hint: ignore
Message-Id: <20251001200129.E431C8668C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libxkbcommon:
 bump to version 1.9.2
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bc3e295081c09cc83a8d6028ef8dd5c833db74a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Changes:
  - No longer hosted at https://xkbcommon.org/download. The website points to
    the github repository. As such, change the URL accordingly.

  - The sha256sum is not provided in the mailing list archive, so the sha256sum
    is locally calculated.

  - The license file was reworded as of commit e120807b:
    """Update license notices to SDPX short identifiers + update LICENSE"""

See release notes, since version 1.7.0:
- 1.8.0: https://lists.freedesktop.org/archives/wayland-devel/2025-February/043969.html
- 1.8.1: https://lists.freedesktop.org/archives/wayland-devel/2025-March/044021.html
- 1.9.0: https://lists.freedesktop.org/archives/wayland-devel/2025-April/044160.html
- 1.9.1: https://lists.freedesktop.org/archives/wayland-devel/2025-May/044209.html
- 1.9.2: https://lists.freedesktop.org/archives/wayland-devel/2025-May/044211.html

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Julien: add links to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8abbc307a5b3c4bb2fab264b804a74754f87f1df)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libxkbcommon/libxkbcommon.hash | 6 +++---
 package/libxkbcommon/libxkbcommon.mk   | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index 6cdd79e01a..50bcf52f17 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-March/043539.html
-sha256  65782f0a10a4b455af9c6baab7040e2f537520caa2ec2092805cdfd36863b247  libxkbcommon-1.7.0.tar.xz
+# Locally calculated
+sha256  8d68a8b45796f34f7cace357b9f89b8c92b158557274fef5889b03648b55fe59  libxkbcommon-1.9.2.tar.gz
 
 # License file:
-sha256  086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb  LICENSE
+sha256  967e97b28658f0037bbe164a237bdfb0c3ec790e67f6c29372ea5b09306f61f3  LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index c60580ef84..21a2b937ef 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 1.7.0
-LIBXKBCOMMON_SITE = https://xkbcommon.org/download
-LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
+LIBXKBCOMMON_VERSION = 1.9.2
+LIBXKBCOMMON_SITE = $(call github,xkbcommon,libxkbcommon,xkbcommon-$(LIBXKBCOMMON_VERSION))
 LIBXKBCOMMON_LICENSE = MIT/X11
 LIBXKBCOMMON_LICENSE_FILES = LICENSE
 LIBXKBCOMMON_CPE_ID_VENDOR = xkbcommon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
