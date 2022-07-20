Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679E7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0034483FB9;
	Wed, 20 Jul 2022 21:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0034483FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G8KNaLhOWOih; Wed, 20 Jul 2022 21:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F83783FB8;
	Wed, 20 Jul 2022 21:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F83783FB8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B92B1BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E81BC612D9
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E81BC612D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_88yS1coH3M for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:19:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D434612D7
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D434612D7
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 66A92840A3; Wed, 20 Jul 2022 21:06:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 23:18:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e50f20c35c7ff835a70acf0cf6f38f2dc2f512b0
X-Git-Newrev: e843433e186c6802ae0c31cb501b2212972ed725
X-Patchwork-Hint: ignore
Message-Id: <20220720210620.66A92840A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez-alsa: bump to version 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e843433e186c6802ae0c31cb501b2212972ed725
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 4.0.0 contains various changes and fixes, including LC3
support and dbus changes.

Update the license file hash, following a copyright year change.

Signed-off-by: Andrea Daoud <andreadaoud6@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bluez-alsa/bluez-alsa.hash | 4 ++--
 package/bluez-alsa/bluez-alsa.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index f6e7294681..ad7fe62708 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  d9a878d9fd7f18842c9c8ed83bc96cab684753c90f2751d575a3cdd776ec78a5  bluez-alsa-3.1.0.tar.gz
-sha256  60253922a459245128c34eb379cbda7c76936636d4c10edc576663a0f560dd4d  LICENSE
+sha256  ce5e060e61669d61d44f5f9bad34a7b88378376e9d49d31482406a68127a6b29  bluez-alsa-4.0.0.tar.gz
+sha256  aaebd0cca73b0f361cb7f1bffa40418b2485fc10bfae7a47c193679c7e26d2e3  LICENSE
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index f5e3aa1245..83dfce6177 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ_ALSA_VERSION = 3.1.0
+BLUEZ_ALSA_VERSION = 4.0.0
 BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,v$(BLUEZ_ALSA_VERSION))
 BLUEZ_ALSA_LICENSE = MIT
 BLUEZ_ALSA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
