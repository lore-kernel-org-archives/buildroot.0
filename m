Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660D1C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 234E5405F8;
	Sat, 20 Jul 2024 21:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BU8M3ypirMpo; Sat, 20 Jul 2024 21:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E35D440609
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E35D440609;
	Sat, 20 Jul 2024 21:22:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB5FC1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D800E81CBA
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrD_XBZri2Bk for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FDD081316
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FDD081316
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:22:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EABEC86E76; Sat, 20 Jul 2024 21:22:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:18:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 183f5399cef8b09b675ef7386a0e4984294e5f59
X-Git-Newrev: 4649372e87bd33f6e159b585796137bbedf4fd3a
X-Patchwork-Hint: ignore
Message-Id: <20240720212210.EABEC86E76@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmaxminddb: bump to version
 1.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4649372e87bd33f6e159b585796137bbedf4fd3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/maxmind/libmaxminddb/blob/1.10.0/Changes.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmaxminddb/libmaxminddb.hash | 2 +-
 package/libmaxminddb/libmaxminddb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index f5c84fc905..567a428e42 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a80682a89d915fdf60b35d316232fb04ebf36fff27fda9bd39fe8a38d3cd3f12  libmaxminddb-1.9.1.tar.gz
+sha256  5e6db72df423ae225bfe8897069f6def40faa8931f456b99d79b8b4d664c6671  libmaxminddb-1.10.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index 1a1a2e302a..84fc3d11dd 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.9.1
+LIBMAXMINDDB_VERSION = 1.10.0
 LIBMAXMINDDB_SITE = \
 	https://github.com/maxmind/libmaxminddb/releases/download/$(LIBMAXMINDDB_VERSION)
 LIBMAXMINDDB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
