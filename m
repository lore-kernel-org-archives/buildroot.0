Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECACC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75E7140BD8;
	Thu,  3 Nov 2022 21:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75E7140BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqBM3uh4APWp; Thu,  3 Nov 2022 21:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AD8A40BDD;
	Thu,  3 Nov 2022 21:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AD8A40BDD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02FAC1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D1C540C1D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D1C540C1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5TWltEpRSyD for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A733C40BCF
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A733C40BCF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FB5D87BCA; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: effab27db24de3999fb36768d16d4bceb1faefe1
X-Git-Newrev: e6d1d0c51f18e57c6cb58b3b1dc5e0eac693c553
X-Patchwork-Hint: ignore
Message-Id: <20221103205511.9FB5D87BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-filelock: bump
 to version 3.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6d1d0c51f18e57c6cb58b3b1dc5e0eac693c553
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index d7cc864668..e4dd67de07 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  f8458b5235a9e439fd512dc08947f6b2  filelock-3.3.0.tar.gz
-sha256  8c7eab13dc442dc249e95158bcc12dec724465919bdc9831fdbf0660f03d1785  filelock-3.3.0.tar.gz
+md5  9bd8d33d5d7dc95012981ccbfb2d2a0f  filelock-3.8.0.tar.gz
+sha256  55447caa666f2198c5b6b13a26d2084d26fa5b115c00d065664b2124680c4edc  filelock-3.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 00c32b2caa..8d5308ddca 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.3.0
+PYTHON_FILELOCK_VERSION = 3.8.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/fd/6e/665a6cb363bee26e40954ee812e4e733fd7cafd84c06e0c7c2357641abd6
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/95/55/b897882bffb8213456363e646bf9e9fa704ffda5a7d140edf935a9e02c7b
 PYTHON_FILELOCK_SETUP_TYPE = setuptools
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
