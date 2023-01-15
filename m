Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA66C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54BD760A9F;
	Sun, 15 Jan 2023 11:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54BD760A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SvLJExhjfpkU; Sun, 15 Jan 2023 11:09:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 839BE60DB7;
	Sun, 15 Jan 2023 11:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 839BE60DB7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 097C31BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3F9B81EEF
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3F9B81EEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vGUTqNSQbppE for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA49181F0B
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA49181F0B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D40B7870D1; Sun, 15 Jan 2023 11:06:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:00:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2abc0d6a3809eaa9c71043368b3915572f5d0735
X-Git-Newrev: 7be2ff33abdd049dc3670c5a6e2e385c1fba6f41
X-Patchwork-Hint: ignore
Message-Id: <20230115110627.D40B7870D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-canopen: bump to version
 2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7be2ff33abdd049dc3670c5a6e2e385c1fba6f41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Verified license remains MIT after hash changed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-canopen/python-canopen.hash | 6 +++---
 package/python-canopen/python-canopen.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-canopen/python-canopen.hash b/package/python-canopen/python-canopen.hash
index 610dca3f34..e6485e72f0 100644
--- a/package/python-canopen/python-canopen.hash
+++ b/package/python-canopen/python-canopen.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/canopen/json
-md5  0719b73bd8ccaeaa9fb758c5338fd030  canopen-2.0.0.tar.gz
-sha256  bcc8aa9ea83f7ada5da0dade81038977be52a93802c2657649729eb1f82065d9  canopen-2.0.0.tar.gz
+md5  d51443bdc8a55faea63c9da82196dd47  canopen-2.1.0.tar.gz
+sha256  bc126bb1dcb62e3b34d8a12e38a07b5aa8319c17457c9bfe208f0bbbda90ff61  canopen-2.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  0740d30978affcd91c0fc817b7cf942a332381bf0380fe17e60c6a0b377c6e0d  LICENSE.txt
+sha256  d9035caf7b8b135899da92a2730e2ac2e9f5ae3220dc98bd661be18045fcf689  LICENSE.txt
diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
index bd0a3bfba7..a0f5220ded 100644
--- a/package/python-canopen/python-canopen.mk
+++ b/package/python-canopen/python-canopen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CANOPEN_VERSION = 2.0.0
+PYTHON_CANOPEN_VERSION = 2.1.0
 PYTHON_CANOPEN_SOURCE = canopen-$(PYTHON_CANOPEN_VERSION).tar.gz
-PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/9e/d6/6ced4b410b904aeee5f7d0227187eae95a5ad769f01014a74fc0e016845e
+PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/29/d1/54462c949c384b1a9a2bd260143a8ec6f4259a18d119bd122e8f8a791b50
 PYTHON_CANOPEN_SETUP_TYPE = setuptools
 PYTHON_CANOPEN_LICENSE = MIT
 PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
