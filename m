Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5C1C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EF2540E46;
	Mon,  6 Nov 2023 22:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EF2540E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZsR4dG-KLFjh; Mon,  6 Nov 2023 22:20:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EE9641926;
	Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EE9641926
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF8711BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B154B410BA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B154B410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8fdmgSgn6al for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB1DB402FD
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB1DB402FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D12B486B72; Mon,  6 Nov 2023 22:20:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:12:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9cbe43f38185ef074472cee603b68942fe983d2
X-Git-Newrev: 43d1d468b778052908a4d6caaa467c02aa3fdf17
X-Patchwork-Hint: ignore
Message-Id: <20231106222016.D12B486B72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crontab: bump to version
 3.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=43d1d468b778052908a4d6caaa467c02aa3fdf17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-crontab/python-crontab.hash | 4 ++--
 package/python-crontab/python-crontab.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index d9519096df..10ba469d5a 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  0a71aa83eed18752c2850632d84cfd89  python-crontab-2.7.1.tar.gz
-sha256  b21af4647c7bbb848fef2f020616c6b0289dcb9f94b4f991a55310ff9bec5749  python-crontab-2.7.1.tar.gz
+md5  1675bdeeb821441b8b4c35e0a7ba861c  python-crontab-3.0.0.tar.gz
+sha256  79fb7465039ddfd4fb93d072d6ee0d45c1ac8bf1597f0686ea14fd4361dba379  python-crontab-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index 1c2802ef61..21a9edef9b 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 2.7.1
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/6a/b6/94d861e868698b8e3f288f7e4684e30535b0d9a6b38316ee0a3d4d31e6ae
+PYTHON_CRONTAB_VERSION = 3.0.0
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/fb/6f/14adf2570e83c90f3f5af1af5225a70f914ba9e7ab9d08e675c5f6887102
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
