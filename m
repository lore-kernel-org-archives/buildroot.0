Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A95C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 08:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 025F6410D3;
	Mon, 22 Aug 2022 08:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 025F6410D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Co5NLtT5d0dI; Mon, 22 Aug 2022 08:08:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B92C9410A6;
	Mon, 22 Aug 2022 08:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92C9410A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C0651BF321
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 256FA81456
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 256FA81456
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOwAgZHgGv3w for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 08:08:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A55E081428
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
 [80.67.18.14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A55E081428
 for <buildroot@busybox.net>; Mon, 22 Aug 2022 08:08:35 +0000 (UTC)
Received: from [91.21.124.120] (helo=exchange.go-sys.de)
 by smtprelay02.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>) id 1oQ2UQ-0004i8-HB
 for buildroot@busybox.net; Mon, 22 Aug 2022 10:08:54 +0200
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2507.12; Mon, 22
 Aug 2022 10:08:31 +0200
Received: from go-sys.de (192.168.1.100) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2507.12 via Frontend Transport;
 Mon, 22 Aug 2022 10:08:31 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Mon, 22 Aug 2022 10:08:29 +0200
Message-ID: <20220822080829.30980-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH 1/1] package/sdl2: bump version to 2.24.0
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

New version numbering scheme, similar to GLib and Flatpak
version 2.0.24 is now 2.24.0

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/sdl2/sdl2.hash | 4 ++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index a5dad638bb..981c98531e 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.22.tar.gz.sig
-sha256  fe7cbf3127882e3fc7259a75a0cb585620272c51745d3852ab9dd87960697f2e  SDL2-2.0.22.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.24.0.tar.gz.sig
+sha256  91e4c34b1768f92d399b078e171448c6af18cafda743987ed2064a28954d6d97  SDL2-2.24.0.tar.gz
 # Locally calculated
 sha256  fcb07e07ac6bc8b2fcf047b50431ef4ebe5b619d7ca7c82212018309a9067426  LICENSE.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 94533fa9b4..c380d9910e 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.0.22
+SDL2_VERSION = 2.24.0
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
