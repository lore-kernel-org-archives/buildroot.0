Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6269EC369C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 358D66FBE6;
	Wed, 16 Apr 2025 21:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJHm1kg8dEo2; Wed, 16 Apr 2025 21:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2AFB6F5A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2AFB6F5A9;
	Wed, 16 Apr 2025 21:48:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31EF0159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A9F340610
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBD_qatdTJ1D for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F23540F85
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F23540F85
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:48:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B7B88439E; Wed, 16 Apr 2025 21:48:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 13:35:47 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: ee42b81b9a34d02501816c2fff854897125c4a0c
X-Git-Newrev: e2fdc0e9dce1eb0cf2d01610ed4d4d942963a3e0
X-Patchwork-Hint: ignore
Message-Id: <20250416214823.7B7B88439E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/libgeos: bump
 version to 3.13.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2fdc0e9dce1eb0cf2d01610ed4d4d942963a3e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Changelog: https://github.com/libgeos/geos/releases/tag/3.13.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 76c588ed569cc771cc392001b5401e7871ba1138)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 36f47cd523..f404b267e2 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  47ec83ff334d672b9e4426695f15da6e6368244214971fabf386ff8ef6df39e4  geos-3.13.0.tar.bz2
+sha256  df2c50503295f325e7c8d7b783aca8ba4773919cde984193850cf9e361dfd28c  geos-3.13.1.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index beb2c077c4..475a54f79f 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.13.0
+LIBGEOS_VERSION = 3.13.1
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
