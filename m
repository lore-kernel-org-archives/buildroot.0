Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD79CC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E7B34172A;
	Sun, 11 Sep 2022 09:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7B34172A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TweO224OzSON; Sun, 11 Sep 2022 09:05:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8FEA419CF;
	Sun, 11 Sep 2022 09:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8FEA419CF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 159501BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AE8E60ACA
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AE8E60ACA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vM8sadLAxAZ8 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F0E160812
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F0E160812
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 50BCD8361F; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 22:02:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b31593d8299babf94c7851218dec9c7041cfa35
X-Git-Newrev: d4a82916c88aa73fa7486f6febd1672716a50036
X-Patchwork-Hint: ignore
Message-Id: <20220911084826.50BCD8361F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poke: bump to version 1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4a82916c88aa73fa7486f6febd1672716a50036
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
http://www.jemarch.net/poke-2.4-relnotes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/poke/poke.hash | 2 +-
 package/poke/poke.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poke/poke.hash b/package/poke/poke.hash
index c30713b91c..09dc4e8972 100644
--- a/package/poke/poke.hash
+++ b/package/poke/poke.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  cd528e6c1bbc540c3b629c2b4f36b784b30a026b005a38b99283422599442670  poke-2.1.tar.gz
+sha256  841e285917c6738ce982a6930e30ebeadecfb0655a79d9184f16f876a9fe6e47  poke-2.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  jitter/COPYING
diff --git a/package/poke/poke.mk b/package/poke/poke.mk
index 2852673548..d49e628dbf 100644
--- a/package/poke/poke.mk
+++ b/package/poke/poke.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POKE_VERSION = 2.1
+POKE_VERSION = 2.4
 POKE_SITE = $(BR2_GNU_MIRROR)/poke
 # gnulib license is a mix/mess of public-domain and various GPL and LGPL versions.
 POKE_LICENSE = GPL-3.0+, GPL-3.0+ (jitter), gnulib license (gnulib)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
