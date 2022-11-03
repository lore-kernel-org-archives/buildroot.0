Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A233C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33C8A40BF7;
	Thu,  3 Nov 2022 21:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C8A40BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FcluuFnW14HY; Thu,  3 Nov 2022 21:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 436BE40BEB;
	Thu,  3 Nov 2022 21:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 436BE40BEB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E928A1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8280740C06
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8280740C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id psBEv-rY4MYa for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEFB740BE1
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEFB740BE1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3BC987BCE; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1fb64680bffbda1e5fb952150652f73205322707
X-Git-Newrev: 13d4626b304375844f34afe881cb295dc7d5fcfc
X-Patchwork-Hint: ignore
Message-Id: <20221103205513.B3BC987BCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pymupdf: bump
 to version 1.20.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=13d4626b304375844f34afe881cb295dc7d5fcfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License changed to AGPL-3.0+ only:
https://github.com/pymupdf/PyMuPDF/commit/dcbd9bb8c3fd2002b9e03a8c61b4b8bf90cfdb01

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pymupdf/python-pymupdf.hash | 8 ++++----
 package/python-pymupdf/python-pymupdf.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
index ee7a916519..21befb3b7c 100644
--- a/package/python-pymupdf/python-pymupdf.hash
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymupdf/json
-md5  70d6c2232e531772bbe9a813044262f9  PyMuPDF-1.18.14.tar.gz
-sha256  efe85cb80f79cc3f3890aa2ab82b962b8a999ca078e33e9bacc5d0be5c4656dc  PyMuPDF-1.18.14.tar.gz
-# Locally computed:
-sha256  282751b8c98ee9e445346eb57a992c9ecbe25ed8dd554df046777313e19b10f9  COPYING
+md5  450f0c613fec4b0d061299d3d935fafa  PyMuPDF-1.20.2.tar.gz
+sha256  02eedf01f57c6bafb5e8667cea0088a2d2522643c47100f1908bec3a68a84888  PyMuPDF-1.20.2.tar.gz
+# Locally computed sha256 checksums
+sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index ceeeb0a55b..238fc4dd47 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -5,11 +5,11 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-PYTHON_PYMUPDF_VERSION = 1.18.14
+PYTHON_PYMUPDF_VERSION = 1.20.2
 PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
-PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/41/f6/dbefe3d6949fa81fb7bcac9141e4345330d272724718ac5a6af78297498b
+PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/4a/09/6afe87a8ea7acb6e4709223a704270ffe9929497add4d06b12305e229ba8
 PYTHON_PYMUPDF_SETUP_TYPE = setuptools
-PYTHON_PYMUPDF_LICENSE = GPL-3.0, AGPL-3.0+ (code generated from mupdf)
+PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING
 # No license file included in pip, but it's present on github
 PYTHON_PYMUPDF_DEPENDENCIES = freetype mupdf zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
