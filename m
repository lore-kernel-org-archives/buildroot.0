Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8974E728CC
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 17:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 874BF820A6;
	Fri, 29 Sep 2023 17:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 874BF820A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CRPEbifhw1sh; Fri, 29 Sep 2023 17:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D10C483C8B;
	Fri, 29 Sep 2023 17:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D10C483C8B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22F3C1BF990
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 17:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFFB8410B8
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 17:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFFB8410B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5LD4N11x725 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 17:40:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02121410B7
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 17:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02121410B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E460A8354D; Fri, 29 Sep 2023 17:39:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 19:37:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f64bdf834763e2f0fd86d0fde5cd034d5efa44de
X-Git-Newrev: c6bf26cfb2ab61675cbab146c43c21511d0d5c29
X-Patchwork-Hint: ignore
Message-Id: <20230929173959.E460A8354D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minizip-zlib: bump to version 1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6bf26cfb2ab61675cbab146c43c21511d0d5c29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/madler/zlib/commits/v1.3/contrib/minizip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minizip-zlib/minizip-zlib.hash | 2 +-
 package/minizip-zlib/minizip-zlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
index df5e8d723a..23bfda8474 100644
--- a/package/minizip-zlib/minizip-zlib.hash
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  d14c38e313afc35a9a8760dadf26042f51ea0f5d154b0630a31da0540107fb98  zlib-1.2.13.tar.xz
+sha256  8a9ba2898e1d0d774eca6ba5b4627a11e5588ba85c8851336eb38de4683050a7  zlib-1.3.tar.xz
 # License files, locally calculated
 sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index 4367a2420f..259570f75c 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_ZLIB_VERSION = 1.2.13
+MINIZIP_ZLIB_VERSION = 1.3
 MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
 MINIZIP_ZLIB_SITE = http://www.zlib.net
 MINIZIP_ZLIB_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
