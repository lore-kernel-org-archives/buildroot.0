Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FA1C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 669DA4028D;
	Mon,  6 Nov 2023 22:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 669DA4028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjaZy1wIQePu; Mon,  6 Nov 2023 22:02:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BD70413D3;
	Mon,  6 Nov 2023 22:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BD70413D3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E11931BF954
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4D8D415CB
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4D8D415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j90F42Y0b54d for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 726E6401CC
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 726E6401CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E16686B31; Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:58:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c4a6503723d37d5475f38b2d3004be243f01534
X-Git-Newrev: 0322ff8e603611119f435bb3021d9ed8d0ec2e2e
X-Patchwork-Hint: ignore
Message-Id: <20231106220204.5E16686B31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cbor2: bump to version 5.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0322ff8e603611119f435bb3021d9ed8d0ec2e2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 70c35ca864..42ed828d53 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  74512376482be8a6af10596a63b6d254  cbor2-5.4.6.tar.gz
-sha256  b893500db0fe033e570c3adc956af6eefc57e280026bd2d86fd53da9f1e594d7  cbor2-5.4.6.tar.gz
+md5  b44037904de5b0f833020bfe01f741ca  cbor2-5.5.1.tar.gz
+sha256  f9e192f461a9f8f6082df28c035b006d153904213dc8640bed8a72d72bbc9475  cbor2-5.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index a2fcd73b74..5040301867 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.4.6
+PYTHON_CBOR2_VERSION = 5.5.1
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d9/69/de486293f5211d2e8fe1a19854e69f2811a18448162c52b48c67f8fbcac3
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d6/37/a0a75c2cae532ecb155d05edc1fbbe54fa3957e86f875a38542f87e1379c
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
