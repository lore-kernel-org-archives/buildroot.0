Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D90FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 09:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A949A40356;
	Mon, 31 Oct 2022 09:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A949A40356
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sq2_ZBh-sQmp; Mon, 31 Oct 2022 09:58:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDF3140345;
	Mon, 31 Oct 2022 09:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDF3140345
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 050EB1BF95E
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3C4A403E0
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3C4A403E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id da9VW36hn0R5 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:57:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08C6F402E5
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08C6F402E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED47887864; Mon, 31 Oct 2022 09:57:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 10:50:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55ef42e090b39fdf129b7e5e218019e0156fe166
X-Git-Newrev: fb35e5f032d714f80f058fc410f38a0361c4a3b1
X-Patchwork-Hint: ignore
Message-Id: <20221031095715.ED47887864@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/arp-scan: bump to version 1.9.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb35e5f032d714f80f058fc410f38a0361c4a3b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYING (gnu.org license file used since
https://github.com/royhills/arp-scan/commit/6194ffb69d831709d49b83f734f8c338c13df28c)

https://github.com/royhills/arp-scan/blob/1.9.8/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/arp-scan/arp-scan.hash | 4 ++--
 package/arp-scan/arp-scan.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/arp-scan/arp-scan.hash b/package/arp-scan/arp-scan.hash
index dd97333013..b18c6ceb38 100644
--- a/package/arp-scan/arp-scan.hash
+++ b/package/arp-scan/arp-scan.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e03c36e4933c655bd0e4a841272554a347cd0136faf42c4a6564059e0761c039  arp-scan-1.9.7.tar.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  b9b75ceaef6348f5951b06c773ec7a243a9e780e160eafebc369f9c27f6a7d3f  arp-scan-1.9.8.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index 3fdbd463c2..73d1b99bc7 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARP_SCAN_VERSION = 1.9.7
+ARP_SCAN_VERSION = 1.9.8
 ARP_SCAN_SITE = $(call github,royhills,arp-scan,$(ARP_SCAN_VERSION))
 ARP_SCAN_LICENSE = GPL-3.0+
 ARP_SCAN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
