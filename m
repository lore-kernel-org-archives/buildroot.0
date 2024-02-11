Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1130C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 09:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4646E40106;
	Sun, 11 Feb 2024 09:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZ7IECbvrEt3; Sun, 11 Feb 2024 09:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0596B40160
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0596B40160;
	Sun, 11 Feb 2024 09:38:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 294E91BF3C6
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 09:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2322782784
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 09:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2sxNzqBAje70 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 09:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42BAF82778
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42BAF82778
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 09:38:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23CC6820E2; Sun, 11 Feb 2024 09:38:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 10:35:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e40ca97d71330c153041b4db856698be8a47c823
X-Git-Newrev: 52b43a12472a9853ff5d69b136144427c41f2803
X-Patchwork-Hint: ignore
Message-Id: <20240211093811.23CC6820E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jailhouse: bump to commit e57d1ef
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

commit: https://git.buildroot.net/buildroot/commit/?id=52b43a12472a9853ff5d69b136144427c41f2803
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The last Jailhouse tag is v0.12. It dates from 2020-02-04, which is
4 years old. This version no longer compiles with recent Kernels.

This commit updates Jailhouse to the latest commit e57d1ef, which
dates from 2023-01-10.

For commit logs, see:
https://github.com/siemens/jailhouse/commits/master/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jailhouse/jailhouse.hash | 2 +-
 package/jailhouse/jailhouse.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jailhouse/jailhouse.hash b/package/jailhouse/jailhouse.hash
index 297d0f1930..96d5819847 100644
--- a/package/jailhouse/jailhouse.hash
+++ b/package/jailhouse/jailhouse.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  3777a553c2acb2b693843fe4d16ab80333879daedd47d9c9f3717c9644e6cf93  jailhouse-0.12.tar.gz
+sha256  38ea5d2d9672ce7f76fd0c163edaa8968711aca58f245aec3c8934f140e828b6  jailhouse-e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560.tar.gz
 sha256  3aafb31a2436178323663e00511f16d58fc36ea654b1457532e79d017205efd8  COPYING
diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index e7de40cf8c..b5a8b40fdd 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JAILHOUSE_VERSION = 0.12
-JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
+JAILHOUSE_VERSION = e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560
+JAILHOUSE_SITE = $(call github,siemens,jailhouse,$(JAILHOUSE_VERSION))
 JAILHOUSE_LICENSE = GPL-2.0
 JAILHOUSE_LICENSE_FILES = COPYING
 JAILHOUSE_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
