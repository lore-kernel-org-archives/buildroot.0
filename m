Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C229CE7AA3
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 12:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCAE584149;
	Fri,  6 Sep 2024 12:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1A6W77GHR4ng; Fri,  6 Sep 2024 12:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDCA98415C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDCA98415C;
	Fri,  6 Sep 2024 12:00:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C5821BF355
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 12:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7E2940C1F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 12:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4Xc2or--Bvb for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 12:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A411440C57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A411440C57
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 12:00:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91EB986EA0; Fri,  6 Sep 2024 12:00:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Sep 2024 13:57:28 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 7189e33c3c629dfc819c4723bd401f8b9470d7fc
X-Git-Newrev: 28252450c4418d6544992563029448a27cbbc8b1
X-Patchwork-Hint: ignore
Message-Id: <20240906120008.91EB986EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/hiawatha: update
 homepage URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=28252450c4418d6544992563029448a27cbbc8b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

The download and homepage URL for this project have been
updated. The old site no longer works.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2a547e2c424ac08d8741dc557aee968f1b659735)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hiawatha/Config.in   | 2 +-
 package/hiawatha/hiawatha.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index 0c35734c34..8bcee3f098 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -27,7 +27,7 @@ config BR2_PACKAGE_HIAWATHA
 	  pipelining, keep alive connections, URL rewriting and many
 	  more.
 
-	  http://www.hiawatha-webserver.org/
+	  https://hiawatha.leisink.net/
 
 if BR2_PACKAGE_HIAWATHA
 
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 3e9cf2571b..4c94f0067e 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HIAWATHA_VERSION = 11.2
-HIAWATHA_SITE = https://www.hiawatha-webserver.org/files
+HIAWATHA_SITE = https://hiawatha.leisink.net/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
 HIAWATHA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
