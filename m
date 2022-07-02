Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6399C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Jul 2022 13:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 862A88261C;
	Sat,  2 Jul 2022 13:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 862A88261C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMhRF46lrn4V; Sat,  2 Jul 2022 13:54:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9249A8148D;
	Sat,  2 Jul 2022 13:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9249A8148D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30BE21BF962
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19C6F81CAD
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19C6F81CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iMUH7036AoyX for <buildroot@lists.busybox.net>;
 Sat,  2 Jul 2022 13:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63A9381B3E
 for <buildroot@buildroot.org>; Sat,  2 Jul 2022 13:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63A9381B3E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 54C3787875; Sat,  2 Jul 2022 13:39:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Jul 2022 15:48:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9ee9635623ca2ac6661671b3bafbef214e739ba
X-Git-Newrev: 7cb07eef977725ad2f1365d560e530307bb2a715
X-Patchwork-Hint: ignore
Message-Id: <20220702133939.54C3787875@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-scm: bump to
 version 7.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cb07eef977725ad2f1365d560e530307bb2a715
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 934c505442..d8ec915862 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  b4e02bf8e62ed49142ea7b42a68671d7  setuptools_scm-6.4.2.tar.gz
-sha256  6833ac65c6ed9711a4d5d2266f8024cfa07c533a0e55f4c12f6eff280a5a9e30  setuptools_scm-6.4.2.tar.gz
+md5  86fe71422781939dd492cd73c93cebac  setuptools_scm-7.0.3.tar.gz
+sha256  cf8ab8e235bed840cd4559b658af0d8e8a70896a191bbc510ee914ec5325332d  setuptools_scm-7.0.3.tar.gz
 # sha256 locally computed
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 132eb398aa..890ee0c9c1 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 6.4.2
+PYTHON_SETUPTOOLS_SCM_VERSION = 7.0.3
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/4a/18/477d3d9eb2f88230ff2a41de9d8ffa3554b706352787d289f57f76bfba0b
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/bc/e6/ac8b0c5076321b9b3e4318c32a8911a260d019be6584556a0b83a47dab4b
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
