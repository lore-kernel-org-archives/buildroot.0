Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C448C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D512F818E8;
	Sun, 13 Mar 2022 09:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jdWU1nxEIAaq; Sun, 13 Mar 2022 09:12:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E649C818CA;
	Sun, 13 Mar 2022 09:12:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF721BF2A6
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5FC540997
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qyrJ6NbXzMSq for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:11:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC58B40992
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:11:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A3C3A83C77; Sun, 13 Mar 2022 09:02:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 10:10:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2957f5ce743cfaf4fb3aaa98d619e83e8e6989e
X-Git-Newrev: 23b555a6ccfb80eb3d6065df753986c60b99a7a0
X-Patchwork-Hint: ignore
Message-Id: <20220313090240.A3C3A83C77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flit-core: bump to version
 3.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=23b555a6ccfb80eb3d6065df753986c60b99a7a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-flit-core/python-flit-core.hash | 4 ++--
 package/python-flit-core/python-flit-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
index bd47fd4f6b..135be93660 100644
--- a/package/python-flit-core/python-flit-core.hash
+++ b/package/python-flit-core/python-flit-core.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flit_core/json
-md5  82143536b81f148851a0213305838e53  flit_core-3.6.0.tar.gz
-sha256  5892962ab8b8ea945835b3a288fe9dd69316f1903d5288c3f5cafdcdd04756ad  flit_core-3.6.0.tar.gz
+md5  4a4791e97f3a8c9a1645064a35636ee6  flit_core-3.7.1.tar.gz
+sha256  14955af340c43035dbfa96b5ee47407e377ee337f69e70f73064940d27d0a44f  flit_core-3.7.1.tar.gz
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index 8971223d1f..0e058a1f17 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLIT_CORE_VERSION = 3.6.0
+PYTHON_FLIT_CORE_VERSION = 3.7.1
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
-PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/08/e9/0653f7783ba2ec2f954f19442878427f1d5bfccb01842d354453c2809b22
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/15/d1/d8798b83e953fd6f86ca9b50f93eec464a9305b0661469c8234e61095481
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
 PYTHON_FLIT_CORE_SETUP_TYPE = pep517
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
