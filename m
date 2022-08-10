Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E318C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 21:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF912404CC;
	Wed, 10 Aug 2022 21:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF912404CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JBZYHN6DLXyj; Wed, 10 Aug 2022 21:15:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D450404A3;
	Wed, 10 Aug 2022 21:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D450404A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74A4D1BF9D1
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A939404A5
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A939404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRdxWXAEAdvw for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 21:14:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31B91404A3
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 21:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31B91404A3
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5F501870B3; Wed, 10 Aug 2022 21:00:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 23:13:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff859bd7ef8fbcec29260c4b03a8cfd31eafca23
X-Git-Newrev: 8bee47e43d692e67640fc76209df93c31ccb3dcd
X-Patchwork-Hint: ignore
Message-Id: <20220810210030.5F501870B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-maturin: bump to version
 0.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bee47e43d692e67640fc76209df93c31ccb3dcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 383dbf8737..2604dd40c4 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  4ea4f6b02cabffc8b56c488956ad572abfabdce935128007dff48a6e95b553d2  maturin-0.12.20.tar.gz
+sha256  1c385169ef87ecc076c1471ccd9efdd60d151d1f5d566f1117ca73ea926f7698  maturin-0.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 9ac11f264b..b92738822e 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.12.20
+PYTHON_MATURIN_VERSION = 0.13.1
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/39/ba/fec598956393230341def42367c6ad0efbee6ddc899f8858e5b25a7f37a5
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/9b/a2/9b8377c61a0ded0b9c832343ca4bc1069e07bbcf8f844be6faf4858c7a48
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
