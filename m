Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA9DC83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A1EE404AF;
	Sat,  2 Sep 2023 15:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A1EE404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuVeJB9H6UqY; Sat,  2 Sep 2023 15:50:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CA3D4056A;
	Sat,  2 Sep 2023 15:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CA3D4056A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88B171BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F3E360B1F
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F3E360B1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cmhuepP2yyaY for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:50:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9599360AC4
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:50:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9599360AC4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82DF1868AC; Sat,  2 Sep 2023 15:50:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 17:49:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2001d3758879bc25496e726edf3da99e9dbee38f
X-Git-Newrev: a51213b2702853e7897aa1f8be3a679280ab5e24
X-Patchwork-Hint: ignore
Message-Id: <20230902155034.82DF1868AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/edk2-non-osi: bump in
 sync with edk2-stable202308
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
Content-Type: multipart/mixed; boundary="===============6184824871678530295=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6184824871678530295==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a51213b2702853e7897aa1f8be3a679280ab5e24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump the edk2-non-osi commit to the one corresponding to version
edk2-stable202308 of edk2, based on the timestamps.

Cc: Dick Olsson <hi@senzilla.io>
Cc: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/edk2-non-osi/edk2-non-osi.hash | 2 +-
 package/edk2-non-osi/edk2-non-osi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edk2-non-osi/edk2-non-osi.hash b/package/edk2-non-osi/edk2-non-osi.hash
index 2593324bc1..e4e84f1cef 100644
--- a/package/edk2-non-osi/edk2-non-osi.hash
+++ b/package/edk2-non-osi/edk2-non-osi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c048101d6532d9bb4f6450095e0b50812d9a831f7e3c119db48e5caf2bf020a6  edk2-non-osi-41876073afb7c7309018223baa1a6f8108bf23f0.tar.gz
+sha256  6fe059c4ee5d4fad6245a6eb53ed6b62b8890e9481cfb52c9fbdb83a5b2e0edb  edk2-non-osi-8c09bd0955338db38813e0d8ae1faa634f545f73.tar.gz
 sha256  38d73db2f9dfb32e1666d898cb9d7c1ccd78302dd9922d5fac4a9cf61fa872d9  Silicon/Marvell/Armada7k8k/DeviceTree/Armada80x0McBin.inf
diff --git a/package/edk2-non-osi/edk2-non-osi.mk b/package/edk2-non-osi/edk2-non-osi.mk
index 1103772768..d787c882b3 100644
--- a/package/edk2-non-osi/edk2-non-osi.mk
+++ b/package/edk2-non-osi/edk2-non-osi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_NON_OSI_VERSION = 41876073afb7c7309018223baa1a6f8108bf23f0
+EDK2_NON_OSI_VERSION = 8c09bd0955338db38813e0d8ae1faa634f545f73
 EDK2_NON_OSI_SITE = $(call github,tianocore,edk2-non-osi,$(EDK2_NON_OSI_VERSION))
 EDK2_NON_OSI_INSTALL_TARGET = NO
 EDK2_NON_OSI_INSTALL_STAGING = YES

--===============6184824871678530295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6184824871678530295==--
