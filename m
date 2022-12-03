Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D027C4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 13:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C16D1403E5;
	Sun,  4 Dec 2022 13:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C16D1403E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFVauGWiHHzZ; Sun,  4 Dec 2022 13:03:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5DA4401D8;
	Sun,  4 Dec 2022 13:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5DA4401D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 742FE1BF863
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 13:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 491CC408FC
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 13:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 491CC408FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jlzKYUHXKy2b for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 13:03:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32420415CF
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 13:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32420415CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C2EF85446; Sun,  4 Dec 2022 13:03:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Dec 2022 15:53:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9943c86392f05ceec8807b6755772b91754b9f99
X-Git-Newrev: 17a1cd835e788cd86109e8a4223ea75dc9342553
X-Patchwork-Hint: ignore
Message-Id: <20221204130303.1C2EF85446@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/edk2-platforms: bump
 in sync with edk2-stable202208
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
Content-Type: multipart/mixed; boundary="===============3369131277979228475=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3369131277979228475==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=17a1cd835e788cd86109e8a4223ea75dc9342553
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump the edk2-platforms commit to the one corresponding to version
edk2-stable202208 of edk2, based on the timestamps.

Note: the Marvell Armada Devicetree files have been moved out of
edk2-platforms by commit 4b53da6b12a8 ("Marvell/Armada7k8k: Remove device
tree sources from edk2-platforms") and they are now in edk2-non-osi.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/edk2-platforms/edk2-platforms.hash | 2 +-
 package/edk2-platforms/edk2-platforms.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
index 30ae235078..405a09241c 100644
--- a/package/edk2-platforms/edk2-platforms.hash
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dfdc34fea86e5037a3a6cbd2a83b1f655f16b4c9ab4f5ff9da91e45a358c9a14  edk2-platforms-db922e1253cb6f1fc456805bc42fb7d401eed5c2.tar.gz
+sha256  1ed3f369a2743cc5a5fa4804d0af154e37b578f4e68c2e7f69734701a9b874db  edk2-platforms-3c3b1168017073c2bb2d97336c5929ebae805be1.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 7de59c1afc..898937a5ab 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_PLATFORMS_VERSION = db922e1253cb6f1fc456805bc42fb7d401eed5c2
+EDK2_PLATFORMS_VERSION = 3c3b1168017073c2bb2d97336c5929ebae805be1
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause
 EDK2_PLATFORMS_LICENSE_FILES = License.txt

--===============3369131277979228475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3369131277979228475==--
