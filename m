Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BD3C4167B
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 13:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 074F941F9C;
	Mon,  6 Nov 2023 13:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 074F941F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cpsbcnAY0s6n; Mon,  6 Nov 2023 13:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2850441F97;
	Mon,  6 Nov 2023 13:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2850441F97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D68141BF954
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC870820C3
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC870820C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id un0ClZZYghv6 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09291820E7
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09291820E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBF5A8690D; Mon,  6 Nov 2023 13:19:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 13:44:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4b2fc9ae8a45cbfbb853706019aa19e467f3ae8
X-Git-Newrev: 80b8602eebd9fe2590979832b78125ee71af74ad
X-Patchwork-Hint: ignore
Message-Id: <20231106131913.EBF5A8690D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-babel: bump to version
 2.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=80b8602eebd9fe2590979832b78125ee71af74ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-babel/python-babel.hash | 4 ++--
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index f2026cafb3..dc48831c44 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5  9ac7d8aac42c17a1e6d922017058d2c8  Babel-2.12.1.tar.gz
-sha256  cc2d99999cd01d44420ae725a21c9e3711b3aadc7976d6147f622d8581963455  Babel-2.12.1.tar.gz
+md5  3162229c2daa7c32674ed26f87b63127  Babel-2.13.1.tar.gz
+sha256  33e0952d7dd6374af8dbf6768cc4ddf3ccfefc244f9986d4074704f2fbd18900  Babel-2.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  908e0ad72053ae27c1d17e3340bd14cff9bf935992ed56526d17c983ab6e7af7  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index 69c38c1a6e..f8d2ccd258 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.12.1
+PYTHON_BABEL_VERSION = 2.13.1
 PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/ba/42/54426ba5d7aeebde9f4aaba9884596eb2fe02b413ad77d62ef0b0422e205
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/aa/6c/737d2345d86741eeb594381394016b9c74c1253b4cbe274bb1e7b5e2138e
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
