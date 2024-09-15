Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530AFC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF10A840E6;
	Sun, 15 Sep 2024 21:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQ0pOx2HaMDu; Sun, 15 Sep 2024 21:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B342681D11
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B342681D11;
	Sun, 15 Sep 2024 21:38:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37FF41BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4292940A18
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6nyKqhk7kHH for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CDC040A1B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CDC040A1B
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 078D083683; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07b1fd1c09c26c823023a91c739df604581fd227
X-Git-Newrev: 849a7ec839035be5147f6e9f72672c502cdeb5de
X-Patchwork-Hint: ignore
Message-Id: <20240915213639.078D083683@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crontab: bump to version
 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=849a7ec839035be5147f6e9f72672c502cdeb5de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-crontab/python-crontab.hash | 4 ++--
 package/python-crontab/python-crontab.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index 10ba469d5a..141d075851 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  1675bdeeb821441b8b4c35e0a7ba861c  python-crontab-3.0.0.tar.gz
-sha256  79fb7465039ddfd4fb93d072d6ee0d45c1ac8bf1597f0686ea14fd4361dba379  python-crontab-3.0.0.tar.gz
+md5  7ff9f13749104faa73f353a0d4ae9087  python_crontab-3.2.0.tar.gz
+sha256  40067d1dd39ade3460b2ad8557c7651514cd3851deffff61c5c60e1227c5c36b  python_crontab-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index 21a9edef9b..7946f56829 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 3.0.0
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/fb/6f/14adf2570e83c90f3f5af1af5225a70f914ba9e7ab9d08e675c5f6887102
+PYTHON_CRONTAB_VERSION = 3.2.0
+PYTHON_CRONTAB_SOURCE = python_crontab-$(PYTHON_CRONTAB_VERSION).tar.gz
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/e2/f0/25775565c133d4e29eeb607bf9ddba0075f3af36041a1844dd207881047f
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
