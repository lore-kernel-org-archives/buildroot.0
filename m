Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DCBC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 14:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 112B160087;
	Sat, 23 Dec 2023 14:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 112B160087
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 65fvYYBc93yl; Sat, 23 Dec 2023 14:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6835A60AE1;
	Sat, 23 Dec 2023 14:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6835A60AE1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1760E1BF280
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0F4F40524
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0F4F40524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iw4KIGCaO3dR for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 14:25:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAC6C40131
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 14:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAC6C40131
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E3487FD65; Sat, 23 Dec 2023 14:25:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 15:24:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93d38e7c166ff6e782a45afcbac618057198a10e
X-Git-Newrev: 4dc9ef6895ce6dbd81eb55d7d4c11b2d820b3ce9
X-Patchwork-Hint: ignore
Message-Id: <20231223142509.9E3487FD65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unrar: bump version to 6.2.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dc9ef6895ce6dbd81eb55d7d4c11b2d820b3ce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the Debian changelog, it doesn't seem like there is any
security issue addressed between 6.2.10 and 6.2.12:

unrar-nonfree (1:6.2.12-1) unstable; urgency=medium

  * New upstream version 6.2.12
  * Rediff patches

 -- YOKOTA Hiroshi <yokota.hgml@gmail.com>  Thu, 05 Oct 2023 20:49:53 +0900

unrar-nonfree (1:6.2.11-1) unstable; urgency=medium

  * New upstream version 6.2.11

 -- YOKOTA Hiroshi <yokota.hgml@gmail.com>  Wed, 20 Sep 2023 21:41:29 +0900

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index f0600af771..c9a5f521a4 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  55fe6ebd5e48d6655bfda3fd19b55438ca05e13c7e69772420caad9fdb68ef42  unrarsrc-6.2.10.tar.gz
+sha256  a008b5f949bca9bb4ffa1bebbfc8b3c14b89df10a10354809b845232d5f582e5  unrarsrc-6.2.12.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index ac19225937..0a61bcfcba 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 6.2.10
+UNRAR_VERSION = 6.2.12
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
