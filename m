Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25289CCD18E
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 22:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDFEC60F17;
	Tue, 14 Oct 2025 22:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TmU5xGLZhAZ; Tue, 14 Oct 2025 22:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D173E610D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D173E610D5;
	Tue, 14 Oct 2025 22:00:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B5D24C4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0949D40572
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LajuoM6HF7iP for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 22:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AC2640089
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AC2640089
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06D01870FC; Tue, 14 Oct 2025 22:00:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 23:58:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b03567854b3b0e4e7dcaebe277c5aea490118a37
X-Git-Newrev: 2859c51f34282cea2ac953dac2444b2f7b7a86d1
X-Patchwork-Hint: ignore
Message-Id: <20251014220001.06D01870FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-posix-ipc: bump version to
 1.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2859c51f34282cea2ac953dac2444b2f7b7a86d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/osvenskan/posix_ipc/blob/rel1.3.0/history.md

Updated project URL due to note at
http://semanchuk.com/philip/posix_ipc/

Updated license hash due to upstream commits:
https://github.com/osvenskan/posix_ipc/commit/5ddd92995681595acbc530b7fbd4b7ff36279a16
https://github.com/osvenskan/posix_ipc/commit/5ddd92995681595acbc530b7fbd4b7ff36279a16

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-posix-ipc/Config.in             | 2 +-
 package/python-posix-ipc/python-posix-ipc.hash | 6 +++---
 package/python-posix-ipc/python-posix-ipc.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-posix-ipc/Config.in b/package/python-posix-ipc/Config.in
index 2c62678679..59200de66c 100644
--- a/package/python-posix-ipc/Config.in
+++ b/package/python-posix-ipc/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_PYTHON_POSIX_IPC
 	  on systems that support the POSIX Realtime Extensions
 	  a.k.a. POSIX 1003.1b-1993.
 
-	  http://semanchuk.com/philip/posix_ipc/
+	  https://github.com/osvenskan/posix_ipc/
 
 comment "python-posix-ipc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-posix-ipc/python-posix-ipc.hash b/package/python-posix-ipc/python-posix-ipc.hash
index 427e4c7b55..1f1d98bcb4 100644
--- a/package/python-posix-ipc/python-posix-ipc.hash
+++ b/package/python-posix-ipc/python-posix-ipc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/posix-ipc/json
-md5  523a31c4dbd56e0d4fd677f33e126e5d  posix_ipc-1.1.1.tar.gz
-sha256  e2456ba0cfb2ee5ba14121450e8d825b3c4a1461fca0761220aab66d4111cbb7  posix_ipc-1.1.1.tar.gz
+md5  2488e63c881311f2bb697a0344ba9070  posix_ipc-1.3.0.tar.gz
+sha256  6e559ac5bb5f6f233c396103f4868e383bbd8f4e54d20876910896f47d353448  posix_ipc-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  2b58f0bf31a8cbd7e56bfef030e9f7f02758ce8a810d073ccf41753bdc2a0747  LICENSE
+sha256  3f65e6e3d932adabcc6176dad775c6e538711483ef8de45a3ec47a12525f56b3  LICENSE
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index bdd2f1d4af..48d6588310 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POSIX_IPC_VERSION = 1.1.1
+PYTHON_POSIX_IPC_VERSION = 1.3.0
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
-PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/07/7f/b954f224a226960a4aa98b6c5fa3d4f3fafb20bb8461446e41b563aee863
+PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/2b/a1/16d4b5a7dfc3dbb5965debe0415b6dc4866d4c94a1229f5b12cde7b78de8
 PYTHON_POSIX_IPC_LICENSE = BSD-3-Clause
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
 PYTHON_POSIX_IPC_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
