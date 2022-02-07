Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD01FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 07:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78F6D4039D;
	Mon,  7 Feb 2022 07:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YTn10mwcipLg; Mon,  7 Feb 2022 07:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A50A40278;
	Mon,  7 Feb 2022 07:36:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CA1F1BF995
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F5C2400D8
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lMiRDhKfnuvL for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 07:35:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A701D400E5
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 07:35:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 82C93814A4; Mon,  7 Feb 2022 07:28:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Feb 2022 08:32:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73d427137cc2867f1018261f61cf9c514f50a6fb
X-Git-Newrev: a181757f96bc83bb7ddaafcfb1df9f8f18d4bc0d
X-Patchwork-Hint: ignore
Message-Id: <20220207072828.82C93814A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyusb: bump to version 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a181757f96bc83bb7ddaafcfb1df9f8f18d4bc0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/pyusb/pyusb/releases/tag/v1.2.0
https://github.com/pyusb/pyusb/releases/tag/v1.2.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyusb/python-pyusb.hash | 8 ++++----
 package/python-pyusb/python-pyusb.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pyusb/python-pyusb.hash b/package/python-pyusb/python-pyusb.hash
index 9c634ef722..f08b212b3e 100644
--- a/package/python-pyusb/python-pyusb.hash
+++ b/package/python-pyusb/python-pyusb.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pyusb/json
-md5     a9db479f1fb914e91d3106e67a13ae09 pyusb-1.1.1.tar.gz
-# Locally computed
-sha256  7d449ad916ce58aff60b89aae0b65ac130f289c24d6a5b7b317742eccffafc38  pyusb-1.1.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyusb/json
+md5  880008dff32dac8f58076b4e534492d9  pyusb-1.2.1.tar.gz
+sha256  a4cc7404a203144754164b8b40994e2849fde1cfff06b08492f12fff9d9de7b9  pyusb-1.2.1.tar.gz
+# Locally computed sha256 checksums
 sha256  03e39fdcee9c18f2f9d0c3500a993ddeac050695eb81070ea41347587c76a7fe  LICENSE
diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
index dc81efde9e..2f4f9581b6 100644
--- a/package/python-pyusb/python-pyusb.mk
+++ b/package/python-pyusb/python-pyusb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUSB_VERSION = 1.1.1
+PYTHON_PYUSB_VERSION = 1.2.1
 PYTHON_PYUSB_SOURCE = pyusb-$(PYTHON_PYUSB_VERSION).tar.gz
-PYTHON_PYUSB_SITE = https://files.pythonhosted.org/packages/b9/8d/25c4e446a07e918eb39b5af25c4a83a89db95ae44e4ed5a46c3c53b0a4d6
+PYTHON_PYUSB_SITE = https://files.pythonhosted.org/packages/d9/6e/433a5614132576289b8643fe598dd5d51b16e130fd591564be952e15bb45
 PYTHON_PYUSB_LICENSE = BSD-3-Clause
 PYTHON_PYUSB_LICENSE_FILES = LICENSE
 PYTHON_PYUSB_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
