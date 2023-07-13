Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE921C001DD
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 18:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 786E08143D;
	Thu, 13 Jul 2023 18:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 786E08143D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0sGpXxfzm9hf; Thu, 13 Jul 2023 18:13:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5B8981E70;
	Thu, 13 Jul 2023 18:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5B8981E70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A0251BF980
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 18:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6134E404EF
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 18:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6134E404EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gkt_RVSgc5_I for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 18:13:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96DCA40515
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 18:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96DCA40515
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8470C86F82; Thu, 13 Jul 2023 18:13:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 19:45:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d08e83f8f8ff9a4007f74e7cffefe05939d898d1
X-Git-Newrev: 40f245152965c1f298ec76a1d8d24858daecc8f5
X-Patchwork-Hint: ignore
Message-Id: <20230713181301.8470C86F82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/edk2-non-osi: bump in sync with
 edk2-stable202305
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
Content-Type: multipart/mixed; boundary="===============1731628675074592453=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1731628675074592453==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=40f245152965c1f298ec76a1d8d24858daecc8f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the edk2-non-osi commit to the one corresponding to version
edk2-stable202305 of edk2, based on the timestamps.

Cc: Dick Olsson <hi@senzilla.io>
Cc: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/edk2-non-osi/edk2-non-osi.hash | 2 +-
 package/edk2-non-osi/edk2-non-osi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edk2-non-osi/edk2-non-osi.hash b/package/edk2-non-osi/edk2-non-osi.hash
index 7941df1f2f..2593324bc1 100644
--- a/package/edk2-non-osi/edk2-non-osi.hash
+++ b/package/edk2-non-osi/edk2-non-osi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7d27b1e6d90a26f3585ab58a2e051da69eae1b97754d3e2d80a5372879ae2501  edk2-non-osi-61662e8596dd9a64e3372f9a3ba6622d2628607c.tar.gz
+sha256  c048101d6532d9bb4f6450095e0b50812d9a831f7e3c119db48e5caf2bf020a6  edk2-non-osi-41876073afb7c7309018223baa1a6f8108bf23f0.tar.gz
 sha256  38d73db2f9dfb32e1666d898cb9d7c1ccd78302dd9922d5fac4a9cf61fa872d9  Silicon/Marvell/Armada7k8k/DeviceTree/Armada80x0McBin.inf
diff --git a/package/edk2-non-osi/edk2-non-osi.mk b/package/edk2-non-osi/edk2-non-osi.mk
index 0abb3770c7..1103772768 100644
--- a/package/edk2-non-osi/edk2-non-osi.mk
+++ b/package/edk2-non-osi/edk2-non-osi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_NON_OSI_VERSION = 61662e8596dd9a64e3372f9a3ba6622d2628607c
+EDK2_NON_OSI_VERSION = 41876073afb7c7309018223baa1a6f8108bf23f0
 EDK2_NON_OSI_SITE = $(call github,tianocore,edk2-non-osi,$(EDK2_NON_OSI_VERSION))
 EDK2_NON_OSI_INSTALL_TARGET = NO
 EDK2_NON_OSI_INSTALL_STAGING = YES

--===============1731628675074592453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1731628675074592453==--
