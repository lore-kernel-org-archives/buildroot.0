Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4647C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 12:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 723C560FD7;
	Mon, 18 Jul 2022 12:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 723C560FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t5lUQdRVExCO; Mon, 18 Jul 2022 12:08:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B448B60FF4;
	Mon, 18 Jul 2022 12:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B448B60FF4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 666A31BF317
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 12:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40AC960FBC
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 12:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40AC960FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ggmigBB6UjOQ for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 12:08:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B1EB60F14
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 12:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B1EB60F14
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B0A8B83CAB; Mon, 18 Jul 2022 11:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 14:07:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4351da28a4c0de53bf6e4fece48afcb9566590cb
X-Git-Newrev: 725d1b045345a0f5455fcf5a8222c10222e9fb59
X-Patchwork-Hint: ignore
Message-Id: <20220718115510.B0A8B83CAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sam-ba: bump version to 3.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=725d1b045345a0f5455fcf5a8222c10222e9fb59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sam-ba/sam-ba.hash | 2 +-
 package/sam-ba/sam-ba.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sam-ba/sam-ba.hash b/package/sam-ba/sam-ba.hash
index 10b95c9c0e..252a60dbb8 100644
--- a/package/sam-ba/sam-ba.hash
+++ b/package/sam-ba/sam-ba.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  f66e431f0401b197e80599156ea93aa3aab050bc4d16523c95fae1107ef9101c  sam-ba_3.5-linux_x86_64.tar.gz
+sha256  d295567701914e21318f4c48ff3a57374c7c91f65f0814158e84bb07dd4d07c2  sam-ba_v3.7-linux_x86_64.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 10bea8ef70..0928c8f9ca 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SAM_BA_VERSION = 3.5
-SAM_BA_SITE = https://www.microchip.com/content/dam/mchp/documents/MPU32/ProductDocuments/SoftwareTools
-SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION)-linux_x86_64.tar.gz
+SAM_BA_VERSION = 3.7
+SAM_BA_SITE = https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/SoftwareLibraries/Firmware
+SAM_BA_SOURCE = sam-ba_v$(SAM_BA_VERSION)-linux_x86_64.tar.gz
 SAM_BA_LICENSE = GPLv2
 SAM_BA_LICENSE_FILES = LICENSE.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
