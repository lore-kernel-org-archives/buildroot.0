Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73496C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E0B04179D;
	Mon,  5 Feb 2024 10:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E0B04179D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id toAOmbGWzkec; Mon,  5 Feb 2024 10:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6677241806;
	Mon,  5 Feb 2024 10:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6677241806
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 104851BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD69960F51
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD69960F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bX3-dGPYC2Lx for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:31:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E947660F31
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E947660F31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D430C86A81; Mon,  5 Feb 2024 10:31:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:30:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4585259743e0ff3977c05c864dc752c040023738
X-Git-Newrev: 4a7afebe03803484261a82b5ca3fa59813e9b324
X-Patchwork-Hint: ignore
Message-Id: <20240205103117.D430C86A81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest-asyncio: bump to
 version 0.23.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4a7afebe03803484261a82b5ca3fa59813e9b324
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index f6cc1d2413..29a38c7dc7 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  1d10f607444a375c1425a2a90960006e  pytest-asyncio-0.21.1.tar.gz
-sha256  40a7eae6dded22c7b604986855ea48400ab15b069ae38116e8c01238e9eeb64d  pytest-asyncio-0.21.1.tar.gz
+md5  0c81f6de855e546180de424c0db05c20  pytest-asyncio-0.23.3.tar.gz
+sha256  af313ce900a62fbe2b1aed18e37ad757f1ef9940c6b6a88e2954de38d6b1fb9f  pytest-asyncio-0.23.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index 5c5efd819c..8464c70f5f 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 0.21.1
+PYTHON_PYTEST_ASYNCIO_VERSION = 0.23.3
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest-asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/5a/85/d39ef5f69d5597a206f213ce387bcdfa47922423875829f7a98a87d33281
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/1d/27/f036ec4bcbfd056c54572d7169ba3dbb54e7181f02f21caadd3aecb9cf5b
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
+PYTHON_PYTEST_ASYNCIO_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
