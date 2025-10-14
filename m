Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82E9CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA5F6131B;
	Tue, 14 Oct 2025 18:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6aKZY84tWaa; Tue, 14 Oct 2025 18:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCB2461347
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCB2461347;
	Tue, 14 Oct 2025 18:46:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F378BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12813612FE
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUDGHsmRT8zn for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5221061306
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5221061306
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50A9B870E7; Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:44:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9d699def28946a8a3d8e4d3eb78576c12c87f53
X-Git-Newrev: f53d6a83a9f7f0167a5b92646be741c963afb84a
X-Patchwork-Hint: ignore
Message-Id: <20251014184551.50A9B870E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-decorator: bump version to
 5.2.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f53d6a83a9f7f0167a5b92646be741c963afb84a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/micheles/decorator/blob/5.2.1/CHANGES.md

Updated license hash due to copyright year bump:
https://github.com/micheles/decorator/commit/eac33cb79fd1ba2200c4e59408d6a492511feb24

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-decorator/python-decorator.hash | 6 +++---
 package/python-decorator/python-decorator.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-decorator/python-decorator.hash b/package/python-decorator/python-decorator.hash
index e12d34e7ed..5980427454 100644
--- a/package/python-decorator/python-decorator.hash
+++ b/package/python-decorator/python-decorator.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/decorator/json
-md5  a6b34700dcac8a4bb04efd55e99626c1  decorator-5.1.1.tar.gz
-sha256  637996211036b6385ef91435e4fae22989472f9d571faba8927ba8253acbc330  decorator-5.1.1.tar.gz
+md5  984649ae1fd174f9a82369e7c9cc56e6  decorator-5.2.1.tar.gz
+sha256  65f266143752f734b0a7cc83c46f4618af75b8c5911b00ccb61d0ac9b6da0360  decorator-5.2.1.tar.gz
 # Locally computed sha256 checksums
-sha256  fd11660cabf0532082c45706862fafc294907ec7f8e217818240a4999806782e  LICENSE.txt
+sha256  914ee6ed78a5efc173bda698f2708444ca9d140fcc4080c60d0503d40db39da6  LICENSE.txt
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index 5dba8cc915..d08696e773 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DECORATOR_VERSION = 5.1.1
+PYTHON_DECORATOR_VERSION = 5.2.1
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
-PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/66/0c/8d907af351aa16b42caae42f9d6aa37b900c67308052d10fdce809f8d952
+PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/43/fa/6d96a0978d19e17b68d634497769987b16c8f4cd0a7a05048bec693caa6b
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON_DECORATOR_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
