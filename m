Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A00CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 028236075A;
	Sat, 21 Sep 2024 21:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElZVDgGGIfAt; Sat, 21 Sep 2024 21:08:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7CDD60873
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7CDD60873;
	Sat, 21 Sep 2024 21:08:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 402701BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3BF6400DD
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Anm35ORwOGeL for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04E29400EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04E29400EF
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 678AD84174; Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:52:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3bff4c7a999b8c42a0e7bb9d34c169283f53963a
X-Git-Newrev: 72153016a8814626eaa0b742b4b2b2332404d808
X-Patchwork-Hint: ignore
Message-Id: <20240921210741.678AD84174@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-opcua-asyncio: bump to
 version 1.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=72153016a8814626eaa0b742b4b2b2332404d808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-opcua-asyncio/python-opcua-asyncio.hash | 4 ++--
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
index f5856019a5..0bf137ef95 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncua/json
-md5  37000bc60b98b4822511ced1c2b4c020  asyncua-1.0.5.tar.gz
-sha256  2757163f2a2ff1d8b923297d4af9b8161d25bed95867c1f67078faaf7f2d3f92  asyncua-1.0.5.tar.gz
+md5  8c41793e873928027dad4da9035aaf8a  asyncua-1.1.5.tar.gz
+sha256  d5edac9234fd7f1ed6a923fad1bd709bd0fd3f8a0d41637d645666620375173f  asyncua-1.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index 226b9bbc21..e7da7482fb 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPCUA_ASYNCIO_VERSION = 1.0.5
+PYTHON_OPCUA_ASYNCIO_VERSION = 1.1.5
 PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
-PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/bf/c6/3c17b8b5335faffc2f08c728008c5ae7cc46d24f674bc1038a69d1849ef6
+PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/49/be/be6dad2b7db58fc9e92260fa9fdda8604841f2863d60ec2c49dccb1f9661
 PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
