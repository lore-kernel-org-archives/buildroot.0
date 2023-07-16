Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05B7EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 21:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EDE160DED;
	Sun, 16 Jul 2023 21:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EDE160DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oVsRUKE8V9g9; Sun, 16 Jul 2023 21:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B34E60C2D;
	Sun, 16 Jul 2023 21:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B34E60C2D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B798B1BF861
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 21:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9182481747
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 21:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9182481747
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gKKsRHfUtlG for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 21:37:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA64C81746
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 21:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA64C81746
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5A848711D; Sun, 16 Jul 2023 21:37:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 23:37:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c66f65a6a549930870f2c0d98abb5ca9321d2a5
X-Git-Newrev: 14216c3c85491ea1dc1fa753a8006ab2ce3cc3f7
X-Patchwork-Hint: ignore
Message-Id: <20230716213745.A5A848711D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rpi-ws281x: bump to version
 5.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=14216c3c85491ea1dc1fa753a8006ab2ce3cc3f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-rpi-ws281x/python-rpi-ws281x.hash | 4 ++--
 package/python-rpi-ws281x/python-rpi-ws281x.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.hash b/package/python-rpi-ws281x/python-rpi-ws281x.hash
index ffdd826b6f..42bc205523 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.hash
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/rpi-ws281x/json
-md5  016e1f03f9168ef03d4baf074aa60f03  rpi_ws281x-4.3.4.tar.gz
-sha256  072eff1787e579d1710381b27c467709e3aab28ac579c7a47d7cc87398496f28  rpi_ws281x-4.3.4.tar.gz
+md5  9c87b5bedba0a48bb97e9953378dfb78  rpi_ws281x-5.0.0.tar.gz
+sha256  00ce6db771436b778d0930245cf8ea2aae11008cc5fd67d57789c5422af3ee55  rpi_ws281x-5.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  LICENSE
 sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  lib/LICENSE
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.mk b/package/python-rpi-ws281x/python-rpi-ws281x.mk
index 73befeb56e..610467b160 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.mk
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPI_WS281X_VERSION = 4.3.4
+PYTHON_RPI_WS281X_VERSION = 5.0.0
 PYTHON_RPI_WS281X_SOURCE = rpi_ws281x-$(PYTHON_RPI_WS281X_VERSION).tar.gz
-PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/e2/d4/75fcc4f3412b9b16e39e6cd6156f2e171fe7b2e79057be17d1acf38fded4
+PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/c0/1e/642208a685c5e96d38323f42c75d9b24f95e2d1b8390dd104e04a712f29e
 PYTHON_RPI_WS281X_SETUP_TYPE = setuptools
 PYTHON_RPI_WS281X_LICENSE = BSD-2-Clause
 PYTHON_RPI_WS281X_LICENSE_FILES = LICENSE lib/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
