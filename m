Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BB4C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7497281FB1;
	Thu,  3 Nov 2022 21:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7497281FB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nKjIfYLlK-0U; Thu,  3 Nov 2022 21:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D9DD81FAA;
	Thu,  3 Nov 2022 21:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D9DD81FAA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15BE91BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4FD440BEC
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4FD440BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfMcxRfh8Nfu for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54E7040BD2
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54E7040BD2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43ED987BCA; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4ce5a582e9f99ac05bfbc8330c8ea978d7af9724
X-Git-Newrev: 6bed05b2f1b660383b7c6835d59b45eac01bf982
X-Patchwork-Hint: ignore
Message-Id: <20221103205512.43ED987BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-lark: bump to
 version 1.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bed05b2f1b660383b7c6835d59b45eac01bf982
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to whitespace removal:
https://github.com/lark-parser/lark/commit/5236ff95a37cf464ba7049b27622d87b662c1918

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-lark/python-lark.hash | 6 +++---
 package/python-lark/python-lark.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-lark/python-lark.hash b/package/python-lark/python-lark.hash
index 3773c00f7c..abc168e93b 100644
--- a/package/python-lark/python-lark.hash
+++ b/package/python-lark/python-lark.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lark/json
-md5  fd3ca96a8d9d67798508470032921078  lark-1.1.2.tar.gz
-sha256  7a8d0c07d663da9391d7faee1bf1d7df4998c47ca43a593cbef5c7566acd057a  lark-1.1.2.tar.gz
+md5  d7368d8f9fd0b844c034f321f5b52fd4  lark-1.1.4.tar.gz
+sha256  eee86062b149600ef62de0d8dfd38cf85ffc737e16911e7d8c18880f8c5b1333  lark-1.1.4.tar.gz
 # Locally computed sha256 checksums
-sha256  6e83ad8e0de51690a53eac02dd2b6188dfd7949053be56fba5b651140d27ee57  LICENSE
+sha256  8263e5652d07cecb3adadf05140b65e70cfa169ecec5f520fe1671479ce12a83  LICENSE
diff --git a/package/python-lark/python-lark.mk b/package/python-lark/python-lark.mk
index 52c249552e..548adcd833 100644
--- a/package/python-lark/python-lark.mk
+++ b/package/python-lark/python-lark.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LARK_VERSION = 1.1.2
+PYTHON_LARK_VERSION = 1.1.4
 PYTHON_LARK_SOURCE = lark-$(PYTHON_LARK_VERSION).tar.gz
-PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/a3/c5/11d0a086590b207ad1b6c9ba6e019f8290652f3d703cdb002d72e220dd99
+PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/1d/08/eb2590d4f824b5a947d866c603799fa70278f1372cbf8d15b7b4823dfb2b
 PYTHON_LARK_SETUP_TYPE = setuptools
 PYTHON_LARK_LICENSE = MIT
 PYTHON_LARK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
