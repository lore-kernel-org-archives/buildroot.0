Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC47C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52468403CA;
	Tue, 25 Jan 2022 18:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id otmLM0ZmpaDS; Tue, 25 Jan 2022 18:35:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D97AC40474;
	Tue, 25 Jan 2022 18:35:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 476231BF301
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F52760B3A
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RXYTWodFW38N for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:34:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C995B60706
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:34:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D9966827E7; Tue, 25 Jan 2022 18:27:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:20:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4211a933a3f9762b2816c372f7aa2ca5e92db32d
X-Git-Newrev: 4a5fd47c1eed1a350b7c24b16ba8c56fa5129846
X-Patchwork-Hint: ignore
Message-Id: <20220125182726.D9966827E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pathlib2: bump to version
 2.3.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a5fd47c1eed1a350b7c24b16ba8c56fa5129846
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of LICENSE.rst (LF replaced by CRLF)
- Update indentation in hash file (two spaces)

https://github.com/jazzband/pathlib2/blob/2.3.6/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pathlib2/python-pathlib2.hash | 6 +++---
 package/python-pathlib2/python-pathlib2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pathlib2/python-pathlib2.hash b/package/python-pathlib2/python-pathlib2.hash
index 986049d9de..ebd197b62e 100644
--- a/package/python-pathlib2/python-pathlib2.hash
+++ b/package/python-pathlib2/python-pathlib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathlib2/json
-md5	f2bd0a363eb0f8fa0556f35c1d9e66fb  pathlib2-2.3.5.tar.gz
-sha256	6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868  pathlib2-2.3.5.tar.gz
+md5  e50a0cf94e406c5110b3aed535626e9e  pathlib2-2.3.6.tar.gz
+sha256  7d8bcb5555003cdf4a8d2872c538faa3a0f5d20630cb360e518ca3b981795e5f  pathlib2-2.3.6.tar.gz
 # Locally computed sha256 checksums
-sha256	f8e02f1a07e4c6fc59a4bee831ddde26b97064105c423b9e24340f35aaa80262  LICENSE.rst
+sha256  861f813004a151ac77024ad445794653809ddf8a7572aee7bab18d11df2ba1c6  LICENSE.rst
diff --git a/package/python-pathlib2/python-pathlib2.mk b/package/python-pathlib2/python-pathlib2.mk
index d813b77d7e..4bcfea78fb 100644
--- a/package/python-pathlib2/python-pathlib2.mk
+++ b/package/python-pathlib2/python-pathlib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHLIB2_VERSION = 2.3.5
+PYTHON_PATHLIB2_VERSION = 2.3.6
 PYTHON_PATHLIB2_SOURCE = pathlib2-$(PYTHON_PATHLIB2_VERSION).tar.gz
-PYTHON_PATHLIB2_SITE = https://files.pythonhosted.org/packages/94/d8/65c86584e7e97ef824a1845c72bbe95d79f5b306364fa778a3c3e401b309
+PYTHON_PATHLIB2_SITE = https://files.pythonhosted.org/packages/df/16/e9d6bcf1aed52a55bc1696324ab22586716053b3e97b85266e0f3ad36bae
 PYTHON_PATHLIB2_LICENSE = MIT
 PYTHON_PATHLIB2_LICENSE_FILES = LICENSE.rst
 PYTHON_PATHLIB2_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
