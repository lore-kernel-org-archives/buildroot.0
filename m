Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358C9C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD6CF403C2;
	Sat,  5 Nov 2022 22:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD6CF403C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1fMqhzbjxY2; Sat,  5 Nov 2022 22:13:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87EE940393;
	Sat,  5 Nov 2022 22:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87EE940393
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1D51BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B36A340393
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B36A340393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkU9pRN4QAOz for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:11:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 047C0403C2
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 047C0403C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0288287F3E; Sat,  5 Nov 2022 22:11:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:08:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: db1cf03ac5b6f8e165f953be28d1ce2723c7f3cf
X-Git-Newrev: 3391056553d29c545f9d4a6b742f230da4400328
X-Patchwork-Hint: ignore
Message-Id: <20221105221108.0288287F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-opcua-asyncio:
 bump to version 1.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3391056553d29c545f9d4a6b742f230da4400328
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch to pypi source which should be the same:
https://github.com/FreeOpcUa/opcua-asyncio#installation

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-opcua-asyncio/python-opcua-asyncio.hash | 6 ++++--
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
index d8aee272de..36b16a1596 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -1,3 +1,5 @@
-# Locally computed
-sha256  e5fab37a92162351fe40cab43df09db8a2e9f8b8a2a8f13ed680aa6f6d687ec3  opcua-asyncio-0.8.4.tar.gz
+# md5, sha256 from https://pypi.org/pypi/asyncua/json
+md5  a52df0dc0586abd1592c97a0274d1c9d  asyncua-1.0.0.tar.gz
+sha256  25966e374b0c90da112a96e9dbc5cc36c123b2b60412eac6f26b04a4b0b4d91e  asyncua-1.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index 50b581037b..509beda151 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPCUA_ASYNCIO_VERSION = 0.8.4
-PYTHON_OPCUA_ASYNCIO_SOURCE = opcua-asyncio-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
-PYTHON_OPCUA_ASYNCIO_SITE = $(call github,FreeOpcUa,opcua-asyncio,$(PYTHON_OPCUA_ASYNCIO_VERSION))
+PYTHON_OPCUA_ASYNCIO_VERSION = 1.0.0
+PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
+PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/e7/ea/6fe0799c740b0fc8ffda42fc97bf45204ffe06fe41d505c02654e0d4e379
 PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
