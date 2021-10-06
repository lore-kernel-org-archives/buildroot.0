Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97271C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:35:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A79A610EA
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A79A610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06CE5606BB;
	Wed,  6 Oct 2021 14:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_TZkTLQo83i; Wed,  6 Oct 2021 14:35:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58630606AF;
	Wed,  6 Oct 2021 14:35:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95C5B1BF9B6
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8149840459
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AztC-X63A4ho for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:35:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE49C40100
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 98A9892267; Wed,  6 Oct 2021 14:32:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 15:29:57 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6204d45234dba8611e1dc0743593e60b7063c005
X-Git-Newrev: acd584eb9019e58c85a5de2a685385e19d8b27c9
X-Patchwork-Hint: ignore
Message-Id: <20211006143231.98A9892267@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/docker-cli: bump
 version to 20.10.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=acd584eb9019e58c85a5de2a685385e19d8b27c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

For release notes:

https://github.com/moby/moby/releases/tag/v20.10.8

Signed-off-by: Christian Stewart <christian@paral.in>
(cherry picked from commit 041e4b1ceadcbe3e1d5b872e0a9f224052031fec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 6d380c2fd8..9021362c98 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0a7848b1b5031483de075433506d0448ddf834368d9c73770e453e0b89b49747  docker-cli-20.10.7.tar.gz
+sha256  cde34bbefd70fa27b44dfa904c40db84b89abf237e5267dcd08603b459a89253  docker-cli-20.10.8.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 24fd26a8c6..10776a4e1e 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.7
+DOCKER_CLI_VERSION = 20.10.8
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
