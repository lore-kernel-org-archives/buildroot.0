Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433E8C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:09:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4A4E611F0
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4A4E611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4029400E4;
	Sun, 19 Sep 2021 13:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64j54TCSkj3a; Sun, 19 Sep 2021 13:09:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4A574018C;
	Sun, 19 Sep 2021 13:09:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA2141BF95D
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B695A840BB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgc5cyisyC2Z for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 13:08:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E630840AF
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 13:08:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7D4B18B7F2; Sun, 19 Sep 2021 13:06:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 15:04:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abd008b29f50077966a72fd978912e6a02b1c0c8
X-Git-Newrev: 1474dddf5da2a0a8e80713cc803a4d36728b2b99
X-Patchwork-Hint: ignore
Message-Id: <20210919130650.7D4B18B7F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipdb: bump to version 0.13.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1474dddf5da2a0a8e80713cc803a4d36728b2b99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-ipdb/python-ipdb.hash | 4 ++--
 package/python-ipdb/python-ipdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipdb/python-ipdb.hash b/package/python-ipdb/python-ipdb.hash
index c7cd93225d..7d483e1777 100644
--- a/package/python-ipdb/python-ipdb.hash
+++ b/package/python-ipdb/python-ipdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ipdb/json
-md5  7db72771b279924ac4e5905d7eee184e  ipdb-0.13.2.tar.gz
-sha256  77fb1c2a6fccdfee0136078c9ed6fe547ab00db00bebff181f1e8c9e13418d49  ipdb-0.13.2.tar.gz
+md5  4f5ffb71cd6551319acf8cbceabd8936  ipdb-0.13.9.tar.gz
+sha256  951bd9a64731c444fd907a5ce268543020086a697f6be08f7cc2c9a752a278c5  ipdb-0.13.9.tar.gz
 # Locally computed sha256 checksums
 sha256  4eeb49de04f4894f8ea1f69a04f500799041b750b3d554c06de5ca877258e734  COPYING.txt
diff --git a/package/python-ipdb/python-ipdb.mk b/package/python-ipdb/python-ipdb.mk
index c98f9700b2..7828f83020 100644
--- a/package/python-ipdb/python-ipdb.mk
+++ b/package/python-ipdb/python-ipdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPDB_VERSION = 0.13.2
+PYTHON_IPDB_VERSION = 0.13.9
 PYTHON_IPDB_SOURCE = ipdb-$(PYTHON_IPDB_VERSION).tar.gz
-PYTHON_IPDB_SITE = https://files.pythonhosted.org/packages/2c/bb/a3e1a441719ebd75c6dac8170d3ddba884b7ee8a5c0f9aefa7297386627a
+PYTHON_IPDB_SITE = https://files.pythonhosted.org/packages/fc/56/9f67dcd4a4b9960373173a31be1b8c47fe351a1c9385677a7bdd82810e57
 PYTHON_IPDB_SETUP_TYPE = setuptools
 PYTHON_IPDB_LICENSE = BSD-3-Clause
 PYTHON_IPDB_LICENSE_FILES = COPYING.txt
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
