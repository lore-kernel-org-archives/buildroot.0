Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B251C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 09:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3204707E8;
	Fri,  3 Nov 2023 09:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3204707E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ADQLNWTmvnfC; Fri,  3 Nov 2023 09:32:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1489D707F1;
	Fri,  3 Nov 2023 09:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1489D707F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E48781BF995
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE2DD707E4
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE2DD707E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQ3pxZEAwdY4 for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 09:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F515707CD
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 09:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F515707CD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1417D865A1; Fri,  3 Nov 2023 09:31:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Nov 2023 10:26:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fcc4ea595a07f47c86f4d52084dc1317473d2f40
X-Git-Newrev: a7879e349c2edd099fbef52dd9dfd4b95dd45389
X-Patchwork-Hint: ignore
Message-Id: <20231103093144.1417D865A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dtc: bump to version 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7879e349c2edd099fbef52dd9dfd4b95dd45389
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/dgibson/dtc/releases/tag/v1.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dtc/dtc.hash | 2 +-
 package/dtc/dtc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index 29b7e0b121..5856156f00 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -1,5 +1,5 @@
 # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
-sha256  65cec529893659a49a89740bb362f507a3b94fc8cd791e76a8d6a2b6f3203473  dtc-1.6.1.tar.xz
+sha256  29edce3d302a15563d8663198bbc398c5a0554765c83830d0d4c0409d21a16c4  dtc-1.7.0.tar.xz
 
 # Hash for license files
 sha256  78e1e1ce5728a990d59c7de61d4741c49185d5129daf783b386380a214328d68  README.license
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 53f9c9c8df..ff3ed49b37 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTC_VERSION = 1.6.1
+DTC_VERSION = 1.7.0
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
