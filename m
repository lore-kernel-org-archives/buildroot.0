Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A2BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:57:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E485617E1
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E485617E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A7884012A;
	Sun,  3 Oct 2021 19:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AbB0bRNEEjSU; Sun,  3 Oct 2021 19:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C70940169;
	Sun,  3 Oct 2021 19:57:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 155A41BF963
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D4A4407D8
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxny5LqjRzvF for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD71F407E8
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0FF2187A5E; Sun,  3 Oct 2021 19:53:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 21:40:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5aa6130f3482768c1002fdfeaa462d2a1cdb9dc4
X-Git-Newrev: 1e96980865938044a08854a056ae11bdf6e10cb9
X-Patchwork-Hint: ignore
Message-Id: <20211003195309.0FF2187A5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-posix-ipc: bump to version
 1.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e96980865938044a08854a056ae11bdf6e10cb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-posix-ipc/python-posix-ipc.hash | 6 +++---
 package/python-posix-ipc/python-posix-ipc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-posix-ipc/python-posix-ipc.hash b/package/python-posix-ipc/python-posix-ipc.hash
index d267cabc88..4258af6348 100644
--- a/package/python-posix-ipc/python-posix-ipc.hash
+++ b/package/python-posix-ipc/python-posix-ipc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/posix-ipc/json
-md5	c4fd0065244ccb2f59cb8ceedf287cf6  posix_ipc-1.0.4.tar.gz
-sha256	ff6c9077633fc62a491d6997c43b094d885bb45a7ca1f36c9a0d647c54b74b14  posix_ipc-1.0.4.tar.gz
+md5  8c9443859492ecf3aae9182aa6b5c78c  posix_ipc-1.0.5.tar.gz
+sha256  6cddb1ce2cf4aae383f2a0079c26c69bee257fe2720f372201ef047f8ceb8b97  posix_ipc-1.0.5.tar.gz
 # Locally computed sha256 checksums
-sha256	61f0669e70518e6d32f87e485965fe9309de60e4bef938b29cecd068b3db9a98  LICENSE
+sha256  61f0669e70518e6d32f87e485965fe9309de60e4bef938b29cecd068b3db9a98  LICENSE
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index d4429f117e..359dee6d7c 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POSIX_IPC_VERSION = 1.0.4
+PYTHON_POSIX_IPC_VERSION = 1.0.5
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
-PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/c9/3e/54217da71aa26b488295d878df4d3132093253b4ae5798ac66fcb6921ef0
+PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/bc/2f/9a7901aa26fb0e02a671b989ba814d059a0f45af85cea31b9c9eef7e2dda
 PYTHON_POSIX_IPC_LICENSE = BSD-3-Clause
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
 PYTHON_POSIX_IPC_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
