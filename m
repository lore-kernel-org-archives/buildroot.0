Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1F6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:59:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92A4C60FDC
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92A4C60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 706B260748;
	Sun, 26 Sep 2021 19:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynkQmEb6sVgJ; Sun, 26 Sep 2021 19:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C936260708;
	Sun, 26 Sep 2021 19:59:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E30A1BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98DA240198
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DS2d2OHabBQX for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF9BF403AB
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 90B0D8D25E; Sun, 26 Sep 2021 19:50:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:29:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c66439bb7fce5ac429066d71fd0fe518938fefc
X-Git-Newrev: 6c09567e6b6f2cc826e64cd9b36fb41ed7c6e00c
X-Patchwork-Hint: ignore
Message-Id: <20210926195018.90B0D8D25E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-inflection: bump to version
 0.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c09567e6b6f2cc826e64cd9b36fb41ed7c6e00c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file update was a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-inflection/python-inflection.hash | 10 +++++-----
 package/python-inflection/python-inflection.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-inflection/python-inflection.hash b/package/python-inflection/python-inflection.hash
index bdad35ad25..b170d3f6b0 100644
--- a/package/python-inflection/python-inflection.hash
+++ b/package/python-inflection/python-inflection.hash
@@ -1,5 +1,5 @@
-# Hashes from https://pypi.python.org/pypi/inflection/json
-md5     7941165e9f148e0520023941c0886b40  inflection-0.3.1.tar.gz
-sha256  18ea7fb7a7d152853386523def08736aa8c32636b047ade55f7578c4edeb16ca  inflection-0.3.1.tar.gz
-# License file, locally calculated
-sha256  4a3f52ac1012a90db398e4c55f1d1bea501dddafef8a4b3adb7533b1d820e148  LICENSE
+# md5, sha256 from https://pypi.org/pypi/inflection/json
+md5  c3287d4f0e3bdf625a52d655cc514403  inflection-0.5.1.tar.gz
+sha256  1a29730d366e996aaacffb2f1f1cb9593dc38e2ddd30c91250c6dde09ea9b417  inflection-0.5.1.tar.gz
+# Locally computed sha256 checksums
+sha256  9e9f9b4b2e7543ad1486f1328bf9ec50e5a5e2bb9caceb59652496dd61e64133  LICENSE
diff --git a/package/python-inflection/python-inflection.mk b/package/python-inflection/python-inflection.mk
index 7309880c6a..7c030e99b9 100644
--- a/package/python-inflection/python-inflection.mk
+++ b/package/python-inflection/python-inflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INFLECTION_VERSION = 0.3.1
+PYTHON_INFLECTION_VERSION = 0.5.1
 PYTHON_INFLECTION_SOURCE = inflection-$(PYTHON_INFLECTION_VERSION).tar.gz
-PYTHON_INFLECTION_SITE = https://pypi.python.org/packages/d5/35/a6eb45b4e2356fe688b21570864d4aa0d0a880ce387defe9c589112077f8
+PYTHON_INFLECTION_SITE = https://files.pythonhosted.org/packages/e1/7e/691d061b7329bc8d54edbf0ec22fbfb2afe61facb681f9aaa9bff7a27d04
 PYTHON_INFLECTION_SETUP_TYPE = setuptools
 PYTHON_INFLECTION_LICENSE = MIT
 PYTHON_INFLECTION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
