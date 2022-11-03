Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B15CC47089
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2687F40579;
	Mon,  5 Dec 2022 11:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2687F40579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5vhNdeIO8C9; Mon,  5 Dec 2022 11:27:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5481540545;
	Mon,  5 Dec 2022 11:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5481540545
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 038661BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE8CD81B84
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE8CD81B84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lNaAkWyHk6eO for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2879781A47
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2879781A47
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2685985BBE; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2879baa7a6136c3ec12202c0b86c470e71589eab
X-Git-Newrev: ff2de64f479aa9e6f8464e0bf5fe869b06f1ed6f
X-Patchwork-Hint: ignore
Message-Id: <20221205112603.2685985BBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-memory-profiler: bump to
 version 0.60.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff2de64f479aa9e6f8464e0bf5fe869b06f1ed6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-memory-profiler/python-memory-profiler.hash | 4 ++--
 package/python-memory-profiler/python-memory-profiler.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-memory-profiler/python-memory-profiler.hash b/package/python-memory-profiler/python-memory-profiler.hash
index 9ee515b529..9e3aca517b 100644
--- a/package/python-memory-profiler/python-memory-profiler.hash
+++ b/package/python-memory-profiler/python-memory-profiler.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/memory-profiler/json
-md5  b1d1783064a1198fb21bc877e535ec1b  memory_profiler-0.58.0.tar.gz
-sha256  01385ac0fec944fcf7969814ec4406c6d8a9c66c079d09276723c5a7680f44e5  memory_profiler-0.58.0.tar.gz
+md5  c4d29b47885c32581f5bcefb44d2ca8e  memory_profiler-0.60.0.tar.gz
+sha256  6a12869511d6cebcb29b71ba26985675a58e16e06b3c523b49f67c5497a33d1c  memory_profiler-0.60.0.tar.gz
 # Locally computed sha256 checksums
 sha256  51926ce91b8283532efa9dfb02518582c15f49c105a3ac18cce1f7a4947e96ae  COPYING
diff --git a/package/python-memory-profiler/python-memory-profiler.mk b/package/python-memory-profiler/python-memory-profiler.mk
index 053b0e2d62..5e43662e07 100644
--- a/package/python-memory-profiler/python-memory-profiler.mk
+++ b/package/python-memory-profiler/python-memory-profiler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MEMORY_PROFILER_VERSION = 0.58.0
+PYTHON_MEMORY_PROFILER_VERSION = 0.60.0
 PYTHON_MEMORY_PROFILER_SOURCE = memory_profiler-$(PYTHON_MEMORY_PROFILER_VERSION).tar.gz
-PYTHON_MEMORY_PROFILER_SITE = https://files.pythonhosted.org/packages/8f/fd/d92b3295657f8837e0177e7b48b32d6651436f0293af42b76d134c3bb489
+PYTHON_MEMORY_PROFILER_SITE = https://files.pythonhosted.org/packages/06/dd/7308a8ef1902db9d81c5bc226befe346a87ed8787caff00b8d91ed9f3b86
 PYTHON_MEMORY_PROFILER_SETUP_TYPE = setuptools
 PYTHON_MEMORY_PROFILER_LICENSE = BSD-3-Clause
 PYTHON_MEMORY_PROFILER_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
