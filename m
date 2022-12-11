Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530C1C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED61240141;
	Mon, 20 Feb 2023 22:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED61240141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id givnq-ztsJwX; Mon, 20 Feb 2023 22:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 948714EFB2;
	Mon, 20 Feb 2023 22:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 948714EFB2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E74A31BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53A196101C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53A196101C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Crt9PYDAph4V for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B23F6110A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B23F6110A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79773828C8; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a8954158337c3c15a7b7f184cd78fab9b625df08
X-Git-Newrev: 7d08d1f7bca47a5f73422ebd716f30c79cd99124
X-Patchwork-Hint: ignore
Message-Id: <20230220205202.79773828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/python-memory-profiler: bump to version 0.61.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d08d1f7bca47a5f73422ebd716f30c79cd99124
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-memory-profiler/python-memory-profiler.hash | 4 ++--
 package/python-memory-profiler/python-memory-profiler.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-memory-profiler/python-memory-profiler.hash b/package/python-memory-profiler/python-memory-profiler.hash
index 9e3aca517b..bab9018331 100644
--- a/package/python-memory-profiler/python-memory-profiler.hash
+++ b/package/python-memory-profiler/python-memory-profiler.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/memory-profiler/json
-md5  c4d29b47885c32581f5bcefb44d2ca8e  memory_profiler-0.60.0.tar.gz
-sha256  6a12869511d6cebcb29b71ba26985675a58e16e06b3c523b49f67c5497a33d1c  memory_profiler-0.60.0.tar.gz
+md5  5fe93d5035288095c4f86ef69ee19f37  memory_profiler-0.61.0.tar.gz
+sha256  4e5b73d7864a1d1292fb76a03e82a3e78ef934d06828a698d9dada76da2067b0  memory_profiler-0.61.0.tar.gz
 # Locally computed sha256 checksums
 sha256  51926ce91b8283532efa9dfb02518582c15f49c105a3ac18cce1f7a4947e96ae  COPYING
diff --git a/package/python-memory-profiler/python-memory-profiler.mk b/package/python-memory-profiler/python-memory-profiler.mk
index 5e43662e07..c7f84043eb 100644
--- a/package/python-memory-profiler/python-memory-profiler.mk
+++ b/package/python-memory-profiler/python-memory-profiler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MEMORY_PROFILER_VERSION = 0.60.0
+PYTHON_MEMORY_PROFILER_VERSION = 0.61.0
 PYTHON_MEMORY_PROFILER_SOURCE = memory_profiler-$(PYTHON_MEMORY_PROFILER_VERSION).tar.gz
-PYTHON_MEMORY_PROFILER_SITE = https://files.pythonhosted.org/packages/06/dd/7308a8ef1902db9d81c5bc226befe346a87ed8787caff00b8d91ed9f3b86
+PYTHON_MEMORY_PROFILER_SITE = https://files.pythonhosted.org/packages/b2/88/e1907e1ca3488f2d9507ca8b0ae1add7b1cd5d3ca2bc8e5b329382ea2c7b
 PYTHON_MEMORY_PROFILER_SETUP_TYPE = setuptools
 PYTHON_MEMORY_PROFILER_LICENSE = BSD-3-Clause
 PYTHON_MEMORY_PROFILER_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
