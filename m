Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1EBC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BDB941739;
	Mon,  5 Feb 2024 11:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BDB941739
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flQrxhYav0w0; Mon,  5 Feb 2024 11:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E72BF40B42;
	Mon,  5 Feb 2024 11:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E72BF40B42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55CF91BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C4F2418A3
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C4F2418A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8WfAtNDgu9S for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 990A04189F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 990A04189F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85DD886B6F; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:05:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d1fc26f04698517afa225968cdfcd4c615870fa
X-Git-Newrev: 2f996ed3a8e8274d4acc604097909550b0a09087
X-Patchwork-Hint: ignore
Message-Id: <20240205110640.85DD886B6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-requests-toolbelt: bump to
 version 1.0.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2f996ed3a8e8274d4acc604097909550b0a09087
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-requests-toolbelt/Config.in                     | 2 +-
 package/python-requests-toolbelt/python-requests-toolbelt.hash | 4 ++--
 package/python-requests-toolbelt/python-requests-toolbelt.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-requests-toolbelt/Config.in b/package/python-requests-toolbelt/Config.in
index ba2b95152e..7d5b4b65c2 100644
--- a/package/python-requests-toolbelt/Config.in
+++ b/package/python-requests-toolbelt/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_REQUESTS_TOOLBELT
 	help
 	  A utility belt for advanced users of python-requests.
 
-	  https://toolbelt.readthedocs.org
+	  https://toolbelt.readthedocs.io/
diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.hash b/package/python-requests-toolbelt/python-requests-toolbelt.hash
index 28abf2c628..12bc58131d 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.hash
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests-toolbelt/json
-md5  636d226d03632d013269aebbc85f4f4b  requests-toolbelt-0.10.1.tar.gz
-sha256  62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b1337626b2abb628a63d  requests-toolbelt-0.10.1.tar.gz
+md5  6a8348cfc9991b44e499345db1c6f925  requests-toolbelt-1.0.0.tar.gz
+sha256  7681a0a3d047012b5bdc0ee37d7f8f07ebe76ab08caeccfc3921ce23c88d5bc6  requests-toolbelt-1.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1f8cf8bdacd98ed6d36d0fec0c07f7765acebd6e81205962ab5146023b3c858d  LICENSE
diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.mk b/package/python-requests-toolbelt/python-requests-toolbelt.mk
index 8c141e3aa9..d0bcb1bb21 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.mk
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_TOOLBELT_VERSION = 0.10.1
+PYTHON_REQUESTS_TOOLBELT_VERSION = 1.0.0
 PYTHON_REQUESTS_TOOLBELT_SOURCE = requests-toolbelt-$(PYTHON_REQUESTS_TOOLBELT_VERSION).tar.gz
-PYTHON_REQUESTS_TOOLBELT_SITE = https://files.pythonhosted.org/packages/0c/4c/07f01c6ac44f7784fa399137fbc8d0cdc1b5d35304e8c0f278ad82105b58
+PYTHON_REQUESTS_TOOLBELT_SITE = https://files.pythonhosted.org/packages/f3/61/d7545dafb7ac2230c70d38d31cbfe4cc64f7144dc41f6e4e4b78ecd9f5bb
 PYTHON_REQUESTS_TOOLBELT_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_TOOLBELT_LICENSE = Apache-2.0
 PYTHON_REQUESTS_TOOLBELT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
