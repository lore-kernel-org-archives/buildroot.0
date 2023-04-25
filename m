Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB2EC77B61
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 07:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 682F7404EB;
	Tue, 25 Apr 2023 07:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 682F7404EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwG1fvsyfYGV; Tue, 25 Apr 2023 07:33:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A4EA40235;
	Tue, 25 Apr 2023 07:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A4EA40235
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36C621BF330
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 07:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FE7F813FE
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 07:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FE7F813FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ax8BBtEbVcru for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 07:33:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9D9C813F7
Received: from smtprelay05.ispgateway.de (smtprelay05.ispgateway.de
 [80.67.18.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9D9C813F7
 for <buildroot@busybox.net>; Tue, 25 Apr 2023 07:33:48 +0000 (UTC)
Received: from [84.146.217.139] (helo=mail.go-sys.de)
 by smtprelay05.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>) id 1prDBI-0004LG-Pf
 for buildroot@busybox.net; Tue, 25 Apr 2023 09:33:44 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 25 Apr
 2023 09:33:44 +0200
Received: from go-sys.de (192.168.1.157) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.23 via Frontend Transport;
 Tue, 25 Apr 2023 09:33:44 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Tue, 25 Apr 2023 09:33:41 +0200
Message-ID: <20230425073341.18738-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH] package/sdl2: bump version to 2.26.5
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
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index e26dcee301..0c7bdf7fa1 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.26.3.tar.gz.sig
-sha256  c661205a553b7d252425f4b751ff13209e5e020b876bbfa1598494af61790057  SDL2-2.26.3.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.26.5.tar.gz.sig
+sha256  ad8fea3da1be64c83c45b1d363a6b4ba8fd60f5bde3b23ec73855709ec5eabf7  SDL2-2.26.5.tar.gz
 # Locally calculated
 sha256  9928507f684c1965d07f2b6ef4b4723d5efc2f6b4ab731f743a413c51c319927  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index c01f12d12c..5f2e1e0ed1 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.26.3
+SDL2_VERSION = 2.26.5
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
