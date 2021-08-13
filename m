Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB3BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:37:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AFDF608FB
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AFDF608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7833460784;
	Sat,  4 Sep 2021 18:37:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLCYwD8T8QqN; Sat,  4 Sep 2021 18:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B59636075F;
	Sat,  4 Sep 2021 18:37:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FCDB1BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F67B401FB
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7DLWYKVXsltj for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E348840206
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B5AA28834A; Sat,  4 Sep 2021 18:23:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:09:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a71661ffb216c7423dcd02ec9e8d703252dbcbad
X-Git-Newrev: 38a154f142d6dd752c6661ad60f62c62fca60ca3
X-Patchwork-Hint: ignore
Message-Id: <20210904182353.B5AA28834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-txaio: bump to version
 21.2.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=38a154f142d6dd752c6661ad60f62c62fca60ca3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-txaio/python-txaio.hash | 4 ++--
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index 15b1f5f2c9..5e05f02d3a 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txaio/json
-md5  c998be8d5837218c809266c0fce94687  txaio-20.4.1.tar.gz
-sha256  17938f2bca4a9cabce61346758e482ca4e600160cbc28e861493eac74a19539d  txaio-20.4.1.tar.gz
+md5  7e80b80ed7797245a5eef803043bdede  txaio-21.2.1.tar.gz
+sha256  7d6f89745680233f1c4db9ddb748df5e88d2a7a37962be174c0fd04c8dba1dc8  txaio-21.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index 2dd028f4f7..750d9e3d3d 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 20.4.1
+PYTHON_TXAIO_VERSION = 21.2.1
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/e7/dd/c0c90b080c3fad0ac8e2382eddbe86591d4fa1a5c1aea652de0adf245fc0
+PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/c5/39/2e715062283f8443d8ceeea32276db71741664d78d43c3edd3675498e926
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
