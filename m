Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B06EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F69F61190;
	Sun, 24 Jul 2022 19:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F69F61190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5anHcVEk_Ih; Sun, 24 Jul 2022 19:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1976F611A1;
	Sun, 24 Jul 2022 19:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1976F611A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13EF61BF97C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1C8540C63
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1C8540C63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bTc7-a-zF_V3 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC35940114
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC35940114
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EB42D85CB9; Sun, 24 Jul 2022 19:41:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f3b3e61e9f7f618602003dc4a98660edb94095f
X-Git-Newrev: f620f401d3df05e0a7496c6997fe147b406fd25f
X-Patchwork-Hint: ignore
Message-Id: <20220724194151.EB42D85CB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xcmsdb: bump version to
 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=f620f401d3df05e0a7496c6997fe147b406fd25f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash | 5 +++--
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
index 75a07f36ab..7590580d88 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002567.html
-sha256  e5585361bb8b6a05bb814a8d0e444ee93e0f00180881d3070aff4571e97f67c6  xcmsdb-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003172.html
+sha256  3c77eec4537d5942bb0966973b787bfdaf7121f3125ffa81bb1c9708d4cf4f55  xcmsdb-1.0.6.tar.xz
+sha512  e47d9498ce496effbc44a66e70af91d9fe65c344a17916fd4990a4c84fa8879aa09b6695aeb6ef595f475c16a13c7c31d4c48449234564de7de38d7436764fae  xcmsdb-1.0.6.tar.xz
 # Locally computed
 sha256  c3bd4ac91beb08fee5272b17a3ddee8d2791cc5eaee5bce5271042a45fa4fa6a  COPYING
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
index 3cccacc0b4..4af341a027 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCMSDB_VERSION = 1.0.5
-XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.bz2
-XAPP_XCMSDB_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCMSDB_VERSION = 1.0.6
+XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.xz
+XAPP_XCMSDB_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XCMSDB_LICENSE = MIT
 XAPP_XCMSDB_LICENSE_FILES = COPYING
 XAPP_XCMSDB_DEPENDENCIES = xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
