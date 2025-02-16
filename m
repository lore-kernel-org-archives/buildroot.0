Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5937DC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 17:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1580C4095D;
	Sun, 16 Feb 2025 17:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbGHc7Vrwkqs; Sun, 16 Feb 2025 17:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D944840952
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D944840952;
	Sun, 16 Feb 2025 17:41:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 63C85C8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4899E81EF7
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNHYUA9hJkEC for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 17:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8572881EF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8572881EF9
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:41:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77B5A876CB; Sun, 16 Feb 2025 17:41:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 18:35:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2577fbedbe8da043cdee4e3758033c19859da11e
X-Git-Newrev: 08e53fbf7bd4007ef733d90a01f9f9837fc71c11
X-Patchwork-Hint: ignore
Message-Id: <20250216174100.77B5A876CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xapian: bump to version 1.4.27
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=08e53fbf7bd4007ef733d90a01f9f9837fc71c11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change log for version 1.4.27:
https://trac.xapian.org/wiki/ReleaseOverview/1.4.27

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xapian/xapian.hash | 4 ++--
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index 01d6c19ad6..898d2e4eff 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,5 +1,5 @@
-# From https://lists.xapian.org/pipermail/xapian-discuss/2024-July/010052.html
-sha256  9e6a7903806966d16ce220b49377c9c8fad667c8f0ffcb23a3442946269363a7  xapian-core-1.4.26.tar.xz
+# From https://lists.xapian.org/pipermail/xapian-discuss/2024-December/010056.html
+sha256  bcbc99cfbf16080119c2571fc296794f539bd542ca3926f17c2999600830ab61  xapian-core-1.4.27.tar.xz
 
 # locally computed
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 7677571288..187e366066 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.26
+XAPIAN_VERSION = 1.4.27
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
