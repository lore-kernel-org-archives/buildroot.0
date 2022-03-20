Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6DCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E06BF404A3;
	Sun, 20 Mar 2022 18:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v8yTTMWARtwu; Sun, 20 Mar 2022 18:47:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0AE140896;
	Sun, 20 Mar 2022 18:47:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1759B1BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6578400D1
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id awOy9-9_Gvhl for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A967405BB
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A19BB8461D; Sun, 20 Mar 2022 18:37:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 19:30:46 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 39534938739db48acf27ab14aed0ba059ae617d2
X-Git-Newrev: 5dab7fc53b6df5333ecf7ba170e0507833f24075
X-Patchwork-Hint: ignore
Message-Id: <20220320183734.A19BB8461D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ts4900-fpga: bump
 version to 20170510
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5dab7fc53b6df5333ecf7ba170e0507833f24075
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes TXEN on CPU UARTs not correctly asserting in some multi-byte
transmits.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 503948f452d0cb46cbc7990ecaeabd60f2b3dfd7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
