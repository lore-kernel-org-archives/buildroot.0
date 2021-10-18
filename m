Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98499C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:57:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 610FA61038
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 610FA61038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A1678266C;
	Mon, 18 Oct 2021 19:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XfE1Dv5ica1R; Mon, 18 Oct 2021 19:57:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9960382435;
	Mon, 18 Oct 2021 19:57:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5DF1BF989
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CC8B824EE
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:57:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id amrsY3K6Af3Y for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:57:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 517CD823E0
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:57:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0864B87799; Mon, 18 Oct 2021 19:54:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:57:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ff59a5f8efac71e383157dfc416ab803299834c
X-Git-Newrev: aa66ccfabc51592e788d1dd0fbe1fff5c11d993b
X-Patchwork-Hint: ignore
Message-Id: <20211018195415.0864B87799@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/phidgetwebservice: bump to version
 2.1.9.20190409
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa66ccfabc51592e788d1dd0fbe1fff5c11d993b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/phidgetwebservice/phidgetwebservice.hash | 2 +-
 package/phidgetwebservice/phidgetwebservice.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/phidgetwebservice/phidgetwebservice.hash b/package/phidgetwebservice/phidgetwebservice.hash
index e369049c1c..49017f2994 100644
--- a/package/phidgetwebservice/phidgetwebservice.hash
+++ b/package/phidgetwebservice/phidgetwebservice.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  904af15ecd13ae4e807ed8af181e3a4521e59f8f3791be0aa4ceb1afdbf764a2  phidgetwebservice_2.1.8.20170607.tar.gz
+sha256  aa63cbd2ab87182d6e0c05d553ee4c8cc73d268516d8e0a1e881baed391c081d  phidgetwebservice_2.1.9.20190409.tar.gz
 sha256  ea8af5e789cb2d4e9b10bce3874982ade163b749b6bfbdb32e2df21c4d106de1  COPYING
diff --git a/package/phidgetwebservice/phidgetwebservice.mk b/package/phidgetwebservice/phidgetwebservice.mk
index bdcc388b26..b5f335c4ec 100644
--- a/package/phidgetwebservice/phidgetwebservice.mk
+++ b/package/phidgetwebservice/phidgetwebservice.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PHIDGETWEBSERVICE_VERSION = 2.1.8.20170607
+PHIDGETWEBSERVICE_VERSION = 2.1.9.20190409
 PHIDGETWEBSERVICE_SOURCE = phidgetwebservice_$(PHIDGETWEBSERVICE_VERSION).tar.gz
-PHIDGETWEBSERVICE_SITE = http://www.phidgets.com/downloads/libraries
+PHIDGETWEBSERVICE_SITE = https://www.phidgets.com/downloads/phidget21/servers/linux/phidgetwebservice
 PHIDGETWEBSERVICE_DEPENDENCIES = libphidget
 PHIDGETWEBSERVICE_LICENSE = LGPL-3.0
 PHIDGETWEBSERVICE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
