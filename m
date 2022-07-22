Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9339C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64D0C60BEB;
	Fri, 22 Jul 2022 21:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64D0C60BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wkaa135jFUDR; Fri, 22 Jul 2022 21:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B93F608B7;
	Fri, 22 Jul 2022 21:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B93F608B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00A7F1BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDAFB41726
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDAFB41726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-pCjqmV7Smo for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:18:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4D4C41688
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4D4C41688
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 76AA0841DF; Fri, 22 Jul 2022 21:04:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 23:17:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13dbb736e1e6b2eb39a2f005b57440564a949ab3
X-Git-Newrev: a38da5e3cae6b786bb193d317a0e5e89466d9f6e
X-Patchwork-Hint: ignore
Message-Id: <20220722210426.76AA0841DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump to version
 1.24.8
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
Content-Type: multipart/mixed; boundary="===============8608866310811291815=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8608866310811291815==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a38da5e3cae6b786bb193d317a0e5e89466d9f6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/boto/boto3/blob/master/CHANGELOG.rst

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-boto3/python-boto3.hash | 2 +-
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 358fabd39b..96c03be61c 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,4 +1,4 @@
 # sha256 from https://pypi.org/pypi/boto3/json
-sha256  11a6035060230e92327d4f10fef6bc44188b2cd68504012bc25ed62ac31d670b  boto3-1.19.2.tar.gz
+sha256  833e67edfb73f2cc22ff27a1c33728686dc90a9e81ba2551f9462ea2d1b04f41  boto3-1.24.8.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 8e10aa482d..c5f9133573 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.19.2
+PYTHON_BOTO3_VERSION = 1.24.8
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/ec/45/d12f9c09b5c4dad8bcb098dfae5e9e1253ed6408efbbd9a3e60bff55b824
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/60/3b/6fed306341003fd059f402d22747ba33d07b8ac8bfe53dbedb2c6e42ee3b
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE

--===============8608866310811291815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8608866310811291815==--
