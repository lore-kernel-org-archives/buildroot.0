Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3EFC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:20:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 086BE60F94
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 086BE60F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8D9260A9C;
	Tue,  3 Aug 2021 23:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqisoQat6h_p; Tue,  3 Aug 2021 23:20:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A3DA60A9A;
	Tue,  3 Aug 2021 23:20:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 784FF1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 862E6406A8
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_1wXKJylBal for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B077640552
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1304287B09; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 28 Jun 2021 22:30:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b31f7bc9587170855cd99769db87a5fb32b6724b
X-Git-Newrev: 59db11c7c445ef8662163a80997aa71f760a0359
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.1304287B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package: gcnano-binaries: bump
 version to 6.4.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=59db11c7c445ef8662163a80997aa71f760a0359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to last version of gcnano-binaries compatible with kernel
from StMicroelectronics version 5.10

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gcnano-binaries/gcnano-binaries.hash |  2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
index e753f944a3..e3efc82fc5 100644
--- a/package/gcnano-binaries/gcnano-binaries.hash
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 255db9c58627f5f54fd15263647cc97a55927363fec42e7c8d7486170a65d84d  gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed.tar.gz
+sha256 afec2ba2f524821452d561b56afd2fc241293ea4a6e8598d1663f58e5d16800f  gcnano-binaries-1534c3eaabb5ae545a8f97e95f853531365a13fc.tar.gz
 sha256 7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index b27571a08c..af5fdd1b7e 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-GCNANO_BINARIES_LIB_VERSION = 6.2.4
-GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION).p4
-GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION).p4-20190626
-GCNANO_BINARIES_VERSION = c01642ed5e18cf09ecd905af193e935cb3be95ed
+GCNANO_BINARIES_LIB_VERSION = 6.4
+GCNANO_BINARIES_LIB_REVISION = 3
+GCNANO_BINARIES_LIB_FULL_VERSION = $(GCNANO_BINARIES_LIB_VERSION).$(GCNANO_BINARIES_LIB_REVISION)
+GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)
+GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)-20200902
+GCNANO_BINARIES_VERSION = 1534c3eaabb5ae545a8f97e95f853531365a13fc
 GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
 
 GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
@@ -43,7 +45,7 @@ GCNANO_BINARIES_MODULE_MAKE_OPTS = \
 	DEBUG=0
 
 GCNANO_BINARIES_LIBRARIES = \
-	gbm_viv libEGL libGAL libgbm libGLESv1_CM \
+	libgbm_viv libEGL libGAL libgbm libGLESv1_CM \
 	libGLESv2 libGLSLC libOpenVG libVSC
 
 GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
