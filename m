Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C2DC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 877F660D95;
	Mon,  5 Dec 2022 11:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 877F660D95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BwmrPOC5vhwy; Mon,  5 Dec 2022 11:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B673D60DFE;
	Mon,  5 Dec 2022 11:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B673D60DFE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD901BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B75441621
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B75441621
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jGqHBosz-vaw for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E381415ED
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E381415ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E6EC85BA3; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:05:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ebc97276599074948df6aa37d78b901d3c67dc1
X-Git-Newrev: 619bbe3e3745955e1abdd95748b6b30859815bf4
X-Patchwork-Hint: ignore
Message-Id: <20221205112606.5E6EC85BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-watchdog: bump to version
 2.1.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=619bbe3e3745955e1abdd95748b6b30859815bf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-watchdog/python-watchdog.hash | 4 ++--
 package/python-watchdog/python-watchdog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 3b633f9156..59facb8fea 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  6aac660b0f3358c63658806a0579b832  watchdog-2.1.6.tar.gz
-sha256  a36e75df6c767cbf46f61a91c70b3ba71811dfa0aca4a324d9407a06a8b7a2e7  watchdog-2.1.6.tar.gz
+md5  0e60e0a2d3a8c18ba37105f8b44de810  watchdog-2.1.9.tar.gz
+sha256  43ce20ebb36a51f21fa376f76d1d4692452b2527ccd601950d69ed36b9e21609  watchdog-2.1.9.tar.gz
 # Locally computed sha256 checksums
 sha256  02c8760f988a76e92a9d6cb525456a86f7b0fd1953870dd491de5955cb974d41  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 2dafef97e1..71a3f8a0c2 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 2.1.6
+PYTHON_WATCHDOG_VERSION = 2.1.9
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/e8/a8/fc4edd7d768361b00ea850e5310211d157df6b5a1db6148dd434e787d898
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/42/f7/da8e889f8626786eac9454e8d2718fc79359ed517be20cdd50c647167d39
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
