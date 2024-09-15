Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7008BC3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F572815AB;
	Sun, 15 Sep 2024 21:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVAFDlWgKaUd; Sun, 15 Sep 2024 21:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29BE981393
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29BE981393;
	Sun, 15 Sep 2024 21:38:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6891BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E07980C66
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OcdRqc9_DUjC for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 349C680837
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 349C680837
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31EDE83685; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b83df84600a68f18fe5540a3b8a4b2641a4395f
X-Git-Newrev: c9fd1ca67629a5076403765547993bd21a8b06c3
X-Patchwork-Hint: ignore
Message-Id: <20240915213639.31EDE83685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-docutils: bump to version
 0.21.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c9fd1ca67629a5076403765547993bd21a8b06c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python-2.0 license replaced with ZPL-2.1 license:
https://sourceforge.net/p/docutils/code/9398/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-docutils/python-docutils.hash | 6 +++---
 package/python-docutils/python-docutils.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index 2386cc2891..f79d418efa 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docutils/json
-md5  93bcfe0065cf1d0b6a0bcabeca7a2335  docutils-0.20.1.tar.gz
-sha256  f08a4e276c3a1583a86dce3e34aba3fe04d02bba2dd51ed16106244e8a923e3b  docutils-0.20.1.tar.gz
+md5  c4064e1e0e3cd142951fd2b95b830874  docutils-0.21.2.tar.gz
+sha256  3a6b18732edf182daa3cd12775bbb338cf5691468f91eeeb109deff6ebfa986f  docutils-0.21.2.tar.gz
 # Locally computed sha256 checksums
-sha256  a0d7ee761e8d757c0b904518514f98233fd94f2398da3703130d15142ca47a77  COPYING.txt
+sha256  534edf7641abde69fc500f228c09751812c0589815eef0c082bc6ba317d646ac  COPYING.txt
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 2b496f0d46..1f1e043c15 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.20.1
+PYTHON_DOCUTILS_VERSION = 0.21.2
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/1f/53/a5da4f2c5739cf66290fac1431ee52aff6851c7c8ffd8264f13affd7bcdd
-PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, Python-2.0, GPL-3.0+ (emacs mode)
+PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/ae/ed/aefcc8cd0ba62a0560c3c18c33925362d46c6075480bfa4df87b28e169a9
+PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, ZPL-2.1, GPL-3.0+ (emacs mode)
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
-PYTHON_DOCUTILS_SETUP_TYPE = setuptools
+PYTHON_DOCUTILS_SETUP_TYPE = flit
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
