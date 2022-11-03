Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8972EC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 039454155E;
	Mon,  5 Dec 2022 11:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 039454155E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DheeLj54xqCO; Mon,  5 Dec 2022 11:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5F0A4169E;
	Mon,  5 Dec 2022 11:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5F0A4169E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52F8F1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A99B81A47
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A99B81A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qVVaE0XaKvsX for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E21B81A2B
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E21B81A2B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C75085B9E; Mon,  5 Dec 2022 11:26:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f41991a2611c2c94414408e2808793dbee0924c6
X-Git-Newrev: 2551d48664d1f4feb53e1fda1e75f40524df438b
X-Patchwork-Hint: ignore
Message-Id: <20221205112600.5C75085B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiocoap: bump to version
 0.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=2551d48664d1f4feb53e1fda1e75f40524df438b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiocoap/python-aiocoap.hash | 4 ++--
 package/python-aiocoap/python-aiocoap.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index 6357a87931..176b3d22c7 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  c5809dfb02be8784ec17897380009052  aiocoap-0.4.1.tar.gz
-sha256  c47c9d19a98699f27707186871b7c84f4a7016fe4fbb5bd300f809ae456f8a55  aiocoap-0.4.1.tar.gz
+md5  218178420e8fc3581001f52eb726b016  aiocoap-0.4.4.tar.gz
+sha256  9d7c9626cbc4dc24a91c6b8694cbeb834e376ab7e20e4137609380f726a9540b  aiocoap-0.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  2bb211d412a6bfa4b2a9cf01123c7fe90e5e6185938896e23ab07b84f8494180  LICENSE
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index c933d27b23..96d8619a84 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.1
+PYTHON_AIOCOAP_VERSION = 0.4.4
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/67/1c/6d6764010a4779d61bc7241afa663b368261c72af20555b26efc875d4276
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/6a/7c/139993da8dcdfc86446ee6df65b98c68e40c5fcb0caeff3a6b348d9f7d6f
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = MIT
 PYTHON_AIOCOAP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
