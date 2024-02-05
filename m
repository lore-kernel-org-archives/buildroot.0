Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB50AC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5D9C60F2F;
	Mon,  5 Feb 2024 13:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5D9C60F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4fFobPd8F_3L; Mon,  5 Feb 2024 13:29:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 097E760F0A;
	Mon,  5 Feb 2024 13:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 097E760F0A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5321BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7F2941706
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7F2941706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HKDzpf7LBV6J for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28796417E3
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28796417E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2604186C7A; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 14:28:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7dd37e75386d40e837619189ff2799643dbc21ae
X-Git-Newrev: 2af4afbda22b974b8c75abb6ba96b2e3e122e972
X-Patchwork-Hint: ignore
Message-Id: <20240205132915.2604186C7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-babel: bump to version
 2.14.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2af4afbda22b974b8c75abb6ba96b2e3e122e972
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-babel/python-babel.hash | 4 ++--
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index dc48831c44..ab4e022564 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5  3162229c2daa7c32674ed26f87b63127  Babel-2.13.1.tar.gz
-sha256  33e0952d7dd6374af8dbf6768cc4ddf3ccfefc244f9986d4074704f2fbd18900  Babel-2.13.1.tar.gz
+md5  3bec3f4c842144c15d839bdde41a44d4  Babel-2.14.0.tar.gz
+sha256  6919867db036398ba21eb5c7a0f6b28ab8cbc3ae7a73a44ebe34ae74a4e7d363  Babel-2.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  908e0ad72053ae27c1d17e3340bd14cff9bf935992ed56526d17c983ab6e7af7  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index f8d2ccd258..eb39b9aef7 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.13.1
+PYTHON_BABEL_VERSION = 2.14.0
 PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/aa/6c/737d2345d86741eeb594381394016b9c74c1253b4cbe274bb1e7b5e2138e
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/e2/80/cfbe44a9085d112e983282ee7ca4c00429bc4d1ce86ee5f4e60259ddff7f
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
