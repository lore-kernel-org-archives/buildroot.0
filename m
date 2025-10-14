Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12808CCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 22:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D8961118;
	Tue, 14 Oct 2025 22:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F01lSRVfUE93; Tue, 14 Oct 2025 22:00:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E071061300
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E071061300;
	Tue, 14 Oct 2025 22:00:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84A654C4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65322405EA
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90xASE2y6EWU for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 880E540643
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 880E540643
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 864A387100; Tue, 14 Oct 2025 22:00:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 23:58:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 900a8c53578d8eae203db0fb23f58c06ab6bf3bd
X-Git-Newrev: 74a37a7d0b1ef7f7ba95c2c18e2af7bc32da2f33
X-Patchwork-Hint: ignore
Message-Id: <20251014220001.864A387100@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyftpdlib: bump version to
 2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=74a37a7d0b1ef7f7ba95c2c18e2af7bc32da2f33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyftpdlib/python-pyftpdlib.hash | 4 ++--
 package/python-pyftpdlib/python-pyftpdlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
index a463e98d7f..6c15528bf7 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.hash
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyftpdlib/json
-md5  16bbc0f0e06964a7da16e88de5f38e20  pyftpdlib-2.0.1.tar.gz
-sha256  ef0d172a82bfae10e2dec222e87533514609d41bf4b0fd0f07e29d4380fb96bf  pyftpdlib-2.0.1.tar.gz
+md5  68632ce84491dfc2d2a4cc1426fd4d14  pyftpdlib-2.1.0.tar.gz
+sha256  5e92e7ba37c3e458ec458e5c201e2deb992cb6011c963e6a8512a634d8d80116  pyftpdlib-2.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  67a832551570a5ac5f7901eaa5ece4b9491fda7f2d8c93957c3bbc68a5a76d88  LICENSE
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index 85be95da57..337d979503 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYFTPDLIB_VERSION = 2.0.1
+PYTHON_PYFTPDLIB_VERSION = 2.1.0
 PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
-PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/b4/0c/32bf0a7c88efe147bc3bc6586216d92269d196c59f149b05efa973834946
+PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/fc/67/3299ce20585601d21e05153eb9275cb799ae408fe15ab93e48e4582ea9fe
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
