Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD95CC83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AC934153B;
	Wed, 16 Jul 2025 18:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdtZDV5OQtFa; Wed, 16 Jul 2025 18:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C472841545
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C472841545;
	Wed, 16 Jul 2025 18:38:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 101B51514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AEAC614C3
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrAvO160Rzdo for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D390A614CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D390A614CC
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C268186665; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 23:50:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb98524ca26ed82e172e0113d736d20a8d76cb79
X-Git-Newrev: d3c2256eb0191387525edee5066ecd49f09bacee
X-Patchwork-Hint: ignore
Message-Id: <20250716183802.C268186665@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-compose: bump to version
 2.38.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d3c2256eb0191387525edee5066ecd49f09bacee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since version 2.32.4, see:
https://github.com/docker/compose/releases

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
Cc: Peter Korsgaard <peter@korsgaard.com>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index e36011e7a9..a2ffadd31c 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  481fe93cc6bb76f62b9d2a10c0db67c662d0efad38c3a307b65dd250d8d6599a  docker-compose-2.32.4-go2.tar.gz
+sha256  0c0453729b7a37badcf530fc140b1b8b907cbdcecfdb6be6413f410c86665c70  docker-compose-2.38.2-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index cc98e24133..f70cf725df 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.32.4
+DOCKER_COMPOSE_VERSION = 2.38.2
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
