Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16ABC3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 10:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C166780D43;
	Sun, 28 Jul 2024 10:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7xAI6BuS8xf; Sun, 28 Jul 2024 10:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C96B080C10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C96B080C10;
	Sun, 28 Jul 2024 10:26:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 909341BF5F5
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D45B401F3
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMhbRhxCi9zE for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78DA0400C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78DA0400C1
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73F268753F; Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 11:54:29 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 6d6e9fb45fa79f7370ce0f1ea0bedd5b0800d455
X-Git-Newrev: 2b0c3604a4ce07ad4335ff4b3f6306fc4172d375
X-Patchwork-Hint: ignore
Message-Id: <20240728102559.73F268753F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/libgeos: bump
 version to 3.12.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b0c3604a4ce07ad4335ff4b3f6306fc4172d375
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Changelog: https://github.com/libgeos/geos/releases/tag/3.12.2

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5777bfc0f72db4de0315b753b2a064f017b3d652)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 37fe7d6d23..362f1c10b6 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d6ea7e492224b51193e8244fe3ec17c4d44d0777f3c32ca4fb171140549a0d03  geos-3.12.1.tar.bz2
+sha256  34c7770bf0090ee88488af98767d08e779f124fa33437e0aabec8abd4609fec6  geos-3.12.2.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 491168324f..05b74b60a2 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.12.1
+LIBGEOS_VERSION = 3.12.2
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
