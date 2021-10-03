Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEB9C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:55:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC846617E1
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC846617E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 659DF4080D;
	Sun,  3 Oct 2021 19:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wphWXL1YXvbG; Sun,  3 Oct 2021 19:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC84B4080A;
	Sun,  3 Oct 2021 19:55:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 077461BF45A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8D394080D
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRn0zGIDqpvb for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A289407B9
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8675087A5E; Sun,  3 Oct 2021 19:53:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 21:31:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e636c321c52aa40fc6d736ea70312ca26edca300
X-Git-Newrev: fd03cb5a12981a9c34b0025ff3ae4b8456342724
X-Patchwork-Hint: ignore
Message-Id: <20211003195308.8675087A5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-incremental: bump to
 version 21.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd03cb5a12981a9c34b0025ff3ae4b8456342724
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Update URL on Config.in
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-incremental/Config.in               | 2 +-
 package/python-incremental/python-incremental.hash | 8 ++++----
 package/python-incremental/python-incremental.mk   | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-incremental/Config.in b/package/python-incremental/Config.in
index 64f8623354..c895e820c5 100644
--- a/package/python-incremental/Config.in
+++ b/package/python-incremental/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_INCREMENTAL
 	help
 	  A library for versioning your Python projects.
 
-	  https://github.com/hawkowl/incremental
+	  https://github.com/twisted/incremental
diff --git a/package/python-incremental/python-incremental.hash b/package/python-incremental/python-incremental.hash
index c897f6e495..47af832f39 100644
--- a/package/python-incremental/python-incremental.hash
+++ b/package/python-incremental/python-incremental.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/incremental/json
-md5	602746e0d438e075a5a9e0678140bba2  incremental-17.5.0.tar.gz
-sha256	7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3  incremental-17.5.0.tar.gz
-# Locally computed sha256
-sha256	d043bc8899b4695de1f4511d8f507b927e11723b981ce600fa3ef7b73954afa5  LICENSE
+md5  9f7ad12e0c05a12cee52a7350976c4e3  incremental-21.3.0.tar.gz
+sha256  02f5de5aff48f6b9f665d99d48bfc7ec03b6e3943210de7cfc88856d755d6f57  incremental-21.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256  d043bc8899b4695de1f4511d8f507b927e11723b981ce600fa3ef7b73954afa5  LICENSE
diff --git a/package/python-incremental/python-incremental.mk b/package/python-incremental/python-incremental.mk
index 9c9d3a4405..7c6b2a547c 100644
--- a/package/python-incremental/python-incremental.mk
+++ b/package/python-incremental/python-incremental.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INCREMENTAL_VERSION = 17.5.0
+PYTHON_INCREMENTAL_VERSION = 21.3.0
 PYTHON_INCREMENTAL_SOURCE = incremental-$(PYTHON_INCREMENTAL_VERSION).tar.gz
-PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/8f/26/02c4016aa95f45479eea37c90c34f8fab6775732ae62587a874b619ca097
+PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/4f/c5/430765c697afc217c8491785de321a21fa4d983dda14bcd82feb965b0593
 PYTHON_INCREMENTAL_SETUP_TYPE = setuptools
 PYTHON_INCREMENTAL_LICENSE = MIT
 PYTHON_INCREMENTAL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
