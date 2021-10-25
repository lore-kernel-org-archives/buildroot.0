Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D35FC433FE
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:17:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E675C610C7
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E675C610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FADF40288;
	Mon, 25 Oct 2021 19:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwCSll_vDOSM; Mon, 25 Oct 2021 19:17:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5B17403C6;
	Mon, 25 Oct 2021 19:17:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 625A21BF983
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 519A060892
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xv6xJl1wpDol for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:16:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DE6060774
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:16:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 16C54887EB; Mon, 25 Oct 2021 19:13:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 21:11:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8db775229b033f25661433fbc7c59d66ec2798b7
X-Git-Newrev: a1f7597b4dcd60e8373040739d7abbc0f45dd5f5
X-Patchwork-Hint: ignore
Message-Id: <20211025191322.16C54887EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-watchdog: bump to version
 2.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1f7597b4dcd60e8373040739d7abbc0f45dd5f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

COPYING got "and contributors" added to authors.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-watchdog/python-watchdog.hash | 11 +++++------
 package/python-watchdog/python-watchdog.mk   |  4 ++--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 701c7991a5..3b633f9156 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,7 +1,6 @@
-# md5, sha256 from https://pypi.python.org/pypi/watchdog/json
-md5	7cdc103f607e72fc32c206301a72d1b2  watchdog-0.9.0.tar.gz
-sha256	965f658d0732de3188211932aeb0bb457587f04f63ab4c1e33eab878e9de961d  watchdog-0.9.0.tar.gz
-
-# Hash for license files
-sha256  14e636faf5889138a1bb7a8498ccbb0266aee31d2dc475201a10448e56ed3d96  COPYING
+# md5, sha256 from https://pypi.org/pypi/watchdog/json
+md5  6aac660b0f3358c63658806a0579b832  watchdog-2.1.6.tar.gz
+sha256  a36e75df6c767cbf46f61a91c70b3ba71811dfa0aca4a324d9407a06a8b7a2e7  watchdog-2.1.6.tar.gz
+# Locally computed sha256 checksums
+sha256  02c8760f988a76e92a9d6cb525456a86f7b0fd1953870dd491de5955cb974d41  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 44929a65ac..2dafef97e1 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 0.9.0
+PYTHON_WATCHDOG_VERSION = 2.1.6
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://pypi.python.org/packages/bb/e3/5a55d48a29300160779f0a0d2776d17c1b762a2039b36de528b093b87d5b
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/e8/a8/fc4edd7d768361b00ea850e5310211d157df6b5a1db6148dd434e787d898
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
