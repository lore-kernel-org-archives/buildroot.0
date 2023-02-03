Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2115C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75FDE4EC06;
	Mon, 20 Feb 2023 23:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75FDE4EC06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gkMvYFAso7GS; Mon, 20 Feb 2023 23:55:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E0C54EC45;
	Mon, 20 Feb 2023 23:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E0C54EC45
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D86C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECB2B41794
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECB2B41794
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ai36lFQp9Vq0 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1FC34178A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1FC34178A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCCBD86496; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 3 Feb 2023 08:32:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 67c92fbd5004a750e6af253dd1eba4c3f669ef42
X-Git-Newrev: bb6410b09b339a372e1cc9b9f09901635ebdf406
X-Patchwork-Hint: ignore
Message-Id: <20230220205244.BCCBD86496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cni-plugins: bump
 version to 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb6410b09b339a372e1cc9b9f09901635ebdf406
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Adds new device driver main/dummy and various bug fixes/cleanups.

https://github.com/containernetworking/plugins/releases/tag/v1.2.0

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cni-plugins/cni-plugins.hash | 2 +-
 package/cni-plugins/cni-plugins.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cni-plugins/cni-plugins.hash b/package/cni-plugins/cni-plugins.hash
index fc3b5a7ead..0c3e07c91c 100644
--- a/package/cni-plugins/cni-plugins.hash
+++ b/package/cni-plugins/cni-plugins.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c86c44877c47f69cd23611e22029ab26b613f620195b76b3ec20f589367a7962  cni-plugins-1.1.1.tar.gz
+sha256  f3496ddda9c7770a0b695b67ae7ee80a4ee331ac2745af4830054b81627f79b7  cni-plugins-1.2.0.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
index b30937095a..be02c2ff45 100644
--- a/package/cni-plugins/cni-plugins.mk
+++ b/package/cni-plugins/cni-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CNI_PLUGINS_VERSION = 1.1.1
+CNI_PLUGINS_VERSION = 1.2.0
 CNI_PLUGINS_SITE = $(call github,containernetworking,plugins,v$(CNI_PLUGINS_VERSION))
 CNI_PLUGINS_LICENSE = Apache-2.0
 CNI_PLUGINS_LICENSE_FILES = LICENSE
@@ -12,6 +12,7 @@ CNI_PLUGINS_LICENSE_FILES = LICENSE
 CNI_PLUGINS_BUILD_TARGETS = \
 	plugins/ipam/dhcp \
 	plugins/main/bridge \
+	plugins/main/dummy \
 	plugins/main/host-device \
 	plugins/main/ipvlan \
 	plugins/main/loopback \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
