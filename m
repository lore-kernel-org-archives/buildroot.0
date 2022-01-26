Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B073CC5DF62
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FAEA40A51;
	Wed, 26 Jan 2022 20:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9rhPLnUJTs2c; Wed, 26 Jan 2022 20:39:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EDE4409EF;
	Wed, 26 Jan 2022 20:39:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E3A8E1BF4D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D155883437
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7JBqeeMBrfgG for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:38:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D80982C7D
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:38:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CE79F82582; Wed, 26 Jan 2022 20:31:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:37:58 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: e6a838d6ac61e18c97445c75d3df0196ead4e73d
X-Git-Newrev: 288007dc4a3c95a705c811d6c6cbb64a623ae733
X-Patchwork-Hint: ignore
Message-Id: <20220126203138.CE79F82582@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/go: bump version
 to 1.17.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=288007dc4a3c95a705c811d6c6cbb64a623ae733
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

View the release notes for more information:

https://go.dev/doc/devel/release.html#go1.17.minor

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7af6659cb2cbd54b2ca6bad2d91291815e83fbc2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 39f8226aae..9111c8c9aa 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  3defb9a09bed042403195e872dcbc8c6fae1485963332279668ec52e80a95a2d  go1.17.5.src.tar.gz
+sha256  4dc1bbf3ff61f0c1ff2b19355e6d88151a70126268a47c761477686ef94748c8  go1.17.6.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 0d9ceab2bb..062bec378c 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.5
+GO_VERSION = 1.17.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
