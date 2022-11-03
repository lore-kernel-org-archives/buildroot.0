Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC00C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 048038129D;
	Mon,  5 Dec 2022 11:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 048038129D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBdugoIp3AHZ; Mon,  5 Dec 2022 11:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FFEC8128D;
	Mon,  5 Dec 2022 11:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FFEC8128D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24FB91BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F07E6403D6
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F07E6403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVxiArQdtsED for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A9FD4053C
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A9FD4053C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 736E085B9E; Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1a8e3abab4f44832f04cfe03c1f7fd6df77ea47
X-Git-Newrev: f5021429999c957e2683ad4d11ca43ba411d8b45
X-Patchwork-Hint: ignore
Message-Id: <20221205112601.736E085B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dialog3: bump to version
 3.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5021429999c957e2683ad4d11ca43ba411d8b45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dialog3/python-dialog3.hash | 8 ++++----
 package/python-dialog3/python-dialog3.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-dialog3/python-dialog3.hash b/package/python-dialog3/python-dialog3.hash
index 4c43d4bf5e..d66f328638 100644
--- a/package/python-dialog3/python-dialog3.hash
+++ b/package/python-dialog3/python-dialog3.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pythondialog/json
-md5  07e257d91099b804e040c6ea5ec56041  pythondialog-3.5.1.tar.gz
-# Locally computed
-sha256  34a0687290571f37d7d297514cc36bd4cd044a3a4355271549f91490d3e7ece8  pythondialog-3.5.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pythondialog/json
+md5  94a9236e427de783fa3ee8288834f7f1  pythondialog-3.5.3.tar.gz
+sha256  b2a34a8af0a6625ccbdf45cd343b854fc6c1a85231dadc80b8805db836756323  pythondialog-3.5.3.tar.gz
+# Locally computed sha256 checksums
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/python-dialog3/python-dialog3.mk b/package/python-dialog3/python-dialog3.mk
index 6051985640..e936de5811 100644
--- a/package/python-dialog3/python-dialog3.mk
+++ b/package/python-dialog3/python-dialog3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DIALOG3_VERSION = 3.5.1
+PYTHON_DIALOG3_VERSION = 3.5.3
 PYTHON_DIALOG3_SOURCE = pythondialog-$(PYTHON_DIALOG3_VERSION).tar.gz
-PYTHON_DIALOG3_SITE = https://files.pythonhosted.org/packages/72/3c/26ed0db035f97196704d0197d8b2254b8a6ca93a2d132430b0b0d597aa79
+PYTHON_DIALOG3_SITE = https://files.pythonhosted.org/packages/4e/40/5c84d79f7d536ca2c3722af521eff4faafe54a93797f08c72eb72e68fb68
 PYTHON_DIALOG3_LICENSE = LGPL-2.1+
 PYTHON_DIALOG3_LICENSE_FILES = COPYING
 PYTHON_DIALOG3_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
