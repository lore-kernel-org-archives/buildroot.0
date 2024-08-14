Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E370AC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 17:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F970605C8;
	Wed, 14 Aug 2024 17:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzldvvWuwCRu; Wed, 14 Aug 2024 17:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5F1E60637
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5F1E60637;
	Wed, 14 Aug 2024 17:52:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8581BF5F6
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 17:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18408402BC
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 17:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3qcIc4r55-C for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 17:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEE6040111
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEE6040111
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 17:52:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E202185C59; Wed, 14 Aug 2024 17:52:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 19:52:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f089e7b488750c3344598602ae8f560676e56a8f
X-Git-Newrev: 2a547e2c424ac08d8741dc557aee968f1b659735
X-Patchwork-Hint: ignore
Message-Id: <20240814175224.E202185C59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hiawatha: update homepage URL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2a547e2c424ac08d8741dc557aee968f1b659735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The download and homepage URL for this project have been
updated. The old site no longer works.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
