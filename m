Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DB6C83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA37B41545;
	Wed, 16 Jul 2025 18:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNryqFVKbDcn; Wed, 16 Jul 2025 18:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85DA541547
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85DA541547;
	Wed, 16 Jul 2025 18:38:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24F121DCB
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CCBE810F8
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Ois7n0ofELt for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6E0381122
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6E0381122
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B839D86664; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 23:50:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85ed3e271d14df79a0285605a526f7613ef93a74
X-Git-Newrev: cb98524ca26ed82e172e0113d736d20a8d76cb79
X-Patchwork-Hint: ignore
Message-Id: <20250716183802.B839D86664@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-cli-buildx: bump to version
 0.25.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb98524ca26ed82e172e0113d736d20a8d76cb79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since version 0.16.1, see:
https://github.com/docker/buildx/releases

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-cli-buildx/docker-cli-buildx.hash | 2 +-
 package/docker-cli-buildx/docker-cli-buildx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli-buildx/docker-cli-buildx.hash b/package/docker-cli-buildx/docker-cli-buildx.hash
index 26b187d12a..41fcf6ddbe 100644
--- a/package/docker-cli-buildx/docker-cli-buildx.hash
+++ b/package/docker-cli-buildx/docker-cli-buildx.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8c9dd3fb18ccba399223ba0f623c9fe09fa38fb2a05283131be8e4e139b2d8fa  docker-cli-buildx-0.16.1-go2.tar.gz
+sha256  e5a7573a5995c0f12c86d35a8148b2a10a6f1b11d1cf8c6977bf03ac281e6959  docker-cli-buildx-0.25.0-go2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/docker-cli-buildx/docker-cli-buildx.mk b/package/docker-cli-buildx/docker-cli-buildx.mk
index ea77a86077..10093bea7a 100644
--- a/package/docker-cli-buildx/docker-cli-buildx.mk
+++ b/package/docker-cli-buildx/docker-cli-buildx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_BUILDX_VERSION = 0.16.1
+DOCKER_CLI_BUILDX_VERSION = 0.25.0
 DOCKER_CLI_BUILDX_SITE = $(call github,docker,buildx,v$(DOCKER_CLI_BUILDX_VERSION))
 
 DOCKER_CLI_BUILDX_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
