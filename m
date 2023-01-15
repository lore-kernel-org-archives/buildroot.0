Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2497C46467
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D29160F9E;
	Sun, 15 Jan 2023 11:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D29160F9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id giCGLplTc61R; Sun, 15 Jan 2023 11:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D001360F97;
	Sun, 15 Jan 2023 11:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D001360F97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28E9A1BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40C8081F05
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C8081F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnLQS40gieWT for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:19:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17F3C81F1A
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17F3C81F1A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01F2B870F1; Sun, 15 Jan 2023 11:19:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:15:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1f426de2e67018d8b57c03457dbf1d719ac3b19
X-Git-Newrev: e52a5966ec9be07d846ca3a0264cbd892d256b53
X-Patchwork-Hint: ignore
Message-Id: <20230115111943.01F2B870F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{,
 python-py}mupdf: bump to version 1.21.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e52a5966ec9be07d846ca3a0264cbd892d256b53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mupdf/mupdf.hash                   | 4 ++--
 package/mupdf/mupdf.mk                     | 2 +-
 package/python-pymupdf/python-pymupdf.hash | 4 ++--
 package/python-pymupdf/python-pymupdf.mk   | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
index 6785aa163a..ef91abee18 100644
--- a/package/mupdf/mupdf.hash
+++ b/package/mupdf/mupdf.hash
@@ -1,8 +1,8 @@
 # From https://mupdf.com/downloads/index.html:
-sha1  27d75cae256450abb9f50cd00b3e5a895fc684cf  mupdf-1.21.0-source.tar.lz
+sha1  f759d914ec6ad6a3b96f994630ff70b75823831b  mupdf-1.21.1-source.tar.lz
 
 # Locally computed:
-sha256  f23fc1ad9081375d9c5f2318d6e6e5c5be490ecb70b10ed7167932afbe1ccfb5  mupdf-1.21.0-source.tar.lz
+sha256  66a43490676c7f7c2ff74067328ef13285506fcc758d365ae27ea3668bd5e620  mupdf-1.21.1-source.tar.lz
 
 # Hash for license files:
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index e93a41bd00..d6cc407c49 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-MUPDF_VERSION = 1.21.0
+MUPDF_VERSION = 1.21.1
 MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.lz
 MUPDF_SITE = https://mupdf.com/downloads/archive
 MUPDF_LICENSE = AGPL-3.0+
diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
index d930d04335..bda356d905 100644
--- a/package/python-pymupdf/python-pymupdf.hash
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymupdf/json
-md5  ae24d77d44369e46bbcd5457fe97d776  PyMuPDF-1.21.0.tar.gz
-sha256  a63dfc289e127a16ab60310ee6005fe83121c7a97f7c120db688f9281c9e5d0f  PyMuPDF-1.21.0.tar.gz
+md5  be10963679ac6d52b7aed2311ca7e3c5  PyMuPDF-1.21.1.tar.gz
+sha256  f815741a435c62a0036bbcbf5fa6c533567bd69c5338d413714fc57b22db93e0  PyMuPDF-1.21.1.tar.gz
 # Locally computed sha256 checksums
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index 38212dc44b..70448e8d90 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-PYTHON_PYMUPDF_VERSION = 1.21.0
+PYTHON_PYMUPDF_VERSION = 1.21.1
 PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
-PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/61/14/632eefe5568ee7a4ec95aa7fc9c63996ff6a6d2464d4e3a9dc35da11a409
+PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/30/44/9fce79689e5df7deebe2d17cb2b9b2a6b888439c241e71296e732aefa649
 PYTHON_PYMUPDF_SETUP_TYPE = setuptools
 PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
