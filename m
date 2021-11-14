Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDC6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:28:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F22C61073
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F22C61073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7AF24018A;
	Sun, 14 Nov 2021 14:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sA0JhKfIMezL; Sun, 14 Nov 2021 14:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33DA540154;
	Sun, 14 Nov 2021 14:27:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 957A41BF20B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85D4280E45
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zmOfKlJxlzfu for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:27:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E218A80D97
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:27:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7C78C8D25B; Sun, 14 Nov 2021 14:23:50 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:27:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c9ddee54a5971823dd3cdeb2727ca0950e245365
X-Git-Newrev: 9c9b10efb0ce472bee3943b2e49ad943e794fabf
X-Patchwork-Hint: ignore
Message-Id: <20211114142350.7C78C8D25B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] rtl8189fs: bump revision to
 e10294d2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c9b10efb0ce472bee3943b2e49ad943e794fabf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update out-of-tree driver to make it work with Linux kernel v5.15.

Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index f42799b48e..a7c3641841 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  7d425e18ebc427b3df5ff31185b4dc29c6bfd54f8e167f57c2254cea341a26c6  rtl8189fs-62c31d577c385316bb99107f60e63169dacc37db.tar.gz
+sha256  2350a15f866ac82a33c11f9505f2deb0f4aa819b9ac1f4809f8d6893412e73fd  rtl8189fs-e10294d2ded27586149fedee1f834d75477b8b40.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 4112b135ad..83c7f3ee0d 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 62c31d577c385316bb99107f60e63169dacc37db
+RTL8189FS_VERSION = e10294d2ded27586149fedee1f834d75477b8b40
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
