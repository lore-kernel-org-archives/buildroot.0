Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8810AC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 116BA400BA;
	Sat, 23 Dec 2023 17:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 116BA400BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id otmJsNqXNvNx; Sat, 23 Dec 2023 17:01:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86DE140498;
	Sat, 23 Dec 2023 17:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86DE140498
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4AA11BF2C2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D57140908
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D57140908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lx2dsZ5IU7zr for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:01:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EFBC40891
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EFBC40891
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CF4F87D57; Sat, 23 Dec 2023 17:01:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 15:53:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2799e80a29d7a7a9723017b6f8b9803e6189577
X-Git-Newrev: cf4ebfafaa2d8bc2c646029013f02c2cf048c8b9
X-Patchwork-Hint: ignore
Message-Id: <20231223170105.4CF4F87D57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8188eu: bump to 2023-12-04
 version on v5.2.2.4 branch
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf4ebfafaa2d8bc2c646029013f02c2cf048c8b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version allows to build with Linux 6.7

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index b3ead087d4..eb28e6cf0a 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6bf8c026c7d875248f18f14de6fd116cac178db9bdb5bdbc1e267c8ac6b6237f  rtl8188eu-3ff6f7d84cb5346ed8d5dc21056769f2e03746d9.tar.gz
+sha256  8cb10a047d39f13c776b0097ef1290f6b3c63590fd57bc0827e8638c878819f0  rtl8188eu-306f3e62cf7cddf8cee74f70f88a7a7b3af46f56.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index f475bf3cab..36a84d34de 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 3ff6f7d84cb5346ed8d5dc21056769f2e03746d9
+RTL8188EU_VERSION = 306f3e62cf7cddf8cee74f70f88a7a7b3af46f56
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
