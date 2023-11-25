Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553ACC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28E541899;
	Mon,  4 Dec 2023 20:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E28E541899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psx5PNj9UzKS; Mon,  4 Dec 2023 20:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4206D41913;
	Mon,  4 Dec 2023 20:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4206D41913
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E1E11BF977
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FAC560FF1
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FAC560FF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTaBP5R4SrLS for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6829E60B4E
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6829E60B4E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59564879B7; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 12:25:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58a920e5fb364543dad9a4b328aa4ddaa3bdfa0b
X-Git-Newrev: 90eeb059105d51b7f57e57a9180e7f6156520712
X-Patchwork-Hint: ignore
Message-Id: <20231204201328.59564879B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-portend: bump to version
 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=90eeb059105d51b7f57e57a9180e7f6156520712
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to notice removal:
https://github.com/jaraco/portend/commit/5957d58266e479f124b31f30e4322e798fdf386b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-portend/python-portend.hash | 6 +++---
 package/python-portend/python-portend.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-portend/python-portend.hash b/package/python-portend/python-portend.hash
index 6af3b77792..98e196bec8 100644
--- a/package/python-portend/python-portend.hash
+++ b/package/python-portend/python-portend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/portend/json
-md5  c37d676837505a6fc8dd33185c6d62a7  portend-3.1.0.tar.gz
-sha256  239e3116045ea823f6df87d6168107ad75ccc0590e37242af0cc1e98c5d224e4  portend-3.1.0.tar.gz
+md5  0c3a2e8073c384b826f87795766f1e0e  portend-3.2.0.tar.gz
+sha256  5250a352c19c959d767cac878b829d93e5dc7625a5143399a2a00dc6628ffb72  portend-3.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-portend/python-portend.mk b/package/python-portend/python-portend.mk
index 4322121e9b..5415198ffb 100644
--- a/package/python-portend/python-portend.mk
+++ b/package/python-portend/python-portend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PORTEND_VERSION = 3.1.0
+PYTHON_PORTEND_VERSION = 3.2.0
 PYTHON_PORTEND_SOURCE = portend-$(PYTHON_PORTEND_VERSION).tar.gz
-PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/6e/0a/42bcc9c97744958ce72d33f526e972379b9e90adede8a151f338818c41d4
+PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/8f/fc/bcfc768996b438d6e4bde7a6c8cfd62089847b0f5381a0e0ec2d8ee6b202
 PYTHON_PORTEND_LICENSE = MIT
 PYTHON_PORTEND_LICENSE_FILES = LICENSE
 PYTHON_PORTEND_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
