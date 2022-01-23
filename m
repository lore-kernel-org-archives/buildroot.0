Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937DDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46A89401FD;
	Sun, 23 Jan 2022 19:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PyS_I-0HqSJm; Sun, 23 Jan 2022 19:53:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8370040281;
	Sun, 23 Jan 2022 19:53:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61DC11BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E64340319
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yn4xHmWY8EHQ for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:52:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69ADF40334
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:52:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C3FD282B45; Sun, 23 Jan 2022 19:45:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 20:49:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 029a6dc3e3320984c6369747e0b79060f13b2afc
X-Git-Newrev: 4b44e7d988569778d952e9ad3e7e76cfe75bbe7e
X-Patchwork-Hint: ignore
Message-Id: <20220123194537.C3FD282B45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectl: bump to version 4.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b44e7d988569778d952e9ad3e7e76cfe75bbe7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

4.3.2	 Oct 7, 2021
 - very minor bug. the last command in perfquery is not in a loop and
   prevents the collectl daemon from starting via the service.

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/collectl/collectl.hash | 8 ++++----
 package/collectl/collectl.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/collectl/collectl.hash b/package/collectl/collectl.hash
index d866e0becc..1785d25d87 100644
--- a/package/collectl/collectl.hash
+++ b/package/collectl/collectl.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 2187264d974b36a653c8a4b028ac6eeab23e1885f8b2563a33f06358f39889f1  collectl-4.3.1.src.tar.gz
-sha256 b92800d37afa2aa03c02817ff3b68efc7236436fe76af06ad9b1fc4682f59bcb  ARTISTIC
-sha256 264fe27852db5624e6a9a9845b4e14e91ee5007305b33e5556dfade394d578a8  COPYING
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL
+sha256  9fab4769441c07201748e52c7f8c7b21526ab45a05142dd2b2b1fa5c16c38750  collectl-4.3.2.src.tar.gz
+sha256  b92800d37afa2aa03c02817ff3b68efc7236436fe76af06ad9b1fc4682f59bcb  ARTISTIC
+sha256  264fe27852db5624e6a9a9845b4e14e91ee5007305b33e5556dfade394d578a8  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL
diff --git a/package/collectl/collectl.mk b/package/collectl/collectl.mk
index c9fb59293c..c6cb2e1494 100644
--- a/package/collectl/collectl.mk
+++ b/package/collectl/collectl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COLLECTL_VERSION = 4.3.1
+COLLECTL_VERSION = 4.3.2
 COLLECTL_SOURCE = collectl-$(COLLECTL_VERSION).src.tar.gz
 COLLECTL_SITE = http://downloads.sourceforge.net/collectl/collectl
 COLLECTL_LICENSE = Artistic or GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
