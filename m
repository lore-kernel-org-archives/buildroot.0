Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37D2C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:56:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B14360F48
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B14360F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF94384946;
	Sun,  3 Oct 2021 19:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wnYLOXKJXgzw; Sun,  3 Oct 2021 19:56:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A36D84749;
	Sun,  3 Oct 2021 19:56:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCE751BF963
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 592C24012A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m0ShGYOaYbTd for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B08440169
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AFD0A87A5E; Sun,  3 Oct 2021 19:53:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 21:32:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0138db0f4d8445cc7a5cdcb646f04ab47961ad2d
X-Git-Newrev: 247d3bf567bfcb6e2e7ad3406e971b8916aaeb66
X-Patchwork-Hint: ignore
Message-Id: <20211003195308.AFD0A87A5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-more-itertools: bump to
 version 8.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=247d3bf567bfcb6e2e7ad3406e971b8916aaeb66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And update URL on Config.in.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-more-itertools/Config.in                  | 2 +-
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-more-itertools/Config.in b/package/python-more-itertools/Config.in
index 1a7f95c27f..f54b52d1f0 100644
--- a/package/python-more-itertools/Config.in
+++ b/package/python-more-itertools/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_MORE_ITERTOOLS
 	help
 	  More routines for operating on iterables, beyond itertools.
 
-	  https://github.com/erikrose/more-itertools
+	  https://github.com/more-itertools/more-itertools
diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index 189498ec5e..4e6e7bdfb8 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  0912041c05148ed079984cff69af2e99  more-itertools-8.4.0.tar.gz
-sha256  68c70cc7167bdf5c7c9d8f6954a7837089c6a36bf565383919bb595efb8a17e5  more-itertools-8.4.0.tar.gz
+md5  9930552c4f7eedc00193673d5f7f0f19  more-itertools-8.10.0.tar.gz
+sha256  1debcabeb1df793814859d64a81ad7cb10504c24349368ccf214c664c474f41f  more-itertools-8.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index ef21f4d27d..3b9957b72e 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 8.4.0
+PYTHON_MORE_ITERTOOLS_VERSION = 8.10.0
 PYTHON_MORE_ITERTOOLS_SOURCE = more-itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/67/4a/16cb3acf64709eb0164e49ba463a42dc45366995848c4f0cf770f57b8120
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/8a/f7/93cf3c81629c95f6f40e509f7cd63985a6ddd829181a66c1c8ef101e55f2
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = setuptools
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
