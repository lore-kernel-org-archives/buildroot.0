Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA44C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C08C607E1;
	Sun, 11 Dec 2022 09:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C08C607E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bh0nHrYj3PRb; Sun, 11 Dec 2022 09:06:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C8D605EC;
	Sun, 11 Dec 2022 09:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73C8D605EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C37671BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE211404F8
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE211404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIFfP6MaRrzT for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CEE7404CF
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CEE7404CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B2EF85FA6; Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:30:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a265441cf91c8accdf0e2bbdc46171335c357ef
X-Git-Newrev: 873ea8bd385ef1b89be0f2753f6968aae6022508
X-Patchwork-Hint: ignore
Message-Id: <20221211085517.2B2EF85FA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-watchdog: bump to version
 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=873ea8bd385ef1b89be0f2753f6968aae6022508
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-watchdog/python-watchdog.hash | 4 ++--
 package/python-watchdog/python-watchdog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 59facb8fea..3bacccf2d6 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  0e60e0a2d3a8c18ba37105f8b44de810  watchdog-2.1.9.tar.gz
-sha256  43ce20ebb36a51f21fa376f76d1d4692452b2527ccd601950d69ed36b9e21609  watchdog-2.1.9.tar.gz
+md5  d029b806814bcba26745c26769a847bc  watchdog-2.2.0.tar.gz
+sha256  83cf8bc60d9c613b66a4c018051873d6273d9e45d040eed06d6a96241bd8ec01  watchdog-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  02c8760f988a76e92a9d6cb525456a86f7b0fd1953870dd491de5955cb974d41  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 71a3f8a0c2..bb9f145e16 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 2.1.9
+PYTHON_WATCHDOG_VERSION = 2.2.0
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/42/f7/da8e889f8626786eac9454e8d2718fc79359ed517be20cdd50c647167d39
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/c3/fb/bd960970258366b0704307ccd12617d64201407bfb6d31ae412d2762ccf1
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
