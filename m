Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B7BCF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49C7E8149C;
	Sun, 22 Sep 2024 10:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yOc6e93_h3z; Sun, 22 Sep 2024 10:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 185D4814A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 185D4814A9;
	Sun, 22 Sep 2024 10:34:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2B171BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EB37400CF
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNPvhWT4eXjj for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9537C400AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9537C400AC
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 903B18230F; Sun, 22 Sep 2024 10:34:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:37:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f01897aa6ceca00831c9b2c14f3ae90faaefce68
X-Git-Newrev: 0c5dadeaae8ded9e9d95939da3d04ca945c25733
X-Patchwork-Hint: ignore
Message-Id: <20240922103439.903B18230F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sh: bump to version 2.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c5dadeaae8ded9e9d95939da3d04ca945c25733
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index c0d3f62f12..a674475b86 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sh/json
-md5  aadf37759a9cb4862257cef3cf44a27b  sh-2.0.6.tar.gz
-sha256  9b2998f313f201c777e2c0061f0b1367497097ef13388595be147e2a00bf7ba1  sh-2.0.6.tar.gz
+md5  d6963ecb396045a3ff280baa1fefd79b  sh-2.0.7.tar.gz
+sha256  029d45198902bfb967391eccfd13a88d92f7cebd200411e93f99ebacc6afbb35  sh-2.0.7.tar.gz
 # Locally computed sha256 checksums
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index 29843d645b..8f056aaa02 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 2.0.6
+PYTHON_SH_VERSION = 2.0.7
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/cd/51/7355831d8e1cee8348157d769ccda8a31ca9fa0548e7f93d87837d83866d
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/14/7a/5148402146d360a6d15922814a3b065b52be3a5fe878a8834d3ce4e7d33f
 PYTHON_SH_SETUP_TYPE = pep517
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
