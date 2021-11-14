Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55236C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 111C084BBA;
	Mon,  6 Dec 2021 18:28:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ugj640LSL1md; Mon,  6 Dec 2021 18:28:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71C1984BB2;
	Mon,  6 Dec 2021 18:28:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02BA61BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 469F341C0D
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlo7voumPQws for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDFA841C2F
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 685A381468; Mon,  6 Dec 2021 18:07:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:27:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9ddee54a5971823dd3cdeb2727ca0950e245365
X-Git-Newrev: 9c9b10efb0ce472bee3943b2e49ad943e794fabf
X-Patchwork-Hint: ignore
Message-Id: <20211206180738.685A381468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] rtl8189fs: bump revision to e10294d2
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
