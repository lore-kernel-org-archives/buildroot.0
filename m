Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8335FC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 10:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18DE541464;
	Mon,  6 Nov 2023 10:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18DE541464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vMJp1Qh4fl9f; Mon,  6 Nov 2023 10:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09D1C41467;
	Mon,  6 Nov 2023 10:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09D1C41467
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 196A41BF316
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 10:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6149812DA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 10:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6149812DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDPkEMRXxRqP for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 10:36:12 +0000 (UTC)
X-Greylist: delayed 365 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 06 Nov 2023 10:36:12 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ED83812CC
Received: from smtprelay06.ispgateway.de (smtprelay06.ispgateway.de
 [80.67.18.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5ED83812CC
 for <buildroot@busybox.net>; Mon,  6 Nov 2023 10:36:12 +0000 (UTC)
Received: from [84.146.220.100] (helo=mail.go-sys.de)
 by smtprelay06.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.1)
 (envelope-from <mf@go-sys.de>) id 1qzwrr-0000Cg-2Q
 for buildroot@busybox.net; Mon, 06 Nov 2023 11:30:04 +0100
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 6 Nov
 2023 11:30:02 +0100
Received: from go-sys.de (192.168.1.154) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.34 via Frontend Transport;
 Mon, 6 Nov 2023 11:30:02 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Mon, 6 Nov 2023 11:29:59 +0100
Message-ID: <20231106102959.15047-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH] package/sdl2: bump version to 2.28.5
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
index dde33bb9b6..7a28d5efc8 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.28.3.tar.gz.sig
-sha256  7acb8679652701a2504d734e2ba7543ec1a83e310498ddd22fd44bf965eb5518  SDL2-2.28.3.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.28.5.tar.gz.sig
+sha256  332cb37d0be20cb9541739c61f79bae5a477427d79ae85e352089afdaf6666e4  SDL2-2.28.5.tar.gz
 # Locally calculated
 sha256  9928507f684c1965d07f2b6ef4b4723d5efc2f6b4ab731f743a413c51c319927  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 840a7283d2..4646e7d1f8 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.28.3
+SDL2_VERSION = 2.28.5
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
