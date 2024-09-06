Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767A4CE7AA3
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 11:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CEDA84127;
	Fri,  6 Sep 2024 11:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEWY0HLp20RB; Fri,  6 Sep 2024 11:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36A9D84130
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36A9D84130;
	Fri,  6 Sep 2024 11:59:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 267C61BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 11:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21AAB60708
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 11:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxxscWQK6lxW for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 11:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A7E560729
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A7E560729
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 11:58:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C161386CAD; Fri,  6 Sep 2024 11:58:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Sep 2024 13:57:35 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 96c79a4349bc0c19f95b5d24d1408fc20293e70a
X-Git-Newrev: d78b6cf98a47fabde85ea10c7c04d276ab484d68
X-Patchwork-Hint: ignore
Message-Id: <20240906115852.C161386CAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/hiawatha: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=d78b6cf98a47fabde85ea10c7c04d276ab484d68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
index 4b1a3ca86c..a5d8a7fbb1 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -26,7 +26,7 @@ config BR2_PACKAGE_HIAWATHA
 	  pipelining, keep alive connections, URL rewriting and many
 	  more.
 
-	  http://www.hiawatha-webserver.org/
+	  https://hiawatha.leisink.net/
 
 if BR2_PACKAGE_HIAWATHA
 
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 2ba8efb2fe..9268c368bc 100644
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
