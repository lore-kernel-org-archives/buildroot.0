Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5113AC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 080777021F;
	Tue, 21 Feb 2023 02:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 080777021F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xrhk6p7xR74j; Tue, 21 Feb 2023 02:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DA2F7035F;
	Tue, 21 Feb 2023 02:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DA2F7035F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7336C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABC666FB76
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABC666FB76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VsU_F5gd8Jh for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA04D6FAEC
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA04D6FAEC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5F0586495; Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:00:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0cd7fadb263decfa5b4566f6ad71c02914726146
X-Git-Newrev: 1db8f1edf859a501fb8444e90a2af7916f48de42
X-Patchwork-Hint: ignore
Message-Id: <20230220205233.C5F0586495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-bidict: bump to
 version 0.22.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1db8f1edf859a501fb8444e90a2af7916f48de42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-bidict/python-bidict.hash | 4 ++--
 package/python-bidict/python-bidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bidict/python-bidict.hash b/package/python-bidict/python-bidict.hash
index fe9a94af53..bcb9ea3f34 100644
--- a/package/python-bidict/python-bidict.hash
+++ b/package/python-bidict/python-bidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bidict/json
-md5  da3d37ae93c740c191b5666918c3164f  bidict-0.22.0.tar.gz
-sha256  5c826b3e15e97cc6e615de295756847c282a79b79c5430d3bfc909b1ac9f5bd8  bidict-0.22.0.tar.gz
+md5  67dd74f41341e7ff437d69e00a6fd514  bidict-0.22.1.tar.gz
+sha256  1e0f7f74e4860e6d0943a05d4134c63a2fad86f3d4732fb265bd79e4e856d81d  bidict-0.22.1.tar.gz
 # Locally computed sha256 checksums
 sha256  be0487398bba08e7772b4077b637787b94973b53c44b3cbdd6c7dab10ed15035  LICENSE
diff --git a/package/python-bidict/python-bidict.mk b/package/python-bidict/python-bidict.mk
index 7ba15db605..ae3a1ee024 100644
--- a/package/python-bidict/python-bidict.mk
+++ b/package/python-bidict/python-bidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BIDICT_VERSION = 0.22.0
+PYTHON_BIDICT_VERSION = 0.22.1
 PYTHON_BIDICT_SOURCE = bidict-$(PYTHON_BIDICT_VERSION).tar.gz
-PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/2b/84/159749556b9c49ea4489dadeb94d44f05d6033d1db3af4c83120ecac5b15
+PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/f2/be/b31e6ea9c94096a323e7a0e2c61480db01f07610bb7e7ea72a06fd1a23a8
 PYTHON_BIDICT_SETUP_TYPE = setuptools
 PYTHON_BIDICT_LICENSE = MPL-2.0
 PYTHON_BIDICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
