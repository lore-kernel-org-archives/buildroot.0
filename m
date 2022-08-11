Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85EFC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3331660F5C;
	Thu, 11 Aug 2022 20:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3331660F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m5QUTgZ76Iu5; Thu, 11 Aug 2022 20:43:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55A0560E40;
	Thu, 11 Aug 2022 20:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55A0560E40
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F00491BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D87D181D67
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D87D181D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SMTu7qcRxJwC for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:43:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1931081D3A
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1931081D3A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 175C28734D; Thu, 11 Aug 2022 20:29:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 22:43:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f78fae8c9c8941e9f424191c9c9df26ff1d588f2
X-Git-Newrev: a8d9609851552c7ed03fe1e70a2f44efb134253c
X-Patchwork-Hint: ignore
Message-Id: <20220811202901.175C28734D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-proxy: bump version to
 f6ccccb1c082
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a8d9609851552c7ed03fe1e70a2f44efb134253c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Which is the version used by docker 20.10.17:
https://github.com/moby/moby/blob/v20.10.17/hack/dockerfile/install/proxy.installer

The repository also moved to the moby GitHub organization, follow
that move.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-proxy/docker-proxy.hash | 2 +-
 package/docker-proxy/docker-proxy.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-proxy/docker-proxy.hash b/package/docker-proxy/docker-proxy.hash
index 84bfa5518e..63296f14c1 100644
--- a/package/docker-proxy/docker-proxy.hash
+++ b/package/docker-proxy/docker-proxy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  335851e924078a8e274f0c27cb80aaba32d0c1059068740496f1eb31b55a6ec4  docker-proxy-339b972b464ee3d401b5788b2af9e31d09d6b7da.tar.gz
+sha256  05bf95637bae134d12d02bd7a7854cd0c768e6fccb662c2c64523f05b997b204  docker-proxy-f6ccccb1c082a432c2a5814aaedaca56af33d9ea.tar.gz
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
index 022aa1f949..fe7982e8f6 100644
--- a/package/docker-proxy/docker-proxy.mk
+++ b/package/docker-proxy/docker-proxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_PROXY_VERSION = 339b972b464ee3d401b5788b2af9e31d09d6b7da
-DOCKER_PROXY_SITE = $(call github,docker,libnetwork,$(DOCKER_PROXY_VERSION))
+DOCKER_PROXY_VERSION = f6ccccb1c082a432c2a5814aaedaca56af33d9ea
+DOCKER_PROXY_SITE = $(call github,moby,libnetwork,$(DOCKER_PROXY_VERSION))
 
 DOCKER_PROXY_LICENSE = Apache-2.0
 DOCKER_PROXY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
