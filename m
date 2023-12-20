Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97AAC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 21:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A4DE61546;
	Wed, 20 Dec 2023 21:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A4DE61546
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SVlMen41GDFn; Wed, 20 Dec 2023 21:06:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4B1561055;
	Wed, 20 Dec 2023 21:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4B1561055
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD4B01BF361
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 21:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86BB983A4B
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 21:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86BB983A4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APFGdLKnnuLd for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 21:06:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B39E682275
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 21:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B39E682275
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BF0287CA6; Wed, 20 Dec 2023 21:06:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 22:01:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd1ede59aa603abc4a4b21adc33ca47a59addb93
X-Git-Newrev: fdeb41bda6c3f56012264cf38a8d3ae466f04320
X-Patchwork-Hint: ignore
Message-Id: <20231220210618.9BF0287CA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/transmission: bump version to 4.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdeb41bda6c3f56012264cf38a8d3ae466f04320
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/transmission/transmission/releases/tag/4.0.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 74b3a654b5..ed600c7699 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  15f7b4318fdfbffb19aa8d9a6b0fd89348e6ef1e86baa21a0806ffd1893bd5a6  transmission-4.0.4.tar.xz
+sha256  fd68ff114a479200043c30c7e69dba4c1932f7af36ca4c5b5d2edcb5866e6357  transmission-4.0.5.tar.xz
 # Locally calculated
 sha256  f56732960a61ecf3b9637404eef1a39221d2006336a98792b7b65a79f155449c  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index efb46c0feb..f1130aeadd 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.0.4
+TRANSMISSION_VERSION = 4.0.5
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
