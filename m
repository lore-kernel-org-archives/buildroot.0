Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5CBC43217
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D029460FBC;
	Sat, 23 Apr 2022 15:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iV2MCkNtN_7G; Sat, 23 Apr 2022 15:16:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F150161062;
	Sat, 23 Apr 2022 15:16:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07A121BF95C
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08E2D40917
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3z7b17-DdZx for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B9D240A5F
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0372783FD4; Sat, 23 Apr 2022 15:02:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 17:03:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a33130d964af5ca07315f118dca7964c38b13f4d
X-Git-Newrev: bf781cbb639a527525607036a81cbf913be2edb7
X-Patchwork-Hint: ignore
Message-Id: <20220423150246.0372783FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: bump to version
 f2b37f51f69ba7e9f8defd05e5aca648121f0fe6
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf781cbb639a527525607036a81cbf913be2edb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff COPYRIGHT:
-Copyright (C) 2005-2021 Mike Pall. All rights reserved.
+Copyright (C) 2005-2022 Mike Pall. All rights reserved.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/luajit/luajit.hash | 4 ++--
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index d92eefb39a..cfc00e852a 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7ea92e2414b6405c7fb3974ab092707c400a5496e8d4936174b5bd3aa6e94477  luajit-a91d0d9d3bba1a936669cfac3244509a0f2ac0e3.tar.gz
+sha256  e3f9c04e82d5c776335dfb4e53ec1532914ab010b60bffbb0176a8390f100666  luajit-f2b37f51f69ba7e9f8defd05e5aca648121f0fe6.tar.gz
 
 # Locally calculated
-sha256  43fc251179d900f9948e51dd3cc93733d1219f2db060faaa0c8100ad054f54d8  COPYRIGHT
+sha256  52fc5b15ac968ed81aabb4c1e23ab3bce50f57a5764e9cdca86b463a11072921  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index cca806309d..6155cbba87 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = a91d0d9d3bba1a936669cfac3244509a0f2ac0e3
+LUAJIT_VERSION = f2b37f51f69ba7e9f8defd05e5aca648121f0fe6
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
