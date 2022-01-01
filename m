Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D454C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 09:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7869813DF;
	Sat,  1 Jan 2022 09:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3-epJYGRBrcH; Sat,  1 Jan 2022 09:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EEE081397;
	Sat,  1 Jan 2022 09:55:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 547871BF5A8
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A2DD81374
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SfW_7jA8RW-j for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9994C813DF
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 87DAD813B7; Sat,  1 Jan 2022 09:48:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 10:50:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd3550f17948240f3fb80be93511304e73ec0f33
X-Git-Newrev: a27ad5ca247835de0fc10a1583b6c2bb1a6648e5
X-Patchwork-Hint: ignore
Message-Id: <20220101094828.87DAD813B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-async-timeout: bump to
 version 4.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a27ad5ca247835de0fc10a1583b6c2bb1a6648e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-async-timeout/python-async-timeout.hash | 4 ++--
 package/python-async-timeout/python-async-timeout.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-async-timeout/python-async-timeout.hash b/package/python-async-timeout/python-async-timeout.hash
index 1a64c3a77d..0ecf1ef5ae 100644
--- a/package/python-async-timeout/python-async-timeout.hash
+++ b/package/python-async-timeout/python-async-timeout.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-timeout/json
-md5  2871f3853060ac7e76e6278b85dfb3c9  async-timeout-4.0.0.tar.gz
-sha256  7d87a4e8adba8ededb52e579ce6bc8276985888913620c935094c2276fd83382  async-timeout-4.0.0.tar.gz
+md5  10571272b2e0fab839ec23f8293bf482  async-timeout-4.0.2.tar.gz
+sha256  2163e1640ddb52b7a8c80d0a67a08587e5d245cc9c553a74a847056bc2976b15  async-timeout-4.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  e18d7bb8f513e2c46bb585c94b585bd30720dd3ccb21ddb0786f72d16658f92c  LICENSE
diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
index 1d2c716fa9..b3c5f79e45 100644
--- a/package/python-async-timeout/python-async-timeout.mk
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_TIMEOUT_VERSION = 4.0.0
+PYTHON_ASYNC_TIMEOUT_VERSION = 4.0.2
 PYTHON_ASYNC_TIMEOUT_SOURCE = async-timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
-PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/28/0c/1cd218ea84964f0740a3ab6152dfa99661174abdd8e4053e06c0285ac42a
+PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/54/6e/9678f7b2993537452710ffb1750c62d2c26df438aa621ad5fa9d1507a43a
 PYTHON_ASYNC_TIMEOUT_LICENSE = Apache-2.0
 PYTHON_ASYNC_TIMEOUT_LICENSE_FILES = LICENSE
 PYTHON_ASYNC_TIMEOUT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
