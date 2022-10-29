Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C5CC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 16:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D683A813C1;
	Sat, 29 Oct 2022 16:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D683A813C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PcuE07ADLwnL; Sat, 29 Oct 2022 16:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BADA813B6;
	Sat, 29 Oct 2022 16:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BADA813B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A8941BF5DC
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7363C404C8
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7363C404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V-qmVvyL1VGR for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 16:11:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46D174047C
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 16:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46D174047C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3447686FAB; Sat, 29 Oct 2022 16:11:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 18:09:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66c05c24baf17b98b7168bd950fbf40d25223247
X-Git-Newrev: 96db6a8ac96742cb817f87ce4c869677c6a6cfda
X-Patchwork-Hint: ignore
Message-Id: <20221029161122.3447686FAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: bump version to 3.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=96db6a8ac96742cb817f87ce4c869677c6a6cfda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://download.samba.org/pub/rsync/NEWS

Switched _SITE and package URL to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsync/Config.in  | 2 +-
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/rsync/Config.in b/package/rsync/Config.in
index b952974efb..b572c701ec 100644
--- a/package/rsync/Config.in
+++ b/package/rsync/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_RSYNC
 	help
 	  File transfer program to keep remote files in sync.
 
-	  http://rsync.samba.org/
+	  https://rsync.samba.org/
diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index f0ba4d321d..842b5c099f 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/rsync/src/rsync-3.2.5.tar.gz.asc
-sha256  2ac4d21635cdf791867bc377c35ca6dda7f50d919a58be45057fd51600c69aba  rsync-3.2.5.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.2.7.tar.gz.asc
+sha256  4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb  rsync-3.2.7.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e288033b98..81ad4b9291 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.2.5
-RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
+RSYNC_VERSION = 3.2.7
+RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
 RSYNC_CPE_ID_VENDOR = samba
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
