Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99EDC5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56B2B60786;
	Mon, 26 Aug 2024 16:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9DkvtRR0mfZ; Mon, 26 Aug 2024 16:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD22760747
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD22760747;
	Mon, 26 Aug 2024 16:31:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83C1F1BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7162E60747
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCTDiaQLoWxG for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7874D605A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7874D605A5
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:31:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63EDB86352; Mon, 26 Aug 2024 16:31:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 18:28:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf647b69fbeec000663bd9b55047e7c2d69217f8
X-Git-Newrev: c1a6987da9bfebac25db0d05fa69a706a933889f
X-Patchwork-Hint: ignore
Message-Id: <20240826163118.63EDB86352@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fbset: update download URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1a6987da9bfebac25db0d05fa69a706a933889f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

 http://autobuild.buildroot.org/results/13e/13e28650fc58fc62c801a664d79616c6dd39a8ac

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fbset/Config.in | 2 +-
 package/fbset/fbset.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fbset/Config.in b/package/fbset/Config.in
index b4ef41f0a4..9422d5bca4 100644
--- a/package/fbset/Config.in
+++ b/package/fbset/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_FBSET
 	  simple and unique interface to access different kinds of
 	  graphic displays.
 
-	  http://users.telenet.be/geertu/Linux/fbdev/
+	  http://g33rt.be/migrated/Linux/fbdev/
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 8d2a477f8b..526cba40d3 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FBSET_VERSION = 2.1
-FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
+FBSET_SITE = http://g33rt.be/migrated/Linux/fbdev
 FBSET_DEPENDENCIES = host-bison host-flex
 FBSET_LICENSE = GPL-2.0
 FBSET_LICENSE_FILES = fbset.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
