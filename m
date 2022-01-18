Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66144C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 08:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB44281769;
	Tue, 18 Jan 2022 08:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGRs4zEcCCsO; Tue, 18 Jan 2022 08:13:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 371898174C;
	Tue, 18 Jan 2022 08:13:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95B9A1BF319
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 08:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91D848174C
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 08:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VAi3tSnJoCS7 for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 08:13:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay01.ispgateway.de (smtprelay01.ispgateway.de
 [80.67.18.13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF997816F5
 for <buildroot@busybox.net>; Tue, 18 Jan 2022 08:13:39 +0000 (UTC)
Received: from [91.21.118.156] (helo=exchange.go-sys.de)
 by smtprelay01.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>) id 1n9jdA-0002kh-Fd
 for buildroot@busybox.net; Tue, 18 Jan 2022 09:14:16 +0100
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2375.18; Tue, 18
 Jan 2022 09:13:35 +0100
Received: from go-sys.de (192.168.1.113) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2375.18 via Frontend Transport;
 Tue, 18 Jan 2022 09:13:35 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Tue, 18 Jan 2022 09:13:31 +0100
Message-ID: <20220118081331.30088-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: bump version to 5.4.3
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

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/gnuplot/gnuplot.hash | 6 +++---
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index fc166205d0..1cc14973d1 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.2/
-md5  2050ca477199a591543bc968aba7d899  gnuplot-5.4.2.tar.gz
-sha1  2e076b29f38bfcb841cb5eb3377fd1a469ced1ac  gnuplot-5.4.2.tar.gz
+md5  9bb03cfa77e38924e08ffbb9eb59d8b1  gnuplot-5.4.3.tar.gz
+sha1  c4b60fd7a700b22fa62b14829cbb0e17911627c9  gnuplot-5.4.3.tar.gz
 # Locally computed
-sha256  e57c75e1318133951d32a83bcdc4aff17fed28722c4e71f2305cfc2ae1cae7ba  gnuplot-5.4.2.tar.gz
+sha256  51f89bbab90f96d3543f95235368d188eb1e26eda296912256abcd3535bd4d84  gnuplot-5.4.3.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 436d3e5f92..6cf36a0997 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.4.2
+GNUPLOT_VERSION = 5.4.3
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
