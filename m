Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E910EC8737
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD0DD8148E;
	Thu,  7 Sep 2023 15:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD0DD8148E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UvvpUmM2TAJM; Thu,  7 Sep 2023 15:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BC9382BF5;
	Thu,  7 Sep 2023 15:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BC9382BF5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DA031BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3158612A7
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3158612A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0HtpV1t1iYhl for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F41E7612AD
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F41E7612AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F21AF86A22; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 23:49:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16da1e0b047688831e6653b01194807af0a9df41
X-Git-Newrev: cd8aa311be7360cbe8afbd974cda8bdc018e4448
X-Patchwork-Hint: ignore
Message-Id: <20230907145133.F21AF86A22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/transmission: bump version to 4.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd8aa311be7360cbe8afbd974cda8bdc018e4448
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/transmission/transmission/releases/tag/4.0.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index e6775c47e7..74b3a654b5 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  b6b01fd58e42bb14f7aba0253db932ced050fcd2bba5d9f8469d77ddd8ad545a  transmission-4.0.3.tar.xz
+sha256  15f7b4318fdfbffb19aa8d9a6b0fd89348e6ef1e86baa21a0806ffd1893bd5a6  transmission-4.0.4.tar.xz
 # Locally calculated
 sha256  f56732960a61ecf3b9637404eef1a39221d2006336a98792b7b65a79f155449c  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 26deeefa34..efb46c0feb 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.0.3
+TRANSMISSION_VERSION = 4.0.4
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
