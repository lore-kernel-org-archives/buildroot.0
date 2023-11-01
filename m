Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BA1C4167D
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 09:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 314816FC1D;
	Wed,  1 Nov 2023 09:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 314816FC1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vWd7bTRUAeyV; Wed,  1 Nov 2023 09:21:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87EF36FC76;
	Wed,  1 Nov 2023 09:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87EF36FC76
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 112941BF966
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 09:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBA4981E47
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 09:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBA4981E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G4TDbjJVBtzf for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 09:21:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45C21840E9
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 09:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45C21840E9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32937818CC; Wed,  1 Nov 2023 09:21:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 09:58:51 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 9971f8713c0fca020d82b4577fab9559096ac60d
X-Git-Newrev: 2aaf51f867d9b3640d751032a9097ec86214a31a
X-Patchwork-Hint: ignore
Message-Id: <20231101092109.32937818CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/docker-cli: bump
 version to v24.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=2aaf51f867d9b3640d751032a9097ec86214a31a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Minor bugfix in docker ps status description.

https://github.com/moby/moby/releases/tag/v24.0.7

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ae2dc6ae619dfea517a833cd184890b8bca3768a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 5d8c1b0f59..9c8d08bba5 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c1a4a580ced3633e489c5c9869a20198415da44df7023fdc200d425cdf5fa652  docker-cli-24.0.6.tar.gz
+sha256  72a54d131c28938221c81bd08364459fed9c71c093d4d615d324aaf31de6db1d  docker-cli-24.0.7.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 53c9ddb6b8..95fce27ffb 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 24.0.6
+DOCKER_CLI_VERSION = 24.0.7
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
