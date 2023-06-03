Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9A0C77B7A
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 10:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A443084274;
	Sat,  3 Jun 2023 10:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A443084274
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BMo_2q1MxW6v; Sat,  3 Jun 2023 10:55:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC72484269;
	Sat,  3 Jun 2023 10:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC72484269
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 476471BF4D7
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 10:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27EAF84269
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 10:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27EAF84269
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DJey75vUhdkI for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 10:55:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B04D84268
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B04D84268
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 10:55:13 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout12.t-online.de (Postfix) with SMTP id 943F2206F1;
 Sat,  3 Jun 2023 12:55:10 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd80.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q5Ouc-4LjKLp0; Sat, 3 Jun 2023 12:55:10 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:44892)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q5Oub-0001jm-27;
 Sat, 03 Jun 2023 12:55:09 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  3 Jun 2023 12:55:09 +0200
Message-Id: <20230603105509.581631-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1685789710-09EC34D3-B5BDA930/0/0 CLEAN NORMAL
X-TOI-MSGID: 86181e47-c774-4c5c-8694-782f3fcf6091
Subject: [Buildroot] [PATCH/next 1/1] package/minidlna: bump version to 1.3.3
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://sourceforge.net/p/minidlna/git/ci/master/tree/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minidlna/minidlna.hash | 6 +++---
 package/minidlna/minidlna.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/minidlna/minidlna.hash b/package/minidlna/minidlna.hash
index e55e5473d3..b78dd5b4dd 100644
--- a/package/minidlna/minidlna.hash
+++ b/package/minidlna/minidlna.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/minidlna/files/minidlna/1.3.2/
-sha1  71750adadc34490d52f0b9a930c2731a47f9772d  minidlna-1.3.2.tar.gz
+# From https://sourceforge.net/projects/minidlna/files/minidlna/1.3.3/
+sha1  2d42028d2ca5ae04affdb96cb414314867e179ea  minidlna-1.3.3.tar.gz
 # Locally computed
-sha256  222ce45a1a60c3ce3de17527955d38e5ff7a4592d61db39577e6bf88e0ae1cb0  minidlna-1.3.2.tar.gz
+sha256  39026c6d4a139b9180192d1c37225aa3376fdf4f1a74d7debbdbb693d996afa4  minidlna-1.3.3.tar.gz
 sha256  79146b7f558e56510b9a714ff75318c05ab93aeccfd6597497b9bce212cf92ea  COPYING
 sha256  94876d7886116e176e702b4902bd9f19731a6883db5f229ac2a7058a22aa6529  LICENCE.miniupnpd
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 6ca72d9240..1609695ebf 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIDLNA_VERSION = 1.3.2
+MINIDLNA_VERSION = 1.3.3
 MINIDLNA_SITE = https://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 MINIDLNA_LICENSE = GPL-2.0, BSD-3-Clause
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
