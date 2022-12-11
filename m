Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADA3C64ED9
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 944624F010;
	Mon, 20 Feb 2023 22:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 944624F010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unwUazk1hRA1; Mon, 20 Feb 2023 22:22:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B7AC4F005;
	Mon, 20 Feb 2023 22:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B7AC4F005
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B881A1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8B8261178
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8B8261178
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAXbXaRfVUNh for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1ADD6115B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1ADD6115B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1676828C8; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 101272d1313827f655e247bab740783a7e6dee0f
X-Git-Newrev: b9f06cbbbce135bb149681fa708650a140a12271
X-Patchwork-Hint: ignore
Message-Id: <20230220205202.C1676828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pathspec: bump
 to version 0.10.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9f06cbbbce135bb149681fa708650a140a12271
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pathspec/python-pathspec.hash | 4 ++--
 package/python-pathspec/python-pathspec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathspec/python-pathspec.hash b/package/python-pathspec/python-pathspec.hash
index 91e4fb85b7..5eb76cb5f9 100644
--- a/package/python-pathspec/python-pathspec.hash
+++ b/package/python-pathspec/python-pathspec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathspec/json
-md5  6f4fde5e701d328a2846d206edb63aa9  pathspec-0.10.1.tar.gz
-sha256  7ace6161b621d31e7902eb6b5ae148d12cfd23f4a249b9ffb6b9fee12084323d  pathspec-0.10.1.tar.gz
+md5  d89408b52aff020ac768a14c0ef1c7de  pathspec-0.10.3.tar.gz
+sha256  56200de4077d9d0791465aa9095a01d421861e405b5096955051deefd697d6f6  pathspec-0.10.3.tar.gz
 # Locally computed sha256 checksums
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/python-pathspec/python-pathspec.mk b/package/python-pathspec/python-pathspec.mk
index ccb794cce9..e88bce231f 100644
--- a/package/python-pathspec/python-pathspec.mk
+++ b/package/python-pathspec/python-pathspec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHSPEC_VERSION = 0.10.1
+PYTHON_PATHSPEC_VERSION = 0.10.3
 PYTHON_PATHSPEC_SOURCE = pathspec-$(PYTHON_PATHSPEC_VERSION).tar.gz
-PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/24/9f/a9ae1e6efa11992dba2c4727d94602bd2f6ee5f0dedc29ee2d5d572c20f7
+PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/32/1a/6baf904503c3e943cae9605c9c88a43b964dea5b59785cf956091b341b08
 PYTHON_PATHSPEC_LICENSE = MPL-2.0
 PYTHON_PATHSPEC_LICENSE_FILES = LICENSE
 PYTHON_PATHSPEC_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
