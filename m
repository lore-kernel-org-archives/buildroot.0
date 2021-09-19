Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95324C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:09:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E130C61244
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E130C61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4D2481D98;
	Sun, 19 Sep 2021 13:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7yrL7gS_T_4P; Sun, 19 Sep 2021 13:09:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC36F819D5;
	Sun, 19 Sep 2021 13:09:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63E191BF5AC
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50D46401D1
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kho2kRQ7Lvgn for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 13:08:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE21540210
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 13:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 563378B7F3; Sun, 19 Sep 2021 13:06:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 14:37:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5a98bff0ce0bcecd76bb3012ebb18fc309795ad
X-Git-Newrev: 0185914515f9739d0fde05ec60916da373292e28
X-Patchwork-Hint: ignore
Message-Id: <20210919130650.563378B7F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python{3}-six: bump to version
 1.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0185914515f9739d0fde05ec60916da373292e28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-six/python-six.hash | 4 ++--
 package/python-six/python-six.mk   | 4 ++--
 package/python3-six/python3-six.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-six/python-six.hash b/package/python-six/python-six.hash
index 9945ffd1d7..17615e8699 100644
--- a/package/python-six/python-six.hash
+++ b/package/python-six/python-six.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/six/json
-md5  9f90a0eaa0ea7747fda01ca79d21ebcb  six-1.15.0.tar.gz
-sha256  30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259  six-1.15.0.tar.gz
+md5  a7c927740e4964dd29b72cebfc1429bb  six-1.16.0.tar.gz
+sha256  1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926  six-1.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8bb850c565aa389fdc16f3a46965ad23d82adff60f2393fc2762b63185e8e6c9  LICENSE
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index 7c298d6f89..41ef41d0ba 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-six/python3-six.mk
-PYTHON_SIX_VERSION = 1.15.0
+PYTHON_SIX_VERSION = 1.16.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
-PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426
+PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e
 PYTHON_SIX_SETUP_TYPE = setuptools
 PYTHON_SIX_LICENSE = MIT
 PYTHON_SIX_LICENSE_FILES = LICENSE
diff --git a/package/python3-six/python3-six.mk b/package/python3-six/python3-six.mk
index debd338a4b..ee9dc818ee 100644
--- a/package/python3-six/python3-six.mk
+++ b/package/python3-six/python3-six.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-six/python-six.mk
-PYTHON3_SIX_VERSION = 1.15.0
+PYTHON3_SIX_VERSION = 1.16.0
 PYTHON3_SIX_SOURCE = six-$(PYTHON3_SIX_VERSION).tar.gz
-PYTHON3_SIX_SITE = https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426
+PYTHON3_SIX_SITE = https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e
 PYTHON3_SIX_SETUP_TYPE = setuptools
 PYTHON3_SIX_LICENSE = MIT
 PYTHON3_SIX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
