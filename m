Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7499CDB482
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E780400C8;
	Sun, 15 Oct 2023 18:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E780400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FduSx-ORXqwv; Sun, 15 Oct 2023 18:18:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45654414A4;
	Sun, 15 Oct 2023 18:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45654414A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55C241BF573
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B6854162C
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B6854162C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HO5qu_pDlC95 for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:18:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 492C141620
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 492C141620
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33A71852C8; Sun, 15 Oct 2023 18:18:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 20:16:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5759ec066ae63eb8f41da3f890bf645df20047c6
X-Git-Newrev: 4919f7f9c312ab6680bf888d2ab438788f1c7475
X-Patchwork-Hint: ignore
Message-Id: <20231015181834.33A71852C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/librsync: bump to version 2.3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4919f7f9c312ab6680bf888d2ab438788f1c7475
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/librsync/librsync/blob/v2.3.4/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librsync/librsync.hash | 2 +-
 package/librsync/librsync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/librsync/librsync.hash b/package/librsync/librsync.hash
index c8ca61e516..7fc7395a49 100644
--- a/package/librsync/librsync.hash
+++ b/package/librsync/librsync.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ef8ce23df38d5076d25510baa2cabedffbe0af460d887d86c2413a1c2b0c676f  librsync-2.3.2.tar.gz
+sha256  a0dedf9fff66d8e29e7c25d23c1f42beda2089fb4eac1b36e6acd8a29edfbd1f  librsync-2.3.4.tar.gz
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 97f5c607b0..1465963c61 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRSYNC_VERSION = 2.3.2
+LIBRSYNC_VERSION = 2.3.4
 LIBRSYNC_SITE = https://github.com/librsync/librsync/releases/download/v$(LIBRSYNC_VERSION)
 LIBRSYNC_LICENSE = LGPL-2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
