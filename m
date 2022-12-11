Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F62C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1E14ED02;
	Mon, 20 Feb 2023 21:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E1E14ED02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UxY8z8632bVd; Mon, 20 Feb 2023 21:56:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B1B94ED12;
	Mon, 20 Feb 2023 21:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B1B94ED12
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A26431BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67E39416A4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67E39416A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7b0m1tkpWlA7 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77B62416A6
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77B62416A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7514C8648F; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:28:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0f0ceb49be6a5e3439fa6da226d4e414b5a208ad
X-Git-Newrev: 9eb2d23a260af9594ce80caace01bfa2deac3ff7
X-Patchwork-Hint: ignore
Message-Id: <20230220205201.7514C8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-dicttoxml: bump
 to version 1.7.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=9eb2d23a260af9594ce80caace01bfa2deac3ff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-dicttoxml/python-dicttoxml.hash | 8 ++++----
 package/python-dicttoxml/python-dicttoxml.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-dicttoxml/python-dicttoxml.hash b/package/python-dicttoxml/python-dicttoxml.hash
index d8c43d0144..dcde7cf1b6 100644
--- a/package/python-dicttoxml/python-dicttoxml.hash
+++ b/package/python-dicttoxml/python-dicttoxml.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/dicttoxml/json
-md5  ec5643a048cf32dad3c28db236b923e4  dicttoxml-1.7.4.tar.gz
-# Locally computed
-sha256  ea44cc4ec6c0f85098c57a431a1ee891b3549347b07b7414c8a24611ecf37e45  dicttoxml-1.7.4.tar.gz
+# md5, sha256 from https://pypi.org/pypi/dicttoxml/json
+md5  234550e3aa875c6f3520aa9a2dff1ef1  dicttoxml-1.7.15.tar.gz
+sha256  5540fe7dfde2d2ed9467e67fcc981cbd2e164dc3120c862bdb7333202ac48838  dicttoxml-1.7.15.tar.gz
+# Locally computed sha256 checksums
 sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
index 537afff601..3e5f90e9de 100644
--- a/package/python-dicttoxml/python-dicttoxml.mk
+++ b/package/python-dicttoxml/python-dicttoxml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DICTTOXML_VERSION = 1.7.4
+PYTHON_DICTTOXML_VERSION = 1.7.15
 PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
-PYTHON_DICTTOXML_SITE = https://pypi.python.org/packages/74/36/534db111db9e7610a41641a1f6669a964aacaf51858f466de264cc8dcdd9
+PYTHON_DICTTOXML_SITE = https://files.pythonhosted.org/packages/45/b5/efa170fd88e8b8bc025c59592eade0fb7de6ae02ed3dd63957956adc1396
 PYTHON_DICTTOXML_SETUP_TYPE = distutils
 PYTHON_DICTTOXML_LICENSE = GPL-2.0
 PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
