Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A19C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79678840BD;
	Sun, 17 Jul 2022 13:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79678840BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzOosLgcrMGU; Sun, 17 Jul 2022 13:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A853840B2;
	Sun, 17 Jul 2022 13:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A853840B2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2529F1BF9A3
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F36E2400DD
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F36E2400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1pAKyuKV90n7 for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:20:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 337FC40412
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 337FC40412
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 101D683BCE; Sun, 17 Jul 2022 13:06:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 15:15:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d69820376e53d8723f3de57c9c1bfe9d4ba76f9
X-Git-Newrev: bf38ea9c41a338444f1079da156eec97dc49fbbc
X-Patchwork-Hint: ignore
Message-Id: <20220717130655.101D683BCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-kflash: Update to version
 1.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf38ea9c41a338444f1079da156eec97dc49fbbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the python-kflash package to the new verseion 1.1.6 (from 1.1.5).

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-kflash/python-kflash.hash | 4 ++--
 package/python-kflash/python-kflash.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-kflash/python-kflash.hash b/package/python-kflash/python-kflash.hash
index 722c4e879b..a4e5238635 100644
--- a/package/python-kflash/python-kflash.hash
+++ b/package/python-kflash/python-kflash.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/kflash/json
-md5  85549bcc1faa0f2cd5ebe3b04759e7fa  kflash-1.1.5.tar.gz
-sha256  40a0976b52942c7a3bdfa2d9e2bdc8d7526cf6deb0759c8384281240c8fb404e  kflash-1.1.5.tar.gz
+md5  5b4376ea60f20368852d0c4743e6ed08  kflash-1.1.6.tar.gz
+sha256  ec5fbb35ea81a91c89f458d375e24a6dab3d3865c69a7e6250511b2e93f4b695  kflash-1.1.6.tar.gz
 # Locally computed sha256 checksums
 sha256  c48133d7a08d743c2c01c6190fc1860f7d73777afa2199ed8d0a035b754d8bf9  LICENSE
diff --git a/package/python-kflash/python-kflash.mk b/package/python-kflash/python-kflash.mk
index adbf6b30b0..efc0f52eba 100644
--- a/package/python-kflash/python-kflash.mk
+++ b/package/python-kflash/python-kflash.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KFLASH_VERSION = 1.1.5
+PYTHON_KFLASH_VERSION = 1.1.6
 PYTHON_KFLASH_SOURCE = kflash-$(PYTHON_KFLASH_VERSION).tar.gz
-PYTHON_KFLASH_SITE = https://files.pythonhosted.org/packages/c4/b3/1c25a92922bfd3dbc05d972352c071167cad035c615f6f068f75c2f0fd01
+PYTHON_KFLASH_SITE = https://files.pythonhosted.org/packages/4f/80/d2eaa114bf4434b18fcf8960a907ffce12c9400b08c05902b36007d545b7
 PYTHON_KFLASH_SETUP_TYPE = setuptools
 PYTHON_KFLASH_LICENSE = MIT
 PYTHON_KFLASH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
