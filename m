Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1579BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:13:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FBF4610A5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FBF4610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36CBE60E95;
	Wed,  6 Oct 2021 14:13:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6DNKWzQwOlIU; Wed,  6 Oct 2021 14:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9226460E90;
	Wed,  6 Oct 2021 14:13:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 226991BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F17760E90
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRG27yV2WmmU for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:13:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 720A6605C6
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:13:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5EDA292215; Wed,  6 Oct 2021 14:10:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 15:29:32 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 8657a13330a1b1cfb17e3dfdc59e855efcd477dc
X-Git-Newrev: d8b79e5fd9967565356ac2f36866d4e33fb63074
X-Patchwork-Hint: ignore
Message-Id: <20211006141043.5EDA292215@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/docker-engine:
 bump to version 20.10.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8b79e5fd9967565356ac2f36866d4e33fb63074
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: Christian Stewart <christian@paral.in>
(cherry picked from commit fc7646565bd158a2d475f684f1bccb2a0f06d821)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index d07ca33307..07acb87864 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b80142035de46904605fb7b8f18075cd94154f8c3d67ff346ea554d1e9d579b9  docker-engine-20.10.7.tar.gz
+sha256  2505d00032f5d40ead5ac779c2840303dcead04713c93ba974be4c19b3ab8d0a  docker-engine-20.10.8.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 372717775b..7d338a5c0c 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.7
+DOCKER_ENGINE_VERSION = 20.10.8
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
