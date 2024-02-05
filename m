Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278EFC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF599419D9;
	Mon,  5 Feb 2024 11:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF599419D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gFlcHVq9Vtn; Mon,  5 Feb 2024 11:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56E19419CE;
	Mon,  5 Feb 2024 11:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E19419CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CD761BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F43241760
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F43241760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0iCPwiRKppJQ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:37:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E485B419B0
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E485B419B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D032886C06; Mon,  5 Feb 2024 11:37:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:36:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 435f71ad2ef340b0e89a77702c1e273bb4dad1a5
X-Git-Newrev: 63c571096ffbf484ead8d0fc7d8c3b222853e8c5
X-Patchwork-Hint: ignore
Message-Id: <20240205113720.D032886C06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-s3transfer: bump to version
 0.10.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=63c571096ffbf484ead8d0fc7d8c3b222853e8c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-s3transfer/python-s3transfer.hash | 5 +++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index 16f0face72..48be6b3a8b 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/s3transfer/json
-sha256  2ed07d3866f523cc561bf4a00fc5535827981b117dd7876f036b0c1aca42c947  s3transfer-0.6.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/s3transfer/json
+md5  ba84e7c06bc1dcd3151c3d2132621cfc  s3transfer-0.10.0.tar.gz
+sha256  d0c8bbf672d5eebbe4e57945e23b972d963f07d82f661cabf678a5c88831595b  s3transfer-0.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index 60a72da729..6fae824862 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.6.0
+PYTHON_S3TRANSFER_VERSION = 0.10.0
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/e1/eb/e57c93d5cd5edf8c1d124c831ef916601540db70acd96fa21fe60cef1365
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/a0/b5/4c570b08cb85fdcc65037b5229e00412583bb38d974efecb7ec3495f40ba
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
