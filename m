Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCBAFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A78E400CB;
	Mon, 31 Oct 2022 14:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A78E400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O-Sgdm-gY8eU; Mon, 31 Oct 2022 14:43:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE32F408BF;
	Mon, 31 Oct 2022 14:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE32F408BF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 495E21BF95E
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 252A060E92
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 252A060E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zl8IDsnKd4yI for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:42:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5354660E7C
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5354660E7C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3524787965; Mon, 31 Oct 2022 14:42:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 15:41:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d187743f3d80a7f3022f2559d5f5c7f8e0adc634
X-Git-Newrev: d264b6e81e1a03c36df55c66771ed26dd767a522
X-Patchwork-Hint: ignore
Message-Id: <20221031144227.3524787965@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valijson: bump to version 0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=d264b6e81e1a03c36df55c66771ed26dd767a522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/tristanpenman/valijson/releases/tag/v0.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
Tested-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/valijson/valijson.hash | 2 +-
 package/valijson/valijson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
index 0aab93dd2a..aacdf7dedc 100644
--- a/package/valijson/valijson.hash
+++ b/package/valijson/valijson.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  e06bf78fc1d26d4956fabc182408ebbbc47e3a6699778cda4aa439c2a6110b09  valijson-0.6.tar.gz
+sha256  bc24736709acfb252a5fdcb5145f1f2670c7aecaba3356f6f8ba54903800fa5c  valijson-0.7.tar.gz
 sha256  1a0f99926a2dbec30eba3db820236d9953fbe3048976923ac24980e655fbe991  LICENSE
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index 4b1f722f77..51a9353960 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALIJSON_VERSION = 0.6
+VALIJSON_VERSION = 0.7
 VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
