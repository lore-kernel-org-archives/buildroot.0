Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDE3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1864440345;
	Sun, 23 Jan 2022 19:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUmpxeJvmShq; Sun, 23 Jan 2022 19:52:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E38C4033A;
	Sun, 23 Jan 2022 19:52:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 575021BF97A
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53D4060C2B
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smTyZOQVMiE2 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:52:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77843600CA
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:52:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CC94782B4C; Sun, 23 Jan 2022 19:45:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 20:49:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b44e7d988569778d952e9ad3e7e76cfe75bbe7e
X-Git-Newrev: 6a42e347222a2d04947d2e6985ea241ce593a0ad
X-Patchwork-Hint: ignore
Message-Id: <20220123194537.CC94782B4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nmon: bump to version 16n
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a42e347222a2d04947d2e6985ea241ce593a0ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nmon/nmon.hash | 6 +++---
 package/nmon/nmon.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nmon/nmon.hash b/package/nmon/nmon.hash
index fd3f09c63a..1d7226a4fe 100644
--- a/package/nmon/nmon.hash
+++ b/package/nmon/nmon.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/nmon/files/
-md5 df67f07ea4006c6204acff586beada81  lmon16m.c
-sha1 68cd02be19036a287fe352823db93223e73a9411  lmon16m.c
+md5  a8172601fdc05f3bc58455cbd3f4475e  lmon16n.c
+sha1  024a3b56179838f0e04bf1706cc9ba56595301a8  lmon16n.c
 # Locally computed
-sha256 2bed4d45fdfdf1d1387ec91e139c04975d5f838e3e0d53c0fe2d803a707e5fc1  lmon16m.c
+sha256  c0012cc2d925dee940c37ceae297abac64ba5a5c30e575e7418b04028613f5f2  lmon16n.c
diff --git a/package/nmon/nmon.mk b/package/nmon/nmon.mk
index 8b39748cce..01371a8c74 100644
--- a/package/nmon/nmon.mk
+++ b/package/nmon/nmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMON_VERSION = 16m
+NMON_VERSION = 16n
 NMON_SITE = https://sourceforge.net/projects/nmon/files
 NMON_SOURCE = lmon$(NMON_VERSION).c
 NMON_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
