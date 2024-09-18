Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BFDCDD54E
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 17:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B184B411CD;
	Wed, 18 Sep 2024 17:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D83y4F7FI8-7; Wed, 18 Sep 2024 17:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35D2E41203
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35D2E41203;
	Wed, 18 Sep 2024 17:09:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C30C41BF5A7
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 17:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEE1E42481
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 17:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0x4gU1_R0xAj for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 17:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB8AE42459
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB8AE42459
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 17:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9795083B7F; Wed, 18 Sep 2024 17:09:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 19:08:53 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1f6026dfa057c11bd46986a3def966e842373e7e
X-Git-Newrev: 8d376b3972a67ce7a93ece0902f0fd7592c1e136
X-Patchwork-Hint: ignore
Message-Id: <20240918170947.9795083B7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/fbset: update
 download URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d376b3972a67ce7a93ece0902f0fd7592c1e136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes:

 http://autobuild.buildroot.org/results/13e/13e28650fc58fc62c801a664d79616c6dd39a8ac

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c1a6987da9bfebac25db0d05fa69a706a933889f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
