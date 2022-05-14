Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAFFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99A1C83FA4;
	Sat, 14 May 2022 09:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1FXEZH76Zz2W; Sat, 14 May 2022 09:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABD8683F49;
	Sat, 14 May 2022 09:52:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD5D81BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3700C60F21
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gRPLacUzqev for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81DBD60F20
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 306B28376C; Sat, 14 May 2022 09:39:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 11:37:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0502c927f6bacf21dc68a80fe4b967ee14d9bd6c
X-Git-Newrev: ebd9486646fd27d315579081bc095f5e390055e6
X-Patchwork-Hint: ignore
Message-Id: <20220514093944.306B28376C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vuejs-router: bump to version
 4.0.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebd9486646fd27d315579081bc095f5e390055e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/vuejs-router/vuejs-router.hash | 2 +-
 package/vuejs-router/vuejs-router.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
index fe270a6062..ba8f09b508 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6adff85db2045a092ba4bf37e95cdc3c661cfe4f3e7f7cbc36082a57c05c6365  vue-router-4.0.14.tgz
+sha256  59d6f3e237e68953fc4e4e22463b487b9fde5733b3ff3392eec488c0cc84976b  vue-router-4.0.15.tgz
 sha256  9c0015250f592a09d7787efc07152afcf661fff6bda2554359f6d00987828c02  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index 397a78e1a7..562c698157 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.0.14
+VUEJS_ROUTER_VERSION = 4.0.15
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
