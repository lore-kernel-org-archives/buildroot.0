Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891E0C4167D
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 12:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40B3C856B6;
	Mon, 30 Oct 2023 12:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40B3C856B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KuDUTDa6MQEc; Mon, 30 Oct 2023 12:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67412855FF;
	Mon, 30 Oct 2023 12:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67412855FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47B211BF408
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 12:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB8FC4311A
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 12:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB8FC4311A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nzOM3bLb5ujQ for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 12:42:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5160430C4
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 12:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5160430C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3CAF86190; Mon, 30 Oct 2023 12:42:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 13:40:27 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: b2a0d00ef064600c1d9ee2544f972f26e6e3b5e8
X-Git-Newrev: 30472d98b8766d626759a7aa52d76c4f9a0164c5
X-Patchwork-Hint: ignore
Message-Id: <20231030124259.B3CAF86190@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/minizip-zlib:
 bump to version 1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=30472d98b8766d626759a7aa52d76c4f9a0164c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

https://github.com/madler/zlib/commits/v1.3/contrib/minizip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c6bf26cfb2ab61675cbab146c43c21511d0d5c29)
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
