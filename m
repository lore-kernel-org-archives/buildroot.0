Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03901C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B32F5419D3;
	Sun,  5 Nov 2023 21:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B32F5419D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3KJKNtvErdLv; Sun,  5 Nov 2023 21:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 068F141962;
	Sun,  5 Nov 2023 21:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 068F141962
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 058C01BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DECA461053
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DECA461053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1cpoVL54MJss for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16A8161050
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16A8161050
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07140868A9; Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 22:01:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc8c3c9317f7caf90c0fe126a967422b4baa1851
X-Git-Newrev: 5874a6e15fcbaf90f63ef6f9b8c2d993eee27f9d
X-Patchwork-Hint: ignore
Message-Id: <20231105211105.07140868A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiomonitor: bump to version
 0.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5874a6e15fcbaf90f63ef6f9b8c2d993eee27f9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new host-python-setuptools-scm build dependency.

License hash changed due to line ending removal:
https://github.com/aio-libs/aiomonitor/commit/9ec9910145c70037da8ab52e007b9fc286c3a4c7

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-aiomonitor/python-aiomonitor.hash | 6 +++---
 package/python-aiomonitor/python-aiomonitor.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-aiomonitor/python-aiomonitor.hash b/package/python-aiomonitor/python-aiomonitor.hash
index 652702c479..b67d68e478 100644
--- a/package/python-aiomonitor/python-aiomonitor.hash
+++ b/package/python-aiomonitor/python-aiomonitor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiomonitor/json
-md5  5f184e4b97ea161fc2d690aef604f997  aiomonitor-0.4.5.tar.gz
-sha256  6232c1ab14bf06cd7217845801c27340032f74e283bdaf32d01cdd3b7c673d0e  aiomonitor-0.4.5.tar.gz
+md5  0f786c8278a68e7df8b24317e7d33271  aiomonitor-0.6.0.tar.gz
+sha256  31d30d1e9c0a23926edba2a2242b8572c6e8639af9aae2692dee863064d27e48  aiomonitor-0.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  9b42fe3a288996988c552e387e7877be7525a1649e62086aedd6b32d3cb56365  LICENSE
+sha256  98397c300949e0cc1ddc68b0e48e67b10f2d0a4ffada4903d891a1315fe04156  LICENSE
diff --git a/package/python-aiomonitor/python-aiomonitor.mk b/package/python-aiomonitor/python-aiomonitor.mk
index a8860097d5..1a3b999b90 100644
--- a/package/python-aiomonitor/python-aiomonitor.mk
+++ b/package/python-aiomonitor/python-aiomonitor.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_AIOMONITOR_VERSION = 0.4.5
+PYTHON_AIOMONITOR_VERSION = 0.6.0
 PYTHON_AIOMONITOR_SOURCE = aiomonitor-$(PYTHON_AIOMONITOR_VERSION).tar.gz
-PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/98/76/b62e9fbe267287527fb6f4b6774394d4f00650195774173bb0055a99ab3d
+PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/13/ab/36fbaf36c1c7cb4d5a81b945faf69e95a48dd38cbc9b57915d41d9445f55
 PYTHON_AIOMONITOR_SETUP_TYPE = setuptools
 PYTHON_AIOMONITOR_LICENSE = Apache-2.0
 PYTHON_AIOMONITOR_LICENSE_FILES = LICENSE
+PYTHON_AIOMONITOR_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
