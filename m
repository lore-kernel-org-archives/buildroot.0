Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30C3C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:25:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D3A161B40
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D3A161B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B91B404EC;
	Sun,  3 Oct 2021 08:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxgxdjW5l1Ri; Sun,  3 Oct 2021 08:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ECE44019B;
	Sun,  3 Oct 2021 08:25:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C67061BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 609B340536
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OTM7pPFZWVgM for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C21E40552
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 824B28DB44; Sun,  3 Oct 2021 08:20:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 10:22:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cfcd0af9a528f8aa9e62c94c013b212be7c645d6
X-Git-Newrev: 8c1a9b2f1cdd7d4306364edc472606ee623cb64d
X-Patchwork-Hint: ignore
Message-Id: <20211003082055.824B28DB44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xlrd: bump to version 2.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c1a9b2f1cdd7d4306364edc472606ee623cb64d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-xlrd/python-xlrd.hash | 6 +++---
 package/python-xlrd/python-xlrd.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlrd/python-xlrd.hash b/package/python-xlrd/python-xlrd.hash
index 0a66a2112a..003ccc9a72 100644
--- a/package/python-xlrd/python-xlrd.hash
+++ b/package/python-xlrd/python-xlrd.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlrd/json
-md5	e5d5b96924d791b22898b622eb3e918e  xlrd-1.2.0.tar.gz
-sha256	546eb36cee8db40c3eaa46c351e67ffee6eeb5fa2650b71bc4c758a29a1b29b2  xlrd-1.2.0.tar.gz
-# locally calculated
+md5  ae3f951c857a490d432f0a7d722352bf  xlrd-2.0.1.tar.gz
+sha256  f72f148f54442c6b056bf931dbc34f986fd0c3b0b6b5a58d013c9aef274d0c88  xlrd-2.0.1.tar.gz
+# Locally computed sha256 checksums
 sha256  b5a5dbce60265e305a815a6cb83ed07f24519d8ba644f2a307994488bced8815  LICENSE
diff --git a/package/python-xlrd/python-xlrd.mk b/package/python-xlrd/python-xlrd.mk
index c94e054b5b..1f280bd432 100644
--- a/package/python-xlrd/python-xlrd.mk
+++ b/package/python-xlrd/python-xlrd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLRD_VERSION = 1.2.0
+PYTHON_XLRD_VERSION = 2.0.1
 PYTHON_XLRD_SOURCE = xlrd-$(PYTHON_XLRD_VERSION).tar.gz
-PYTHON_XLRD_SITE = https://files.pythonhosted.org/packages/aa/05/ec9d4fcbbb74bbf4da9f622b3b61aec541e4eccf31d3c60c5422ec027ce2
+PYTHON_XLRD_SITE = https://files.pythonhosted.org/packages/a6/b3/19a2540d21dea5f908304375bd43f5ed7a4c28a370dc9122c565423e6b44
 PYTHON_XLRD_SETUP_TYPE = setuptools
 PYTHON_XLRD_LICENSE = BSD-3-Clause
 PYTHON_XLRD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
