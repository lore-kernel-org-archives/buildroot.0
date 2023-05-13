Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3216BC77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 12:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB77C843C0;
	Sat, 13 May 2023 12:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB77C843C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TNXIDJs7iMEc; Sat, 13 May 2023 12:39:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12A3681D3D;
	Sat, 13 May 2023 12:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12A3681D3D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD50C1BF3EB
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9753A60BE7
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9753A60BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WfMArwQKAed6 for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 12:39:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB97E60C0A
 for <buildroot@buildroot.org>; Sat, 13 May 2023 12:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB97E60C0A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C71AB864E2; Sat, 13 May 2023 12:39:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 14:39:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95b711b363a25f1f7b77f7f2e0e5876c8f5024a6
X-Git-Newrev: d5bb8282d046daf9ea75daa39b7bdf8cb6aa488e
X-Patchwork-Hint: ignore
Message-Id: <20230513123943.C71AB864E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vuejs: bump to version 3.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5bb8282d046daf9ea75daa39b7bdf8cb6aa488e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/vuejs/vuejs.hash | 2 +-
 package/vuejs/vuejs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
index e66bee06d3..7960b594ce 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  968e71a707a4a1961faa6e513b6bba162ef04c3413d7edaba0abc1a5996ae71b  vue-3.2.45.tgz
+sha256  c2e4197818c64d6ad9f344141a8adee354cbc321f63be7eef6802b4b02cf19f3  vue-3.3.1.tgz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index 8f7d0cd3d4..a9058b0d44 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.2.45
+VUEJS_VERSION = 3.3.1
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
