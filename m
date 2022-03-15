Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E199C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2213B416FA;
	Tue, 15 Mar 2022 21:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VIyqrwOwWafJ; Tue, 15 Mar 2022 21:06:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59B5140343;
	Tue, 15 Mar 2022 21:06:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99F451BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 896EC416F7
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eql4PI5DoQEC for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:06:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA62E4019F
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:06:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DC9C983F9C; Tue, 15 Mar 2022 20:57:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:06:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88de5d08226b490ea2784fbfd0580dd3430b5699
X-Git-Newrev: 503948f452d0cb46cbc7990ecaeabd60f2b3dfd7
X-Patchwork-Hint: ignore
Message-Id: <20220315205750.DC9C983F9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ts4900-fpga: bump version to
 20170510
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

commit: https://git.buildroot.net/buildroot/commit/?id=503948f452d0cb46cbc7990ecaeabd60f2b3dfd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes TXEN on CPU UARTs not correctly asserting in some multi-byte
transmits.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ts4900-fpga/ts4900-fpga.hash | 6 +++---
 package/ts4900-fpga/ts4900-fpga.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ts4900-fpga/ts4900-fpga.hash b/package/ts4900-fpga/ts4900-fpga.hash
index 9ffff643af..1d3c62bfd1 100644
--- a/package/ts4900-fpga/ts4900-fpga.hash
+++ b/package/ts4900-fpga/ts4900-fpga.hash
@@ -1,5 +1,5 @@
-# From https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga//ts4900-fpga-20150930.bin.md5
-md5  bf93c03ef914cf008287c8cd60781cc8  ts4900-fpga-20150930.bin
+# From https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga//ts4900-fpga-20170510.bin.md5
+md5  86c7c3d7fb9c607af1ef55e1222b4416  ts4900-fpga-20170510.bin
 
 # Locally calculated
-sha256  242ac6a90bea9a95c937ea8952cdc9b02f543cea24a0359bed66a408a6dd8bf9  ts4900-fpga-20150930.bin
+sha256  f15edd6813ee5e93e7f380d85df2dc31e764ebca465093fb9006d56ee15b476b  ts4900-fpga-20170510.bin
diff --git a/package/ts4900-fpga/ts4900-fpga.mk b/package/ts4900-fpga/ts4900-fpga.mk
index a3e42c0812..73e7a28e31 100644
--- a/package/ts4900-fpga/ts4900-fpga.mk
+++ b/package/ts4900-fpga/ts4900-fpga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TS4900_FPGA_VERSION = 20150930
+TS4900_FPGA_VERSION = 20170510
 TS4900_FPGA_SOURCE = ts4900-fpga-$(TS4900_FPGA_VERSION).bin
 TS4900_FPGA_SITE = https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga
 # No license file provided, Yocto recipe from the vendor claims MIT.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
