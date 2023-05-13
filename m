Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6073C77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 19:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 809A561501;
	Sat, 13 May 2023 19:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 809A561501
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1cXdznzMeGs; Sat, 13 May 2023 19:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF8D614B8;
	Sat, 13 May 2023 19:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF8D614B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C30011BF86B
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A90FC840EF
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A90FC840EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCv44vrk7nHg for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 19:32:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE898840EC
 for <buildroot@buildroot.org>; Sat, 13 May 2023 19:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE898840EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA0F8865A2; Sat, 13 May 2023 19:32:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 21:32:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9acc0c4e998dcb2bdacd8665b10e061cb01685d4
X-Git-Newrev: 436f9966ce7930b4d4cbf5182b5ebaf6e52ee089
X-Patchwork-Hint: ignore
Message-Id: <20230513193258.BA0F8865A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: python-botocore: bump to 1.29.115
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
Content-Type: multipart/mixed; boundary="===============8308664592339938854=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8308664592339938854==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=436f9966ce7930b4d4cbf5182b5ebaf6e52ee089
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-botocore/python-botocore.hash | 5 +++--
 package/python-botocore/python-botocore.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 57d07a6711..89f4c06de8 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,5 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  c608709a5cf3e67442f4254a34d1faab  botocore-1.29.96.tar.gz
-sha256  b9781108810e33f8406942c3e3aab748650c59d5cddb7c9d323f4e2682e7b0b6  botocore-1.29.96.tar.gz
+md5  805e638c353c532c2af7a7538d5bd4d6  botocore-1.29.115.tar.gz
+sha256  58eee8cf8f4f3e515df29f6dc535dd86ed3f4cea40999c5bc74640ff40bdc71f  botocore-1.29.115.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 6d0747c0df..3e828fef78 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.29.96
+PYTHON_BOTOCORE_VERSION = 1.29.115
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/2d/b5/4a986aeb4e3d182f7ef116705962d3c98c0263beaf87c49836b7dfb91837
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/9e/00/4560081a431aaa14c2257040d43f56c2ccba816d8bce3b8e1577a19f4076
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
-PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt
+PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
 
 $(eval $(python-package))

--===============8308664592339938854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8308664592339938854==--
