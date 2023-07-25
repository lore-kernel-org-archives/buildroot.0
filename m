Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A4AEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 20:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C36B6114E;
	Tue, 25 Jul 2023 20:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C36B6114E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOTerE8aXDUP; Tue, 25 Jul 2023 20:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09BD36116D;
	Tue, 25 Jul 2023 20:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09BD36116D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBB121BF82F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1A0382115
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1A0382115
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7FmcTzstCNZ9 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 20:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 182A782119
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 20:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 182A782119
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 066EA82BC8; Tue, 25 Jul 2023 20:02:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 21:57:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 660d6bec560ea0e70fb5d10ee2ac4082047c38ef
X-Git-Newrev: 7510e75abdd9f76cf1d9711cdcbd1ae238be16d4
X-Patchwork-Hint: ignore
Message-Id: <20230725200233.066EA82BC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fonttools: bump to version
 4.41.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7510e75abdd9f76cf1d9711cdcbd1ae238be16d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch from zip to tar.gz download.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-fonttools/python-fonttools.hash |  4 ++--
 package/python-fonttools/python-fonttools.mk   | 12 +++---------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 4b4751dc82..84119d3346 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  f4775967d29b0da2f29ba499eed34f88  fonttools-4.38.0.zip
-sha256  2bb244009f9bf3fa100fc3ead6aeb99febe5985fa20afbfbaa2f8946c2fbdaf1  fonttools-4.38.0.zip
+md5  34d9fb935c3eaf5d2bd3572d88613bd2  fonttools-4.41.1.tar.gz
+sha256  e16a9449f21a93909c5be2f5ed5246420f2316e94195dbfccb5238aaa38f9751  fonttools-4.41.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index d31d3a2889..2fe7f50115 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,19 +4,13 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.38.0
-PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/55/5c/a4a25cf6db42d113d8f626901bb156b2f7cf7c7564a6bbc7b5cd6f7cb484
+PYTHON_FONTTOOLS_VERSION = 4.41.1
+PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/e5/55/86c43d626bbe12fb384e61152ded4f76a280d30a022968c471f850cdb0d5
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
 PYTHON_FONTTOOLS_DEPENDENCIES = host-python-cython
 PYTHON_FONTTOOLS_ENV = FONTTOOLS_WITH_CYTHON=1
 
-define PYTHON_FONTTOOLS_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(PYTHON_FONTTOOLS_DL_DIR)/$(PYTHON_FONTTOOLS_SOURCE)
-	mv $(@D)/fonttools-$(PYTHON_FONTTOOLS_VERSION)/* $(@D)
-	$(RM) -r $(@D)/fonttools-$(PYTHON_FONTTOOLS_VERSION)
-endef
-
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
