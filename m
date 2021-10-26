Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A70DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:39:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44B756103C
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44B756103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 230DA80C18;
	Tue, 26 Oct 2021 19:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Lze0r4f73J5; Tue, 26 Oct 2021 19:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 946D080BB2;
	Tue, 26 Oct 2021 19:39:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43BA21BF9B2
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D1694011F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1TX8myshPVYN for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 340CE4022A
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 47C1E88F06; Tue, 26 Oct 2021 19:34:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:34:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c85c59721a4d98d84b699b4204fc5e38483a9b9
X-Git-Newrev: 0cdbe8b70152d498973d97b37b3418e933b27b6e
X-Patchwork-Hint: ignore
Message-Id: <20211026193445.47C1E88F06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yarl: bump to version 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cdbe8b70152d498973d97b37b3418e933b27b6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash change due to removal of full license text:
https://github.com/aio-libs/yarl/commit/94faa90c3c3e6d8ac519fa4b6bee154bc090e34b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-yarl/python-yarl.hash | 6 +++---
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 783702c74b..e488ee6939 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  3b6f2da3db8c645a9440375fd6a414eb  yarl-1.6.3.tar.gz
-sha256  8a9066529240171b68893d60dca86a763eae2139dd42f42106b03cf4b426bf10  yarl-1.6.3.tar.gz
+md5  624ac1cd36abe92dc437fa97209c5c68  yarl-1.7.0.tar.gz
+sha256  8e7ebaf62e19c2feb097ffb7c94deb0f0c9fab52590784c8cd679d30ab009162  yarl-1.7.0.tar.gz
 # Locally computed sha256 checksums
-sha256  14c0820503ceef15e814a89b037d9efc066870087018294b6ae0f27163872cc5  LICENSE
+sha256  56d6ac6c8105c0a51304c21db060e361af9a8ea0af9a75c239c28b5d13693838  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 32ec477064..8a1a3bbca0 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.6.3
+PYTHON_YARL_VERSION = 1.7.0
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/97/e7/af7219a0fe240e8ef6bb555341a63c43045c21ab0392b4435e754b716fa1
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/7f/5c/a4ce6d4f46413afe49734bf901939105f4ce7fcfbcf87d0777cc39501060
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
