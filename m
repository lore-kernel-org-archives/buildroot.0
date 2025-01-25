Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5364BC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23907707F6;
	Fri, 28 Feb 2025 17:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z15NV4Xdo5KT; Fri, 28 Feb 2025 17:04:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F453708CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F453708CF;
	Fri, 28 Feb 2025 17:04:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0863868
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 259F642E22
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJxe3o8ftKEO for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EB9A4266D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EB9A4266D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 893D8867B4; Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 15:41:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b52959fab1bab43a86a29805dd9dd8df259ac152
X-Git-Newrev: a4dce8441b97261d56a14df0016514e2515a9e02
X-Patchwork-Hint: ignore
Message-Id: <20250228163019.893D8867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-mbstrdecoder:
 bump to version 1.1.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a4dce8441b97261d56a14df0016514e2515a9e02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-mbstrdecoder/python-mbstrdecoder.hash | 4 ++--
 package/python-mbstrdecoder/python-mbstrdecoder.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.hash b/package/python-mbstrdecoder/python-mbstrdecoder.hash
index 2943ef293f..aa278d4590 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.hash
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mbstrdecoder/json
-md5  33522a4bd9217dae46ebd0761e1a1e7c  mbstrdecoder-1.1.3.tar.gz
-sha256  dcfd2c759322eb44fe193a9e0b1b86c5b87f3ec5ea8e1bb43b3e9ae423f1e8fe  mbstrdecoder-1.1.3.tar.gz
+md5  c9d9514be421c358ca75faea3a430672  mbstrdecoder-1.1.4.tar.gz
+sha256  8105ef9cf6b7d7d69fe7fd6b68a2d8f281ca9b365d7a9b670be376b2e6c81b21  mbstrdecoder-1.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.mk b/package/python-mbstrdecoder/python-mbstrdecoder.mk
index 566420a60e..6f51b36103 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.mk
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_MBSTRDECODER_VERSION = 1.1.3
+PYTHON_MBSTRDECODER_VERSION = 1.1.4
 PYTHON_MBSTRDECODER_SOURCE = mbstrdecoder-$(PYTHON_MBSTRDECODER_VERSION).tar.gz
-PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/70/8f/dd5d4efbe3f90d2d38c948f0ca5c698e2d6cedc58ead2f5b90272cbcb4fa
+PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/31/ab/05ae008357c8bdb6245ebf8a101d99f26c096e0ea20800b318153da23796
 PYTHON_MBSTRDECODER_SETUP_TYPE = setuptools
 PYTHON_MBSTRDECODER_LICENSE = MIT
 PYTHON_MBSTRDECODER_LICENSE_FILES = LICENSE
+PYTHON_MBSTRDECODER_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
