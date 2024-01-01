Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57C0C4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A99743695;
	Mon,  1 Jan 2024 21:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A99743695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sgDmlCi0XZkN; Mon,  1 Jan 2024 21:18:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35C1840A82;
	Mon,  1 Jan 2024 21:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35C1840A82
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 162C11BF3D5
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E8B481E77
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E8B481E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VczTMtA0r2Nj for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:08:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16073835ED
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16073835ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4F1283B17; Mon,  1 Jan 2024 21:06:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 22:05:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b62f5905e9f9d47363983a5bd7ef8672b21cca6
X-Git-Newrev: 5cb3981129e74075f7244fecf76edbfc15f25986
X-Patchwork-Hint: ignore
Message-Id: <20240101210632.E4F1283B17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/autofs: bump to version 5.1.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=5cb3981129e74075f7244fecf76edbfc15f25986
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/tree/CHANGELOG?h=release_5_1_9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/autofs/autofs.hash | 2 +-
 package/autofs/autofs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/autofs/autofs.hash b/package/autofs/autofs.hash
index 97bc757d6b..67d09e859a 100644
--- a/package/autofs/autofs.hash
+++ b/package/autofs/autofs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/daemons/autofs/v5/sha256sums.asc
-sha256  b33d1059855664b20eeda26f3e28ff518fb0c3d58f565570af2ae569dc73c0fd  autofs-5.1.8.tar.xz
+sha256  87e6af6a03794b9462ea519781e50e7d23b5f7c92cd59e1142c85d2493b3c24b  autofs-5.1.9.tar.xz
 
 # Hash for license files
 sha256  458028929f712b4795bc5adc31a1d6a2151364ce1b372ac43f613f56c8448fed  COPYING
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 97b1b6b3e4..e9eff98a0a 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOFS_VERSION = 5.1.8
+AUTOFS_VERSION = 5.1.9
 AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
