Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F53C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:40:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E72C861037
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E72C861037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EEA7404C4;
	Fri,  5 Nov 2021 16:40:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBGHK96P7Y_v; Fri,  5 Nov 2021 16:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A9A740012;
	Fri,  5 Nov 2021 16:40:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0D931C1148
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B13268272A
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hS5ruSR8Cpsq for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:40:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E598882718
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:40:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 12A6D8B2D6; Fri,  5 Nov 2021 16:36:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:33:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb2a5cc9e6cba056accd165608dbd33078ac42f5
X-Git-Newrev: 8f3e5f15029f76eafa46d5a48b0239aa522fc324
X-Patchwork-Hint: ignore
Message-Id: <20211105163656.12A6D8B2D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crontab: bump to version
 2.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f3e5f15029f76eafa46d5a48b0239aa522fc324
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-crontab/python-crontab.hash | 4 ++--
 package/python-crontab/python-crontab.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index 2247cf3d3d..b3aa96fc1b 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  7731a2253e853abfb6eceb8045368f22  python-crontab-2.5.1.tar.gz
-sha256  4bbe7e720753a132ca4ca9d4094915f40e9d9dc8a807a4564007651018ce8c31  python-crontab-2.5.1.tar.gz
+md5  2982bdce2d9b7789f32da649a9507c4b  python-crontab-2.6.0.tar.gz
+sha256  1e35ed7a3cdc3100545b43e196d34754e6551e7f95e4caebbe0e1c0ca41c2f1b  python-crontab-2.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index ddb1067db2..9b29e11ccd 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 2.5.1
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/1b/7e/fb78b96de58a49b8ef807c321870ef4de3de5928fd71a40a400aed714310
+PYTHON_CRONTAB_VERSION = 2.6.0
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/06/b0/c270a1b5c83d9e0f83ab654d3153c39d80f61ba49fefde50fd23ab351381
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
