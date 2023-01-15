Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEA5C46467
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3162682012;
	Sun, 15 Jan 2023 11:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3162682012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O_de4cZCB-Lt; Sun, 15 Jan 2023 11:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62B4C81F1A;
	Sun, 15 Jan 2023 11:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62B4C81F1A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA2FA1BF86C
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA04F60D91
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA04F60D91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ToGxG521d8l for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:19:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2983260E5F
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2983260E5F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17C637FE21; Sun, 15 Jan 2023 11:19:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:15:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 208bf69626d25761f6e502b967b6d8ecf7d5df00
X-Git-Newrev: 1b6a466ea306d0e760b35fe84330d7f57a3a624b
X-Patchwork-Hint: ignore
Message-Id: <20230115111943.17C637FE21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyrsistent: bump to version
 0.19.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b6a466ea306d0e760b35fe84330d7f57a3a624b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pyrsistent/python-pyrsistent.hash | 4 ++--
 package/python-pyrsistent/python-pyrsistent.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyrsistent/python-pyrsistent.hash b/package/python-pyrsistent/python-pyrsistent.hash
index bb55c7135d..d5c9a22656 100644
--- a/package/python-pyrsistent/python-pyrsistent.hash
+++ b/package/python-pyrsistent/python-pyrsistent.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyrsistent/json
-md5  23da81256b8817e123568a858bf78997  pyrsistent-0.19.2.tar.gz
-sha256  bfa0351be89c9fcbcb8c9879b826f4353be10f58f8a677efab0c017bf7137ec2  pyrsistent-0.19.2.tar.gz
+md5  761266eab1f9dc9280cdb0a6d2dedb08  pyrsistent-0.19.3.tar.gz
+sha256  1a2994773706bbb4995c31a97bc94f1418314923bd1048c6d964837040376440  pyrsistent-0.19.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3ea56753cbd0cc897d3f4414a902f5694991db7c1b3abb8230216381185f9112  LICENSE.mit
diff --git a/package/python-pyrsistent/python-pyrsistent.mk b/package/python-pyrsistent/python-pyrsistent.mk
index 6a5ac30a15..f3457feebe 100644
--- a/package/python-pyrsistent/python-pyrsistent.mk
+++ b/package/python-pyrsistent/python-pyrsistent.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYRSISTENT_VERSION = 0.19.2
+PYTHON_PYRSISTENT_VERSION = 0.19.3
 PYTHON_PYRSISTENT_SOURCE = pyrsistent-$(PYTHON_PYRSISTENT_VERSION).tar.gz
-PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/b8/ef/325da441a385a8a931b3eeb70db23cb52da42799691988d8d943c5237f10
+PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/bf/90/445a7dbd275c654c268f47fa9452152709134f61f09605cf776407055a89
 PYTHON_PYRSISTENT_SETUP_TYPE = setuptools
 PYTHON_PYRSISTENT_LICENSE = MIT
 PYTHON_PYRSISTENT_LICENSE_FILES = LICENSE.mit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
