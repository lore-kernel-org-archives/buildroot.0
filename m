Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B17C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:05:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81E6A60FDC
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81E6A60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6085A403BA;
	Sun, 26 Sep 2021 20:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zUax811_TaUt; Sun, 26 Sep 2021 20:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CBAA403B1;
	Sun, 26 Sep 2021 20:05:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7794B1BF97A
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6777A402A5
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zrsc9HtByYva for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 20:05:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99B9040213
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 20:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 29FA48D2A9; Sun, 26 Sep 2021 20:02:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:56:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 790c10d9f39c0729862e014fce2fec35707c1ee4
X-Git-Newrev: 49fb95a06207b8ddf10b8eca3d68f8c074032378
X-Patchwork-Hint: ignore
Message-Id: <20210926200256.29FA48D2A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-defusedxml: bump to version
 0.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=49fb95a06207b8ddf10b8eca3d68f8c074032378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-defusedxml/python-defusedxml.hash | 4 ++--
 package/python-defusedxml/python-defusedxml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-defusedxml/python-defusedxml.hash b/package/python-defusedxml/python-defusedxml.hash
index c782a97bbd..c32c6cdb7d 100644
--- a/package/python-defusedxml/python-defusedxml.hash
+++ b/package/python-defusedxml/python-defusedxml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/defusedxml/json
-md5  a59741f675c4cba649de40a99f732897  defusedxml-0.6.0.tar.gz
-sha256  f684034d135af4c6cbb949b8a4d2ed61634515257a67299e5f940fbaa34377f5  defusedxml-0.6.0.tar.gz
+md5  a50e7f21aa60a741efe6b1b658dfb3f8  defusedxml-0.7.1.tar.gz
+sha256  1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51aa3e69  defusedxml-0.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b80ce9da8c42a1f91079627fbbe2bf27210ae108a0ffe5f077d5b08e076c24c8  LICENSE
diff --git a/package/python-defusedxml/python-defusedxml.mk b/package/python-defusedxml/python-defusedxml.mk
index 6d2a9aff43..19ba2fda68 100644
--- a/package/python-defusedxml/python-defusedxml.mk
+++ b/package/python-defusedxml/python-defusedxml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DEFUSEDXML_VERSION = 0.6.0
+PYTHON_DEFUSEDXML_VERSION = 0.7.1
 PYTHON_DEFUSEDXML_SOURCE = defusedxml-$(PYTHON_DEFUSEDXML_VERSION).tar.gz
-PYTHON_DEFUSEDXML_SITE = https://files.pythonhosted.org/packages/a4/5f/f8aa58ca0cf01cbcee728abc9d88bfeb74e95e6cb4334cfd5bed5673ea77
+PYTHON_DEFUSEDXML_SITE = https://files.pythonhosted.org/packages/0f/d5/c66da9b79e5bdb124974bfe172b4daf3c984ebd9c2a06e2b8a4dc7331c72
 PYTHON_DEFUSEDXML_SETUP_TYPE = setuptools
 PYTHON_DEFUSEDXML_LICENSE = Python-2.0
 PYTHON_DEFUSEDXML_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
