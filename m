Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5B7C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D27BE605D8;
	Mon, 25 Mar 2024 22:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cC7jz8GoZLrg; Mon, 25 Mar 2024 22:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCF3A608C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCF3A608C1;
	Mon, 25 Mar 2024 22:37:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14CDE1BF954
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01B8740BF8
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcnumkh_hNvc for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 091B440C0F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 091B440C0F
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5F0E8411A; Mon, 25 Mar 2024 22:37:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 22:20:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 425b5ba6809c55e5368060afd2a7aabfb9113572
X-Git-Newrev: e999c9fbaec0ab3f31fb3058b3f6e37c4cad9abe
X-Patchwork-Hint: ignore
Message-Id: <20240325223700.E5F0E8411A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go-bootstrap-stage2: bump version
 to go1.19.13
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e999c9fbaec0ab3f31fb3058b3f6e37c4cad9abe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to the latest 1.19.x version available.

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/go-bootstrap-stage2/go-bootstrap-stage2.hash | 2 +-
 package/go-bootstrap-stage2/go-bootstrap-stage2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
index 6d4c718a40..d61663cac9 100644
--- a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
+++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  e25c9ab72d811142b7f41ff6da5165fec2d1be5feec3ef2c66bc0bdecb431489  go1.19.11.src.tar.gz
+sha256  ccf36b53fb0024a017353c3ddb22c1f00bc7a8073c6aac79042da24ee34434d3  go1.19.13.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
index 72f3200a2e..98bf624b57 100644
--- a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
+++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
@@ -6,7 +6,7 @@
 
 # Use last Go version that go-bootstrap-stage1 can build: v1.19.x
 # See https://golang.org/doc/install/source#bootstrapFromSource
-GO_BOOTSTRAP_STAGE2_VERSION = 1.19.11
+GO_BOOTSTRAP_STAGE2_VERSION = 1.19.13
 GO_BOOTSTRAP_STAGE2_SITE = https://storage.googleapis.com/golang
 GO_BOOTSTRAP_STAGE2_SOURCE = go$(GO_BOOTSTRAP_STAGE2_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
