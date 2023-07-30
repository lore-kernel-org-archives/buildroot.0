Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4EFC001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 418B360804;
	Sun, 30 Jul 2023 21:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 418B360804
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PsPSb9pH5URy; Sun, 30 Jul 2023 21:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB006102B;
	Sun, 30 Jul 2023 21:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FB006102B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 670CD1BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 419E361030
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 419E361030
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSlmV7XzYwDs for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:34:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 731CD61028
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 731CD61028
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EA5083D28; Sun, 30 Jul 2023 21:34:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 23:26:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2a9a06092e66111f34e449371872de2d4ccde5b
X-Git-Newrev: d78de0ca97e178c89a6e3a78cb36b300200b75a1
X-Patchwork-Hint: ignore
Message-Id: <20230730213426.5EA5083D28@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gast: bump to version 0.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d78de0ca97e178c89a6e3a78cb36b300200b75a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gast/python-gast.hash | 4 ++--
 package/python-gast/python-gast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gast/python-gast.hash b/package/python-gast/python-gast.hash
index f16d001a6a..9ce5296938 100644
--- a/package/python-gast/python-gast.hash
+++ b/package/python-gast/python-gast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gast/json
-md5  fdff900805e03e9dd76d377eb4cbaed7  gast-0.5.3.tar.gz
-sha256  cfbea25820e653af9c7d1807f659ce0a0a9c64f2439421a7bba4f0983f532dea  gast-0.5.3.tar.gz
+md5  907c689e3fdbc7a48cc010e665195baa  gast-0.5.4.tar.gz
+sha256  9c270fe5f4b130969b54174de7db4e764b09b4f7f67ccfc32480e29f78348d97  gast-0.5.4.tar.gz
 # Locally computed sha256 checksums
 sha256  6a04bbabd9b48bea6bf7c0bd3f3a062e1476b3c403a746448fd69b0d902e148f  LICENSE
diff --git a/package/python-gast/python-gast.mk b/package/python-gast/python-gast.mk
index e02e87fb23..0db1dbe93e 100644
--- a/package/python-gast/python-gast.mk
+++ b/package/python-gast/python-gast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GAST_VERSION = 0.5.3
+PYTHON_GAST_VERSION = 0.5.4
 PYTHON_GAST_SOURCE = gast-$(PYTHON_GAST_VERSION).tar.gz
-PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/48/a3/0bd844c54ae8141642088b7ae09dd38fec2ec7faa9b7d25bb6a23c1f266f
+PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/e4/41/f26f62ebef1a80148e20951a6e9ef4d0ebbe2090124bc143da26e12a934c
 PYTHON_GAST_SETUP_TYPE = setuptools
 PYTHON_GAST_LICENSE = BSD-3-Clause
 PYTHON_GAST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
