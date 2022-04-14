Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215D6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C78F2418EB;
	Thu, 14 Apr 2022 20:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uTCGr0DYM0jq; Thu, 14 Apr 2022 20:14:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F5504187F;
	Thu, 14 Apr 2022 20:14:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 012081C1189
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E305640A9E
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plb6nQiwIjHu for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:14:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C59140A8C
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:14:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DE81883D01; Thu, 14 Apr 2022 20:04:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 22:14:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89e51bc625d94fc5430be72894bd8fa4b1201ae5
X-Git-Newrev: 6ca50cb9253fb96dcbeb7f9c216d7848e8bfa59d
X-Patchwork-Hint: ignore
Message-Id: <20220414200445.DE81883D01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-proxy: bump to 20220404
 version 339b97
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ca50cb9253fb96dcbeb7f9c216d7848e8bfa59d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

docker-proxy (libnetwork) has not added a release tag for a long time.  Use
the latest master commit hash from 04 Apr 2022 instead.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-proxy/docker-proxy.hash | 4 ++--
 package/docker-proxy/docker-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-proxy/docker-proxy.hash b/package/docker-proxy/docker-proxy.hash
index 58de697929..84bfa5518e 100644
--- a/package/docker-proxy/docker-proxy.hash
+++ b/package/docker-proxy/docker-proxy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	866c8d196b9396a383b437b0d775476459ed7c11f527c4f6bbf1fd08524b461d	docker-proxy-55685ba49593e67f5e1c8180539379b16736c25e.tar.gz
-sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14	LICENSE
+sha256  335851e924078a8e274f0c27cb80aaba32d0c1059068740496f1eb31b55a6ec4  docker-proxy-339b972b464ee3d401b5788b2af9e31d09d6b7da.tar.gz
+sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
index 6600b24ed9..022aa1f949 100644
--- a/package/docker-proxy/docker-proxy.mk
+++ b/package/docker-proxy/docker-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_PROXY_VERSION = 55685ba49593e67f5e1c8180539379b16736c25e
+DOCKER_PROXY_VERSION = 339b972b464ee3d401b5788b2af9e31d09d6b7da
 DOCKER_PROXY_SITE = $(call github,docker,libnetwork,$(DOCKER_PROXY_VERSION))
 
 DOCKER_PROXY_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
