Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44EFC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 21:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3666940A05;
	Sat, 10 Dec 2022 21:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3666940A05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLXWYeOdEttn; Sat, 10 Dec 2022 21:10:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9930409EF;
	Sat, 10 Dec 2022 21:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9930409EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 222731BF3DF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AB5881400
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AB5881400
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0WtT2is-JrFF for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 21:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFA61813FD
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 21:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFA61813FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D874185F7D; Sat, 10 Dec 2022 21:10:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 21:31:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 002a5f7ced3d148655ee0d58f5dc61a509d9e218
X-Git-Newrev: 3c2033cd2ace077e7dfaf58a2589b2a93a5fd7b0
X-Patchwork-Hint: ignore
Message-Id: <20221210211024.D874185F7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{,
 python-py}mupdf: bump to version 1.21.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c2033cd2ace077e7dfaf58a2589b2a93a5fd7b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: squash the two bumps together]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mupdf/mupdf.hash                   | 4 ++--
 package/mupdf/mupdf.mk                     | 2 +-
 package/python-pymupdf/python-pymupdf.hash | 4 ++--
 package/python-pymupdf/python-pymupdf.mk   | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
index fa24e741c7..6785aa163a 100644
--- a/package/mupdf/mupdf.hash
+++ b/package/mupdf/mupdf.hash
@@ -1,8 +1,8 @@
 # From https://mupdf.com/downloads/index.html:
-sha1  f27108668e876b47d7438e2a8b2295654e66f42d  mupdf-1.20.3-source.tar.lz
+sha1  27d75cae256450abb9f50cd00b3e5a895fc684cf  mupdf-1.21.0-source.tar.lz
 
 # Locally computed:
-sha256  6f73f63ef8aa81991dfd023d4426a548827d1d74e0bfcf2a013acad63b651868  mupdf-1.20.3-source.tar.lz
+sha256  f23fc1ad9081375d9c5f2318d6e6e5c5be490ecb70b10ed7167932afbe1ccfb5  mupdf-1.21.0-source.tar.lz
 
 # Hash for license files:
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 1fc54b2d35..e93a41bd00 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-MUPDF_VERSION = 1.20.3
+MUPDF_VERSION = 1.21.0
 MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.lz
 MUPDF_SITE = https://mupdf.com/downloads/archive
 MUPDF_LICENSE = AGPL-3.0+
diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
index 21befb3b7c..d930d04335 100644
--- a/package/python-pymupdf/python-pymupdf.hash
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymupdf/json
-md5  450f0c613fec4b0d061299d3d935fafa  PyMuPDF-1.20.2.tar.gz
-sha256  02eedf01f57c6bafb5e8667cea0088a2d2522643c47100f1908bec3a68a84888  PyMuPDF-1.20.2.tar.gz
+md5  ae24d77d44369e46bbcd5457fe97d776  PyMuPDF-1.21.0.tar.gz
+sha256  a63dfc289e127a16ab60310ee6005fe83121c7a97f7c120db688f9281c9e5d0f  PyMuPDF-1.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index 238fc4dd47..38212dc44b 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-PYTHON_PYMUPDF_VERSION = 1.20.2
+PYTHON_PYMUPDF_VERSION = 1.21.0
 PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
-PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/4a/09/6afe87a8ea7acb6e4709223a704270ffe9929497add4d06b12305e229ba8
+PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/61/14/632eefe5568ee7a4ec95aa7fc9c63996ff6a6d2464d4e3a9dc35da11a409
 PYTHON_PYMUPDF_SETUP_TYPE = setuptools
 PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
