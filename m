Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB0ACF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C7CA8174A;
	Sun, 22 Sep 2024 10:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tB9rflKPrDd; Sun, 22 Sep 2024 10:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D860481826
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D860481826;
	Sun, 22 Sep 2024 10:35:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1556D1BF870
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A00916061F
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmGh5X3Y4R0X for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D43AE6069A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D43AE6069A
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C27BD8230F; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:37:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3ee69d37d95e5e4d8ee4d0a93741d14fa2dc4ae
X-Git-Newrev: 9054ed94d4b6740ad9076cb2cfeb8f4142d45759
X-Patchwork-Hint: ignore
Message-Id: <20240922103440.C27BD8230F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sympy: bump to version
 1.13.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9054ed94d4b6740ad9076cb2cfeb8f4142d45759
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-sympy/python-sympy.hash | 4 ++--
 package/python-sympy/python-sympy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sympy/python-sympy.hash b/package/python-sympy/python-sympy.hash
index 947edfd4e0..09cb0bfd71 100644
--- a/package/python-sympy/python-sympy.hash
+++ b/package/python-sympy/python-sympy.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/sympy/json
-md5  3e0033109352d7303ea97b9216e16645  sympy-1.12.tar.gz
-sha256  ebf595c8dac3e0fdc4152c51878b498396ec7f30e7a914d6071e674d49420fb8  sympy-1.12.tar.gz
+md5  0902c1a6a7399c8a5ed1bbe95d559c10  sympy-1.13.3.tar.gz
+sha256  b27fd2c6530e0ab39e275fc9b683895367e51d5da91baa8d3d64db2565fec4d9  sympy-1.13.3.tar.gz
 # Locally computed sha256 checksums
 sha256  07a5e9819f727b4986ad2829c7a29a6320d42575f720eb24d71b7fef573a0286  LICENSE
 sha256  596639d3681fdb67bb2f05a9fcd2503d88bc549471a89b2e500cd9759ae2a3fa  data/TeXmacs/LICENSE
diff --git a/package/python-sympy/python-sympy.mk b/package/python-sympy/python-sympy.mk
index 0f160649ad..246da3b219 100644
--- a/package/python-sympy/python-sympy.mk
+++ b/package/python-sympy/python-sympy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SYMPY_VERSION = 1.12
+PYTHON_SYMPY_VERSION = 1.13.3
 PYTHON_SYMPY_SOURCE = sympy-$(PYTHON_SYMPY_VERSION).tar.gz
-PYTHON_SYMPY_SITE = https://github.com/sympy/sympy/releases/download/sympy-$(PYTHON_SYMPY_VERSION)
+PYTHON_SYMPY_SITE = https://files.pythonhosted.org/packages/11/8a/5a7fd6284fa8caac23a26c9ddf9c30485a48169344b4bd3b0f02fef1890f
 PYTHON_SYMPY_SETUP_TYPE = setuptools
 PYTHON_SYMPY_LICENSE = BSD-3-Clause
 PYTHON_SYMPY_LICENSE_FILES = LICENSE data/TeXmacs/LICENSE sympy/parsing/latex/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
