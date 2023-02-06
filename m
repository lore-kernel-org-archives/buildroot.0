Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC829C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C6367003B;
	Tue, 21 Feb 2023 01:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C6367003B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VkcTLNx2Brpx; Tue, 21 Feb 2023 01:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D62016FE59;
	Tue, 21 Feb 2023 01:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D62016FE59
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74B8E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 974D56FE5B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 974D56FE5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B5qm0W1zIeq6 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C873D6FBEF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C873D6FBEF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA3C7828C8; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 22:30:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 452365a385ef35e808eb2eb669d1e3227c7399dd
X-Git-Newrev: f20611347fcce58f89f1fedf2cebaf8b2e077f67
X-Patchwork-Hint: ignore
Message-Id: <20230220205250.BA3C7828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdal: bump version to
 3.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f20611347fcce58f89f1fedf2cebaf8b2e077f67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdal/gdal.hash | 6 +++---
 package/gdal/gdal.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdal/gdal.hash b/package/gdal/gdal.hash
index 826a7f0b45..ab77d7840d 100644
--- a/package/gdal/gdal.hash
+++ b/package/gdal/gdal.hash
@@ -1,6 +1,6 @@
-# md5 from: https://download.osgeo.org/gdal/3.5.1/gdal-3.5.1.tar.xz.md5, sha256 locally computed:
-md5  4b7981efbeed69c06c79fb65d0a60d83  gdal-3.5.1.tar.xz
-sha256  d12c30a9eacdeaab493c0d1c9f88eb337c9cbb5bb40744c751bdd5a5af166ab6  gdal-3.5.1.tar.xz
+# md5 from: https://download.osgeo.org/gdal/3.5.2/gdal-3.5.2.tar.xz.md5, sha256 locally computed:
+md5  821b3b0637ebada5d20dbefb2e3ec964  gdal-3.5.2.tar.xz
+sha256  0874dfdeb9ac42e53c37be4184b19350be76f0530e1f4fa8004361635b9030c2  gdal-3.5.2.tar.xz
 
 # Hashes of license files:
 sha256  fac0116e799ca4de79b076ee04863b5e2b69541ea3664b9bb108c81a5355f16a  LICENSE.TXT
diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 2d6dff1a93..a3b11c53af 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDAL_VERSION = 3.5.1
+GDAL_VERSION = 3.5.2
 GDAL_SITE = https://download.osgeo.org/gdal/$(GDAL_VERSION)
 GDAL_SOURCE = gdal-$(GDAL_VERSION).tar.xz
 GDAL_LICENSE = MIT, many others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
