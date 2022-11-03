Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0E6C47089
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 772F740264;
	Mon,  5 Dec 2022 11:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 772F740264
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5-zqGm34UgME; Mon,  5 Dec 2022 11:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72E1340915;
	Mon,  5 Dec 2022 11:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E1340915
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 226961BF955
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9823A40546
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9823A40546
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lDhSx-jBLkdq for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C868F40523
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C868F40523
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3F8C85BA2; Mon,  5 Dec 2022 11:26:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66911c3dd28a134f550ca03efe19c19daf229dd1
X-Git-Newrev: 448e701daa35bb6bd23bc6ad3c667c058e7ffb04
X-Patchwork-Hint: ignore
Message-Id: <20221205112600.C3F8C85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump to version
 1.26.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=448e701daa35bb6bd23bc6ad3c667c058e7ffb04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-boto3/python-boto3.hash | 5 +++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 96c03be61c..347acde9b2 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/boto3/json
-sha256  833e67edfb73f2cc22ff27a1c33728686dc90a9e81ba2551f9462ea2d1b04f41  boto3-1.24.8.tar.gz
+# md5, sha256 from https://pypi.org/pypi/boto3/json
+md5  17f5f946d79da139fa9fd9b014fe0d99  boto3-1.26.0.tar.gz
+sha256  8f0e4eb5c26f927c09bc03302d38156af578b816f1e4f8ca4f0f734d134b9d4f  boto3-1.26.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index c5f9133573..03dc32a08b 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.24.8
+PYTHON_BOTO3_VERSION = 1.26.0
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/60/3b/6fed306341003fd059f402d22747ba33d07b8ac8bfe53dbedb2c6e42ee3b
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/77/18/91af4ff58b26d03af8bf8e0759c4087b77032bdc54199d750905080c669a
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
