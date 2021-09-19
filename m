Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F72C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:10:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9014761244
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9014761244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63BA940216;
	Sun, 19 Sep 2021 13:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpfe2qwCJL-Q; Sun, 19 Sep 2021 13:10:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 988C2404EB;
	Sun, 19 Sep 2021 13:10:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CAAD1BF5AC
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86D50401D1
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fj9ka7UjqLW for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 13:08:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6B16400E4
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 13:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4D6788B7F2; Sun, 19 Sep 2021 13:06:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 14:37:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e52de40d2e028707e5c20d55805fe616c106b15
X-Git-Newrev: d5a98bff0ce0bcecd76bb3012ebb18fc309795ad
X-Patchwork-Hint: ignore
Message-Id: <20210919130650.4D6788B7F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python{3}-psutil: bump to version
 5.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5a98bff0ce0bcecd76bb3012ebb18fc309795ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 package/python3-psutil/python3-psutil.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 1a053cc368..552ced55ec 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5  50bf39b4faa268ba1da8a9730bb38bb6  psutil-5.7.2.tar.gz
-sha256  90990af1c3c67195c44c9a889184f84f5b2320dce3ee3acbd054e3ba0b4a7beb  psutil-5.7.2.tar.gz
+md5  91060da163ef478002a4456dd99cbb4c  psutil-5.8.0.tar.gz
+sha256  0c9ccb99ab76025f2f0bbecf341d4656e9c1351db8cc8a03ccd62e318ab4b5c6  psutil-5.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  24c12984500caa07ffdce19eebc06396c5e6d244b573bc6c438f4a6ef8e56c1b  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 9dbc472213..3bba7ca343 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-psutil/python3-psutil.mk
-PYTHON_PSUTIL_VERSION = 5.7.2
+PYTHON_PSUTIL_VERSION = 5.8.0
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/e1/b0/7276de53321c12981717490516b7e612364f2cb372ee8901bd4a66a000d7
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
diff --git a/package/python3-psutil/python3-psutil.mk b/package/python3-psutil/python3-psutil.mk
index 029e1b1c12..1304124f57 100644
--- a/package/python3-psutil/python3-psutil.mk
+++ b/package/python3-psutil/python3-psutil.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-psutil/python-psutil.mk
-PYTHON3_PSUTIL_VERSION = 5.7.2
+PYTHON3_PSUTIL_VERSION = 5.8.0
 PYTHON3_PSUTIL_SOURCE = psutil-$(PYTHON3_PSUTIL_VERSION).tar.gz
-PYTHON3_PSUTIL_SITE = https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1
+PYTHON3_PSUTIL_SITE = https://files.pythonhosted.org/packages/e1/b0/7276de53321c12981717490516b7e612364f2cb372ee8901bd4a66a000d7
 PYTHON3_PSUTIL_SETUP_TYPE = setuptools
 PYTHON3_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON3_PSUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
