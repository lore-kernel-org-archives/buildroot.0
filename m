Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CD2C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C48440990;
	Mon, 20 Feb 2023 22:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C48440990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYACWuw9ZVdO; Mon, 20 Feb 2023 22:01:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F18FD4EBD2;
	Mon, 20 Feb 2023 22:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F18FD4EBD2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE6A61BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A01BF416B9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A01BF416B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mMx3_t8JyXqR for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D317D416B0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D317D416B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF1278648F; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b9f06cbbbce135bb149681fa708650a140a12271
X-Git-Newrev: bb0fc1d63c96df58782d5473bcca175724924e51
X-Patchwork-Hint: ignore
Message-Id: <20230220205202.CF1278648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-posix-ipc: bump
 to version 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb0fc1d63c96df58782d5473bcca175724924e51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to date update:
https://github.com/osvenskan/posix_ipc/commit/4db678001be2f16175c70cb88d4fb9f9126333f5

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-posix-ipc/python-posix-ipc.hash | 6 +++---
 package/python-posix-ipc/python-posix-ipc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-posix-ipc/python-posix-ipc.hash b/package/python-posix-ipc/python-posix-ipc.hash
index 4258af6348..74d2db0f5e 100644
--- a/package/python-posix-ipc/python-posix-ipc.hash
+++ b/package/python-posix-ipc/python-posix-ipc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/posix-ipc/json
-md5  8c9443859492ecf3aae9182aa6b5c78c  posix_ipc-1.0.5.tar.gz
-sha256  6cddb1ce2cf4aae383f2a0079c26c69bee257fe2720f372201ef047f8ceb8b97  posix_ipc-1.0.5.tar.gz
+md5  81baeabebd3e4064972ec62fd9eace0b  posix_ipc-1.1.0.tar.gz
+sha256  f86a15b32b38573c78e305ebd9100d8198a3d9facc03ffafe39edc35833738e3  posix_ipc-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  61f0669e70518e6d32f87e485965fe9309de60e4bef938b29cecd068b3db9a98  LICENSE
+sha256  2b58f0bf31a8cbd7e56bfef030e9f7f02758ce8a810d073ccf41753bdc2a0747  LICENSE
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index 359dee6d7c..c25af9ecbd 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POSIX_IPC_VERSION = 1.0.5
+PYTHON_POSIX_IPC_VERSION = 1.1.0
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
-PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/bc/2f/9a7901aa26fb0e02a671b989ba814d059a0f45af85cea31b9c9eef7e2dda
+PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/41/72/90b6702782921c0e3e0b10a66f2a47d8cfaf9c2255d763ab45cc8cea25eb
 PYTHON_POSIX_IPC_LICENSE = BSD-3-Clause
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
 PYTHON_POSIX_IPC_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
