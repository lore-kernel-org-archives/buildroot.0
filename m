Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30601C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDF076FF0A;
	Mon, 10 Apr 2023 19:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDF076FF0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B5RzjL3ElFjb; Mon, 10 Apr 2023 19:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F26586FEF9;
	Mon, 10 Apr 2023 19:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F26586FEF9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22DEE1C3BA6
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8186613E5
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8186613E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id baGKJqi4o1ad for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:37:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57C3161406
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57C3161406
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53AEE83DBE; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:33:03 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 75a10d935f81dee4b7b3ec26718b1252014d2b3b
X-Git-Newrev: 901031eecc206c082156e625a4ba20d4e330f471
X-Patchwork-Hint: ignore
Message-Id: <20230410193723.53AEE83DBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/docker-cli: bump
 version to v23.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=901031eecc206c082156e625a4ba20d4e330f471
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This release contains some fixes and small improvements. For the
full list see:
https://github.com/moby/moby/releases/tag/v23.0.2

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 413a28940b46db5d84bc7430bc49df076cee01f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 9b231f03b1..a8ee6c7a34 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  37bc1c71a782fc10d35aa6708c1b3c90a71f3947c33665cb0de68df25dc14d94  docker-cli-23.0.1.tar.gz
+sha256  bef4fc68b9f81ab2ae8bb2605e16a0965a3c4a82f0c0cf9d9f5d2cee8e95415d  docker-cli-23.0.2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 38d903150c..5473edf1ef 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 23.0.1
+DOCKER_CLI_VERSION = 23.0.2
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
