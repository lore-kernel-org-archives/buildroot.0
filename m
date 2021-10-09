Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992E9C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:04:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C78260F5D
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C78260F5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37A62403CB;
	Sat,  9 Oct 2021 12:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZRdjWktR-C2; Sat,  9 Oct 2021 12:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C71140325;
	Sat,  9 Oct 2021 12:04:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3786A1BF36A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE22F60A70
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BEMj0vQoq7Of for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 12:02:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68FDB60BA4
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 12:02:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A6D219359C; Sat,  9 Oct 2021 12:00:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 13:50:58 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: a52c0d9020bff57046c01c6132bcc6c3b16a6180
X-Git-Newrev: c00da3ed1a94fc0f18bdda3b4fbf4af53d9e2895
X-Patchwork-Hint: ignore
Message-Id: <20211009120015.A6D219359C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/wireless-regdb:
 bump version to 2021.08.28
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

commit: https://git.buildroot.net/buildroot/commit/?id=c00da3ed1a94fc0f18bdda3b4fbf4af53d9e2895
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Changelog (since 2021.04.21):

  47007d0 wireless-regdb: update regulatory database based on preceding changes
  e983a25 Update regulatory rules for Ecuador (EC)
  a0bcb88 wireless-regdb: Update regulatory rules for Norway (NO) on 6 and 60 GHz
  cdf854d wireless-regdb: Update regulatory rules for Germany (DE) on 6GHz
  a4468e8 wireless-regdb: update regulatory database based on preceding changes
  86cba52 wireless-regdb: reduce bandwidth for 5730-5850 and 5850-5895 MHz in US
  6fa2384 wireless-regdb: remove PTMP-ONLY from 5850-5895 MHz for US
  9839e1e wireless-regdb: recent FCC report and order allows 5850-5895 immediately
  42dfaf4 wireless-regdb: update 5725-5850 MHz rule for GB

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 95f3fc514c30626fa02b457423231d16db416612)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index d941fc3b1a..abe8f6b000 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  9e4c02b2a9710df4dbdb327c39612e8cbbae6495987afeddaebab28c1ea3d8fa  wireless-regdb-2021.04.21.tar.xz
+sha256  cff370c410d1e6d316ae0a7fa8ac6278fdf1efca5d3d664aca7cfd2aafa54446  wireless-regdb-2021.08.28.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 49a3824ce8..0db8c6f345 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2021.04.21
+WIRELESS_REGDB_VERSION = 2021.08.28
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
