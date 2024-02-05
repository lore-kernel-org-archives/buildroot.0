Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A4CC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1A7641568;
	Mon,  5 Feb 2024 10:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1A7641568
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0EiI59o2ls8p; Mon,  5 Feb 2024 10:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F17EB4159D;
	Mon,  5 Feb 2024 10:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F17EB4159D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23EC31BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0DFF60F72
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0DFF60F72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rq-AarEGOGV9 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:17:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33E4C60F5D
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33E4C60F5D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2390F86A14; Mon,  5 Feb 2024 10:17:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:15:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c80a1b9f19b8cb7c40aa0f9b34a2b9214d2451d
X-Git-Newrev: 6925d696c1fdd89e2e86fca5ae70dc36c3b11d0a
X-Patchwork-Hint: ignore
Message-Id: <20240205101722.2390F86A14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyrsistent: bump to version
 0.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6925d696c1fdd89e2e86fca5ae70dc36c3b11d0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/tobgu/pyrsistent/commit/acdffe6967a821165155ac16bee48054fd61385a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pyrsistent/python-pyrsistent.hash | 6 +++---
 package/python-pyrsistent/python-pyrsistent.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyrsistent/python-pyrsistent.hash b/package/python-pyrsistent/python-pyrsistent.hash
index d5c9a22656..780a7f09d9 100644
--- a/package/python-pyrsistent/python-pyrsistent.hash
+++ b/package/python-pyrsistent/python-pyrsistent.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyrsistent/json
-md5  761266eab1f9dc9280cdb0a6d2dedb08  pyrsistent-0.19.3.tar.gz
-sha256  1a2994773706bbb4995c31a97bc94f1418314923bd1048c6d964837040376440  pyrsistent-0.19.3.tar.gz
+md5  dce0f9a13668dbf8bb76f74954b4a42a  pyrsistent-0.20.0.tar.gz
+sha256  4c48f78f62ab596c679086084d0dd13254ae4f3d6c72a83ffdf5ebdef8f265a4  pyrsistent-0.20.0.tar.gz
 # Locally computed sha256 checksums
-sha256  3ea56753cbd0cc897d3f4414a902f5694991db7c1b3abb8230216381185f9112  LICENSE.mit
+sha256  3fd3d3d1ab9c733ee453fbf3bbbaa845440d0d8c20d7b5a039d2e46a2ed7fc01  LICENSE.mit
diff --git a/package/python-pyrsistent/python-pyrsistent.mk b/package/python-pyrsistent/python-pyrsistent.mk
index f3457feebe..6c52d7dbc8 100644
--- a/package/python-pyrsistent/python-pyrsistent.mk
+++ b/package/python-pyrsistent/python-pyrsistent.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYRSISTENT_VERSION = 0.19.3
+PYTHON_PYRSISTENT_VERSION = 0.20.0
 PYTHON_PYRSISTENT_SOURCE = pyrsistent-$(PYTHON_PYRSISTENT_VERSION).tar.gz
-PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/bf/90/445a7dbd275c654c268f47fa9452152709134f61f09605cf776407055a89
+PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/ce/3a/5031723c09068e9c8c2f0bc25c3a9245f2b1d1aea8396c787a408f2b95ca
 PYTHON_PYRSISTENT_SETUP_TYPE = setuptools
 PYTHON_PYRSISTENT_LICENSE = MIT
 PYTHON_PYRSISTENT_LICENSE_FILES = LICENSE.mit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
