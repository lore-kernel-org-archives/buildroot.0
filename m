Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A730C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B56A6408F1;
	Sun, 15 Jan 2023 11:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B56A6408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6su7PL7A4r0; Sun, 15 Jan 2023 11:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67B3E408F3;
	Sun, 15 Jan 2023 11:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67B3E408F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0CCD1BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 438A081FE1
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 438A081FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SD_JtP8LPndd for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F001681F1A
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F001681F1A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DED2E870DC; Sun, 15 Jan 2023 11:06:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:00:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7be2ff33abdd049dc3670c5a6e2e385c1fba6f41
X-Git-Newrev: 3030baaa67dcafcc9f2c0802278c51f2ea016936
X-Patchwork-Hint: ignore
Message-Id: <20230115110627.DED2E870DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crontab: bump to version
 2.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3030baaa67dcafcc9f2c0802278c51f2ea016936
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-crontab/python-crontab.hash | 4 ++--
 package/python-crontab/python-crontab.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index b3aa96fc1b..d9519096df 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  2982bdce2d9b7789f32da649a9507c4b  python-crontab-2.6.0.tar.gz
-sha256  1e35ed7a3cdc3100545b43e196d34754e6551e7f95e4caebbe0e1c0ca41c2f1b  python-crontab-2.6.0.tar.gz
+md5  0a71aa83eed18752c2850632d84cfd89  python-crontab-2.7.1.tar.gz
+sha256  b21af4647c7bbb848fef2f020616c6b0289dcb9f94b4f991a55310ff9bec5749  python-crontab-2.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index 9b29e11ccd..1c2802ef61 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 2.6.0
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/06/b0/c270a1b5c83d9e0f83ab654d3153c39d80f61ba49fefde50fd23ab351381
+PYTHON_CRONTAB_VERSION = 2.7.1
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/6a/b6/94d861e868698b8e3f288f7e4684e30535b0d9a6b38316ee0a3d4d31e6ae
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
