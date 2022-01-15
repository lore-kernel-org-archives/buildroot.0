Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533F1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 086BC60BCD;
	Sat, 15 Jan 2022 10:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTJ3EnMX_igl; Sat, 15 Jan 2022 10:17:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59D3660AE4;
	Sat, 15 Jan 2022 10:17:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C0D21BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81F4E4054A
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0_3aVAKzb-x for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:17:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA4FB4050F
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:17:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 09BC78292F; Sat, 15 Jan 2022 10:11:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:16:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 012dcef7c23c0470acf6e3a3e841ccaab4f91584
X-Git-Newrev: 589065acf96e89ad503e4943fd55517d769563c1
X-Patchwork-Hint: ignore
Message-Id: <20220115101119.09BC78292F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: bump to version
 a91d0d9d3bba1a936669cfac3244509a0f2ac0e3
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

commit: https://git.buildroot.net/buildroot/commit/?id=589065acf96e89ad503e4943fd55517d769563c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luajit/luajit.hash | 2 +-
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 1497ee9df4..d92eefb39a 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b1b19f92451a661ba1167ee0b259299616cb3a1cdaf5ab05d7ccffaffeb4a0fb  luajit-05f1984e1a862e4b3d3c3b370c773492e2edf84a.tar.gz
+sha256  7ea92e2414b6405c7fb3974ab092707c400a5496e8d4936174b5bd3aa6e94477  luajit-a91d0d9d3bba1a936669cfac3244509a0f2ac0e3.tar.gz
 
 # Locally calculated
 sha256  43fc251179d900f9948e51dd3cc93733d1219f2db060faaa0c8100ad054f54d8  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index d2af69d1e3..7c1b556ff7 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 05f1984e1a862e4b3d3c3b370c773492e2edf84a
+LUAJIT_VERSION = a91d0d9d3bba1a936669cfac3244509a0f2ac0e3
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
