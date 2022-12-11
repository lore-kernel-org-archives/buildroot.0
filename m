Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EE6C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 08:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 713F74093E;
	Sun, 11 Dec 2022 08:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 713F74093E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4JRnn6s69Fh6; Sun, 11 Dec 2022 08:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F6440866;
	Sun, 11 Dec 2022 08:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78F6440866
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21F721BF868
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFEE44085D
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFEE44085D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aRamoXlfAHUG for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:20:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25A074085B
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25A074085B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A2A685FA5; Sun, 11 Dec 2022 08:20:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:15:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0aea5f9d8e63f6146730c39b05ec8cae15dd100
X-Git-Newrev: 61f03109c7d6b2a66462d920ee5f4b9f7530ca7a
X-Patchwork-Hint: ignore
Message-Id: <20221211082030.0A2A685FA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/smcroute: bump to version 2.5.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=61f03109c7d6b2a66462d920ee5f4b9f7530ca7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/troglobit/smcroute/releases/tag/2.5.6

Most important news from the ChangeLog:
  - Batch mode supoprt for smcroutectl
  - Fix strange behavior when joining/leaving the same group
  - Minor spelling checks of documentation

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Joachim Wiberg <troglobit@gmail.com>
[yann.morin.1998@free.fr: added news by Joachim]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/smcroute/smcroute.hash | 4 ++--
 package/smcroute/smcroute.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index 642a1f62fe..b472dfbc04 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,5 +1,5 @@
-# Upstream .sha256 from GitHub
-sha256  2569cd97fa2047df14203a7144be53a1b32928cb460421a302bbcce381b42bc3  smcroute-2.5.5.tar.gz
+# Hash from https://github.com/troglobit/smcroute/releases/download/2.5.6/smcroute-2.5.6.tar.gz.sha256
+sha256  0be38f617e322daafaa941c02423239f5c117b940cf0f45bacadb6733c4b3916  smcroute-2.5.6.tar.gz
 
 # Locally generated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index e6114c9a8c..0c4f88ab1b 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.5.5
+SMCROUTE_VERSION = 2.5.6
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
