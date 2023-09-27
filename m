Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC6CE80AA2
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 07:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2E604156D;
	Wed, 27 Sep 2023 07:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2E604156D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xpYGluiF-4P; Wed, 27 Sep 2023 07:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 200A74013F;
	Wed, 27 Sep 2023 07:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 200A74013F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95B0E1BF44A
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 07:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EC1C81F7B
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 07:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EC1C81F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 165SxvkT0UiI for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 07:41:24 +0000 (UTC)
X-Greylist: delayed 316 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 27 Sep 2023 07:41:24 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1835381F59
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
 [134.119.228.97])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1835381F59
 for <buildroot@busybox.net>; Wed, 27 Sep 2023 07:41:24 +0000 (UTC)
Received: from [84.146.220.100] (helo=mail.go-sys.de)
 by smtprelay07.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>) id 1qlP5Y-0001NX-Dp
 for buildroot@busybox.net; Wed, 27 Sep 2023 09:36:04 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 27 Sep
 2023 09:36:03 +0200
Received: from go-sys.de (192.168.1.154) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.32 via Frontend Transport;
 Wed, 27 Sep 2023 09:36:03 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Wed, 27 Sep 2023 09:36:00 +0200
Message-ID: <20230927073600.17504-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH v2] package/gnuplot: bump version to 5.4.9
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
Cc: Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
http://www.gnuplot.info/ReleaseNotes_5_4_9.html

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/gnuplot/gnuplot.hash | 8 ++++----
 package/gnuplot/gnuplot.mk   | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 2f482ca434..6ed24b6d3c 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.7/
-md5  cdc9bb3ac0cc7e717246ed3df2d6ffa2  gnuplot-5.4.7.tar.gz
-sha1  6e68f94af822ff56549beab3a465c2fe976d3b34  gnuplot-5.4.7.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.9/
+md5  345533e461e41c263b3293f46651f0b2  gnuplot-5.4.9.tar.gz
+sha1  1a3953660656a38178ae2b368efa895af55a5001  gnuplot-5.4.9.tar.gz
 # Locally computed
-sha256  318a1501c9e659f39cf05ee5268335671bddc6c20eae06851f262fde27c2e739  gnuplot-5.4.7.tar.gz
+sha256  a328a021f53dc05459be6066020e9a71e8eab6255d3381e22696120d465c6a97  gnuplot-5.4.9.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 23fbae10a9..0cd37da7d6 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.4.7
+GNUPLOT_VERSION = 5.4.9
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
@@ -23,7 +23,8 @@ GNUPLOT_CONF_OPTS = \
 	--disable-wxwidgets \
 	--without-lua \
 	--without-latex \
-	--without-cairo
+	--without-cairo \
+	--with-qt=no
 
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
-- 
2.20.1

Changes V1 -> V2 :
  add "--with-gt=no" to fix compile error
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
