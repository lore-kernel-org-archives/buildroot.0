Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31CCEC8738
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BEF283B36;
	Thu,  7 Sep 2023 15:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BEF283B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JHlwvFneQan; Thu,  7 Sep 2023 15:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92C9383A7A;
	Thu,  7 Sep 2023 15:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92C9383A7A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFFDD1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0187E612B6
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0187E612B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPQuodi-9B5H for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 171CF612B1
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 171CF612B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0540A86A25; Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 17:49:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c9f31041a2c36e3b97cd2f9577f68d88ee91174
X-Git-Newrev: 2001d3758879bc25496e726edf3da99e9dbee38f
X-Patchwork-Hint: ignore
Message-Id: <20230907145135.0540A86A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/edk2-platforms: bump in sync with
 edk2-stable202308
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
Content-Type: multipart/mixed; boundary="===============0663738939851964717=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0663738939851964717==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2001d3758879bc25496e726edf3da99e9dbee38f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the edk2-platforms commit to the one corresponding to version
edk2-stable202308 of edk2, based on the timestamps.

Cc: Dick Olsson <hi@senzilla.io>
Cc: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/edk2-platforms/edk2-platforms.hash | 2 +-
 package/edk2-platforms/edk2-platforms.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
index ae88b672a6..4c74c7dfb6 100644
--- a/package/edk2-platforms/edk2-platforms.hash
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  31257160ac51a4a5f63db92d26482d6a005286ed040dafe89d01f0ee906b111e  edk2-platforms-b71f2bda9e4fc183068eef5d1d90a631181a2506.tar.gz
+sha256  c240a8ec7816bc5963d881c84eb18d880e9269c117cfc46a3106b0c5e6e80c66  edk2-platforms-e509ac5a729ebe2a3bc905aed1df23226aca4dc9.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 9e8ff94156..7bd86ff159 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_PLATFORMS_VERSION = b71f2bda9e4fc183068eef5d1d90a631181a2506
+EDK2_PLATFORMS_VERSION = e509ac5a729ebe2a3bc905aed1df23226aca4dc9
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause-Patent
 EDK2_PLATFORMS_LICENSE_FILES = License.txt

--===============0663738939851964717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0663738939851964717==--
