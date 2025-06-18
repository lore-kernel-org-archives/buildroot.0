Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1640C7115B
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 05:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C9CB60885;
	Wed, 18 Jun 2025 05:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFDaEEPEQQ2B; Wed, 18 Jun 2025 05:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B33F60814
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B33F60814;
	Wed, 18 Jun 2025 05:41:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F89151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 05:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0341D407A3
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 05:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zziS2qzHWNML for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 05:41:19 +0000 (UTC)
Received-SPF: Neutral (mailfrom) identity=mailfrom; client-ip=54.37.254.54;
 helo=kmf2.trabucayre.com; envelope-from=gwenj@trabucayre.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4AA9407B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4AA9407B5
Received: from kmf2.trabucayre.com (ns3108948.ip-54-37-254.eu [54.37.254.54])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4AA9407B5
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 05:41:19 +0000 (UTC)
Received: from kmf3.. (localhost [IPv6:::1])
 by kmf2.trabucayre.com (Postfix) with ESMTP id A2CD816022E;
 Wed, 18 Jun 2025 05:41:17 +0000 (UTC)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Date: Wed, 18 Jun 2025 05:41:15 +0000
Message-Id: <20250618054116.1366828-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=trabucayre.com
Subject: [Buildroot] [PATCH 1/2] package/gnuradio: bump version to 3.10.12.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/gnuradio.hash | 2 +-
 package/gnuradio/gnuradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index 855fca7ba4..2fa84d00c9 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9ca658e6c4af9cfe144770757b34ab0edd23f6dcfaa6c5c46a7546233e5ecd29  gnuradio-3.10.11.0.tar.gz
+sha256  fe78ad9f74c8ebf93d5c8ad6fa2c13236af330f3c67149d91a0647b3dc6f3958  gnuradio-3.10.12.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index d844688ff6..fc98edc848 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNURADIO_VERSION = 3.10.11.0
+GNURADIO_VERSION = 3.10.12.0
 GNURADIO_SITE = $(call github,gnuradio,gnuradio,v$(GNURADIO_VERSION))
 GNURADIO_LICENSE = GPL-3.0+
 GNURADIO_LICENSE_FILES = COPYING
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
