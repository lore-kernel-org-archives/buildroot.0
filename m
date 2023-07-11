Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A9AEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 406C841E8C;
	Tue, 11 Jul 2023 21:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 406C841E8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_BuIssdGk9A; Tue, 11 Jul 2023 21:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FE2741E75;
	Tue, 11 Jul 2023 21:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FE2741E75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29A951BF32D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1062C83A47
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1062C83A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wnxR2CErvPLA for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:51:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43E7D83A45
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E7D83A45
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 328C986E65; Tue, 11 Jul 2023 21:51:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 23:51:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7690f005e0540f888fa4333c2b93fee8f8ad2654
X-Git-Newrev: ee2f9c920ab33d23e07e439f440d549eb1bb4e09
X-Patchwork-Hint: ignore
Message-Id: <20230711215156.328C986E65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189fs: bump version to
 2023-07-08
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee2f9c920ab33d23e07e439f440d549eb1bb4e09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version fixes a wrong patching for Linux 6.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index 95a031b6f2..377812fba8 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5d8aad48b8d124a313e5b8182c5dba2b94ecdbac2a9f1861a50c081b9034a543  rtl8189fs-c223a25b1000d64432eca4201a8f012414dfc7ce.tar.gz
+sha256  9ff7aa9ee8cd7a8f386531d3b009e7bcbce1ff71bb676c187c40e538755eb8b5  rtl8189fs-75a566a830037c7d1309c5a9fe411562772a1cf2.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index dd35a166e5..ca8ea15c03 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = c223a25b1000d64432eca4201a8f012414dfc7ce
+RTL8189FS_VERSION = 75a566a830037c7d1309c5a9fe411562772a1cf2
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
