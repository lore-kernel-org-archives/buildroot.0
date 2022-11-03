Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AA2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 020CA40BE1;
	Thu,  3 Nov 2022 21:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 020CA40BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QtYFK9O39Mte; Thu,  3 Nov 2022 21:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 242DB40BDA;
	Thu,  3 Nov 2022 21:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 242DB40BDA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 103D31BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8412540520
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8412540520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IkBPVHDdydrj for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4973540BF7
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4973540BF7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A6C587BCC; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d9d881323e66d2a5c6243afb33e3d41b76356fe7
X-Git-Newrev: 4ce5a582e9f99ac05bfbc8330c8ea978d7af9724
X-Patchwork-Hint: ignore
Message-Id: <20221103205512.3A6C587BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-kiwisolver:
 bump to version 1.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ce5a582e9f99ac05bfbc8330c8ea978d7af9724
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add new host-python-cppy build dependency.

License hash changed due to filename update:
https://github.com/nucleic/kiwi/commit/b04d5d3f6cb404d1e23c0c4f9bff76bd5a8facb6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-kiwisolver/python-kiwisolver.hash | 8 +++++---
 package/python-kiwisolver/python-kiwisolver.mk   | 6 ++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
index aa7d79ced7..7f2e263a5b 100644
--- a/package/python-kiwisolver/python-kiwisolver.hash
+++ b/package/python-kiwisolver/python-kiwisolver.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256  48168c0ace18319c649e31907f6d8586f648e503560f506f128798b99393bcdb  python-kiwisolver-1.1.0.tar.gz
-sha256  95c32f73d43fa54d8146badbcbd73b83acb7fa2cc81a7cef7784b3cd33b146a0  LICENSE
+# md5, sha256 from https://pypi.org/pypi/kiwisolver/json
+md5  34796908455c3b23c889439b541e424b  kiwisolver-1.4.4.tar.gz
+sha256  d41997519fcba4a1e46eb4a2fe31bc12f0ff957b2b81bac28db24744f333e955  kiwisolver-1.4.4.tar.gz
+# Locally computed sha256 checksums
+sha256  26da8d49744796f2601fb5fe9e5d8b9e8102064ca60a8dc1825b6177cb05450c  LICENSE
diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
index 2b99803c0d..2c5db26dbc 100644
--- a/package/python-kiwisolver/python-kiwisolver.mk
+++ b/package/python-kiwisolver/python-kiwisolver.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-PYTHON_KIWISOLVER_VERSION = 1.1.0
-PYTHON_KIWISOLVER_SITE = $(call github,nucleic,kiwi,$(PYTHON_KIWISOLVER_VERSION))
+PYTHON_KIWISOLVER_VERSION = 1.4.4
+PYTHON_KIWISOLVER_SOURCE = kiwisolver-$(PYTHON_KIWISOLVER_VERSION).tar.gz
+PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/5f/5c/272a7dd49a1914f35cd8d6d9f386defa8b047f6fbd06badd6b77b3ba24e7
 PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
 PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
 PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
+PYTHON_KIWISOLVER_DEPENDENCIES = host-python-cppy
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
