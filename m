Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FD3C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84B2F410CA;
	Sun, 15 Jan 2023 11:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B2F410CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id De59O7DwTEUM; Sun, 15 Jan 2023 11:09:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 695AF41296;
	Sun, 15 Jan 2023 11:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 695AF41296
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D82C1BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7250B82004
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7250B82004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kUDwUkcWWAX9 for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CF7C81F37
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CF7C81F37
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19821870D1; Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:00:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f29c7f18d6267e65863aedb6d0c515cf8f9404f1
X-Git-Newrev: fc457e3d320bea68eac1bab8bd759c1ba0f7b40b
X-Patchwork-Hint: ignore
Message-Id: <20230115110628.19821870D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dicttoxml: bump to version
 1.7.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc457e3d320bea68eac1bab8bd759c1ba0f7b40b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-dicttoxml/python-dicttoxml.hash | 4 ++--
 package/python-dicttoxml/python-dicttoxml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dicttoxml/python-dicttoxml.hash b/package/python-dicttoxml/python-dicttoxml.hash
index dcde7cf1b6..1c94d3446a 100644
--- a/package/python-dicttoxml/python-dicttoxml.hash
+++ b/package/python-dicttoxml/python-dicttoxml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dicttoxml/json
-md5  234550e3aa875c6f3520aa9a2dff1ef1  dicttoxml-1.7.15.tar.gz
-sha256  5540fe7dfde2d2ed9467e67fcc981cbd2e164dc3120c862bdb7333202ac48838  dicttoxml-1.7.15.tar.gz
+md5  f4853a05c41f9056172447d4e59517b9  dicttoxml-1.7.16.tar.gz
+sha256  6f36ce644881db5cd8940bee9b7cb3f3f6b7b327ba8a67d83d3e2caa0538bf9d  dicttoxml-1.7.16.tar.gz
 # Locally computed sha256 checksums
 sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
index 3e5f90e9de..c26c16b72a 100644
--- a/package/python-dicttoxml/python-dicttoxml.mk
+++ b/package/python-dicttoxml/python-dicttoxml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DICTTOXML_VERSION = 1.7.15
+PYTHON_DICTTOXML_VERSION = 1.7.16
 PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
-PYTHON_DICTTOXML_SITE = https://files.pythonhosted.org/packages/45/b5/efa170fd88e8b8bc025c59592eade0fb7de6ae02ed3dd63957956adc1396
+PYTHON_DICTTOXML_SITE = https://files.pythonhosted.org/packages/ee/c9/3132427f9e64d572688e6a1cbe3d542d1a03f676b81fb600f3d1fd7d2ec5
 PYTHON_DICTTOXML_SETUP_TYPE = distutils
 PYTHON_DICTTOXML_LICENSE = GPL-2.0
 PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
