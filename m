Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C3AEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B27C741E80;
	Tue, 11 Jul 2023 21:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B27C741E80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZk2wqoIIlnZ; Tue, 11 Jul 2023 21:48:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE52441E7A;
	Tue, 11 Jul 2023 21:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE52441E7A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E3711BF32D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44F1F83A41
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44F1F83A41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CBWtczmhxNs for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:47:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8087983A3F
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8087983A3F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F3E486E58; Tue, 11 Jul 2023 21:47:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 23:47:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ebfce3c70df968fb5c3b9f5c1f9ba5f904cf630
X-Git-Newrev: 947cf4125e87eaa193de37d3a3fc5fcb885ad531
X-Patchwork-Hint: ignore
Message-Id: <20230711214758.6F3E486E58@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptodev-linux: bump version to
 1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=947cf4125e87eaa193de37d3a3fc5fcb885ad531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/cryptodev-linux/cryptodev-linux/blob/master/NEWS
"* Fix compilation issues against Linux kernel 6.3"

Fixes:
http://autobuild.buildroot.net/results/9b9/9b9ad744d8a37fc46726461551a2dcb3c26a1341/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptodev-linux/cryptodev-linux.hash | 2 +-
 package/cryptodev-linux/cryptodev-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index d649e8934a..300aa3bcd4 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f51c2254749233b1b1d7ec9445158bd709f124f88e1c650fe2faac83c3a81938  cryptodev-linux-1.12.tar.gz
+sha256  33b7915c46eb39a37110e88c681423c0dd0df25d784b6e1475ac3196367f0db5  cryptodev-linux-1.13.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 5a9e6ad233..580ea89520 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = 1.12
+CRYPTODEV_LINUX_VERSION = 1.13
 CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,cryptodev-linux-$(CRYPTODEV_LINUX_VERSION))
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
