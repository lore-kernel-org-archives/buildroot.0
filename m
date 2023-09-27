Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF28E82CC6
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EA9C42C31;
	Wed, 27 Sep 2023 19:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EA9C42C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wKHeOO4q_OR0; Wed, 27 Sep 2023 19:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13F3442C77;
	Wed, 27 Sep 2023 19:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13F3442C77
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 220691BF32A
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8BBA610B0
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8BBA610B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4BV7uN8-PTw for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9975561442
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9975561442
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8845882645; Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:02:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c7d532ee9a9a4c9882412cfda7447df28fc3884
X-Git-Newrev: df78ca175c9bd16200b96ad667d6f99b36acbc7b
X-Patchwork-Hint: ignore
Message-Id: <20230927190533.8845882645@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/newt: bump to version 0.52.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=df78ca175c9bd16200b96ad667d6f99b36acbc7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://pagure.io/newt/blob/6e3a852c6becac7f2f231453682089577ad3de3d/f/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/newt/newt.hash | 4 ++--
 package/newt/newt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/newt/newt.hash b/package/newt/newt.hash
index 36487d998e..6d5f7c3dca 100644
--- a/package/newt/newt.hash
+++ b/package/newt/newt.hash
@@ -1,5 +1,5 @@
 # From https://releases.pagure.org/newt/CHECKSUMS
-sha256  265eb46b55d7eaeb887fca7a1d51fe115658882dfe148164b6c49fccac5abb31  newt-0.52.21.tar.gz
-sha512  d53d927996d17223e688bf54dccfabb2a3dc02bfe38ffc455964e86feaca3cd9f9ab5b19774433be430fa4d761cd9b6680b558f297acb86f80daeb6942f7d23c  newt-0.52.21.tar.gz
+sha256  caa372907b14ececfe298f0d512a62f41d33b290610244a58aed07bbc5ada12a  newt-0.52.23.tar.gz
+sha512  c845d03946f72a6b46301152d7dc308f71d17b03d255d73d02ea7deb5392e22522dc8504f941fcffe5309c6c10f1b56742dac8585a16b0dc7e0c463f18871dda  newt-0.52.23.tar.gz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index b39acb0fcf..3c9efe132f 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEWT_VERSION = 0.52.21
+NEWT_VERSION = 0.52.23
 NEWT_SITE = https://pagure.io/releases/newt
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
