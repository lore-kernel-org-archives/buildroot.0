Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847B4CCD18E
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 22:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52D4761352;
	Tue, 14 Oct 2025 22:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xdi0kM9Yrb-T; Tue, 14 Oct 2025 22:00:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62DB461324
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62DB461324;
	Tue, 14 Oct 2025 22:00:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 796D44C4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81A2040724
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKQnxd7i30Zr for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 22:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A12B44078F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A12B44078F
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F702870FC; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 23:58:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b8b9f0486187cf8ad27dff216177df069624a13
X-Git-Newrev: 400cbb1f480cf5a44aca678b6959f53f89c12540
X-Patchwork-Hint: ignore
Message-Id: <20251014220002.9F702870FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sympy: bump version to
 1.14.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=400cbb1f480cf5a44aca678b6959f53f89c12540
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sympy/python-sympy.hash | 4 ++--
 package/python-sympy/python-sympy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sympy/python-sympy.hash b/package/python-sympy/python-sympy.hash
index 09cb0bfd71..efd09d7196 100644
--- a/package/python-sympy/python-sympy.hash
+++ b/package/python-sympy/python-sympy.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/sympy/json
-md5  0902c1a6a7399c8a5ed1bbe95d559c10  sympy-1.13.3.tar.gz
-sha256  b27fd2c6530e0ab39e275fc9b683895367e51d5da91baa8d3d64db2565fec4d9  sympy-1.13.3.tar.gz
+md5  9872deb5bd7816dfbc89bec086b9e522  sympy-1.14.0.tar.gz
+sha256  d3d3fe8df1e5a0b42f0e7bdf50541697dbe7d23746e894990c030e2b05e72517  sympy-1.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  07a5e9819f727b4986ad2829c7a29a6320d42575f720eb24d71b7fef573a0286  LICENSE
 sha256  596639d3681fdb67bb2f05a9fcd2503d88bc549471a89b2e500cd9759ae2a3fa  data/TeXmacs/LICENSE
diff --git a/package/python-sympy/python-sympy.mk b/package/python-sympy/python-sympy.mk
index 246da3b219..817b56ddee 100644
--- a/package/python-sympy/python-sympy.mk
+++ b/package/python-sympy/python-sympy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SYMPY_VERSION = 1.13.3
+PYTHON_SYMPY_VERSION = 1.14.0
 PYTHON_SYMPY_SOURCE = sympy-$(PYTHON_SYMPY_VERSION).tar.gz
-PYTHON_SYMPY_SITE = https://files.pythonhosted.org/packages/11/8a/5a7fd6284fa8caac23a26c9ddf9c30485a48169344b4bd3b0f02fef1890f
+PYTHON_SYMPY_SITE = https://files.pythonhosted.org/packages/83/d3/803453b36afefb7c2bb238361cd4ae6125a569b4db67cd9e79846ba2d68c
 PYTHON_SYMPY_SETUP_TYPE = setuptools
 PYTHON_SYMPY_LICENSE = BSD-3-Clause
 PYTHON_SYMPY_LICENSE_FILES = LICENSE data/TeXmacs/LICENSE sympy/parsing/latex/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
