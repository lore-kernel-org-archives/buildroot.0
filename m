Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC98E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 20:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB67F60650;
	Mon, 23 Dec 2024 20:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYNuleJb97Ii; Mon, 23 Dec 2024 20:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA38060684
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA38060684;
	Mon, 23 Dec 2024 20:21:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C751757
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 20:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3444D60684
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 20:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbO6uRnTZOfd for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 20:21:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6027060650
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6027060650
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 20:21:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BECC8744C; Mon, 23 Dec 2024 20:21:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 21:19:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 457283d14d9a37c8581cf4118bc57cb5fb583ff9
X-Git-Newrev: b3ddad3d5199fe2443b20a562aac41fa1fc70529
X-Patchwork-Hint: ignore
Message-Id: <20241223202144.4BECC8744C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest-asyncio: bump to
 0.25.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3ddad3d5199fe2443b20a562aac41fa1fc70529
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://pytest-asyncio.readthedocs.io/en/latest/reference/changelog.html

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index a88d1c5841..1e5eafd86a 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  510ca6136236bba0f0581aa46060ae03  pytest_asyncio-0.24.0.tar.gz
-sha256  d081d828e576d85f875399194281e92bf8a68d60d72d1a2faf2feddb6c46b276  pytest_asyncio-0.24.0.tar.gz
+md5  cfec568101379ff7188b152e2f88a4c1  pytest_asyncio-0.25.0.tar.gz
+sha256  8c0610303c9e0442a5db8604505fc0f545456ba1528824842b37b4a626cbf609  pytest_asyncio-0.25.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index ae0934e00f..52040df519 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 0.24.0
+PYTHON_PYTEST_ASYNCIO_VERSION = 0.25.0
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest_asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/52/6d/c6cf50ce320cf8611df7a1254d86233b3df7cc07f9b5f5cbcb82e08aa534
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/94/18/82fcb4ee47d66d99f6cd1efc0b11b2a25029f303c599a5afda7c1bca4254
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
