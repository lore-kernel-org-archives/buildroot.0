Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5075D5AE6B
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 08:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D269E4089C;
	Thu,  7 Nov 2024 08:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85v-oxIbhSjZ; Thu,  7 Nov 2024 08:01:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7149340945
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7149340945;
	Thu,  7 Nov 2024 08:01:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67AB1C2
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55473820EC
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cwl8BqWRTYrj for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 714FB820B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 714FB820B2
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C75985C67; Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Nov 2024 08:55:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d8fb2078fb1dc30f92002bc77a21cbe73237f19
X-Git-Newrev: c9b76f80c58472f17033689137a97cd76f5ee8c3
X-Patchwork-Hint: ignore
Message-Id: <20241107080153.5C75985C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vuejs-router: bump to version 4.4.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c9b76f80c58472f17033689137a97cd76f5ee8c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vuejs-router/vuejs-router.hash | 2 +-
 package/vuejs-router/vuejs-router.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
index e297667f4c..83c14e8823 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ad4999f6c346053d93e9e600a69162c52759b1db3aa9a09ef4e9d2d8ffb2d167  vue-router-4.4.0.tgz
+sha256  7f114198b1efb7635c281cb191948f6ed1cecfa9a9e9be2c14d5356cd624eb60  vue-router-4.4.5.tgz
 sha256  91a2845c4db44e7497b514b98634a674c737986ad0db81599307cf733bf850b2  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index fb352fd1bd..7de4864d3f 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.4.0
+VUEJS_ROUTER_VERSION = 4.4.5
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
