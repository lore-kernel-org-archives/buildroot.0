Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A598C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C02D81773;
	Mon,  5 Dec 2022 11:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C02D81773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q90ixgG51exM; Mon,  5 Dec 2022 11:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4057B81CD0;
	Mon,  5 Dec 2022 11:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4057B81CD0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63B841BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F91140546
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F91140546
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xciOgK9-S6pa for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1700440577
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1700440577
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0535B85B9E; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6dab7b3b44111f28384b80392393bb9a6e03485
X-Git-Newrev: a2e19ebb5035a171750e98926429b286cb1f6e21
X-Patchwork-Hint: ignore
Message-Id: <20221205112603.0535B85B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markdown2: bump to version
 2.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2e19ebb5035a171750e98926429b286cb1f6e21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-markdown2/python-markdown2.hash | 4 ++--
 package/python-markdown2/python-markdown2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
index a3e310aacf..f8582ba5b8 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown2/json
-md5  6134fce06c4783b3178a90a719fa9d91  markdown2-2.4.1.tar.gz
-sha256  ce9265cf179c4e07934e7b6a4b03f3edb7891e66e6d0f7017755f6064bbbe13f  markdown2-2.4.1.tar.gz
+md5  bb3f451bed011a0d8959e3c1d5850c53  markdown2-2.4.6.tar.gz
+sha256  f65b4dbe1e16591b14fd40bc659b8b58d285eab70c1da21f390294fcdec42bb0  markdown2-2.4.6.tar.gz
 # Locally computed sha256 checksums
 sha256  f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index 6acfad2ccb..b1c162e12f 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.4.1
+PYTHON_MARKDOWN2_VERSION = 2.4.6
 PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
-PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/fb/10/4f327f4517fa5dda90021618fe174d1f4aff3c4e06abcd7f77685a455511
+PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/83/b7/24613765f558afde9f47b61fcd787a9856ac1515b53af38bd11bf2fb3c8c
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
