Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16E0C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D75D81801;
	Sat, 12 Mar 2022 17:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82-ttPoRAcCt; Sat, 12 Mar 2022 17:58:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37563817F5;
	Sat, 12 Mar 2022 17:58:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53AD01BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 435CB4032B
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBObxU_nQKNE for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:58:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 551B5402BC
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:58:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 86E8A82D99; Sat, 12 Mar 2022 17:49:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 18:57:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba8c268e00bce6cbcb2d7d29143a34afaa5fdc46
X-Git-Newrev: 39d6deb60b32b86d819346ebd8fc94c7e170908e
X-Patchwork-Hint: ignore
Message-Id: <20220312174926.86E8A82D99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chrony: bump to version 4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=39d6deb60b32b86d819346ebd8fc94c7e170908e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.tuxfamily.org/chrony/chrony.git/tree/NEWS?id=4.2

Signed-off-by: James Knight <james.knight@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/chrony/chrony.hash | 5 +++--
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index f8dd1438bc..7fa67bf040 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,4 +1,5 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2021/05/msg00000.html
-sha256  ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c  chrony-4.1.tar.gz
+# Locally calculated after checking pgp signature
+# https://download.tuxfamily.org/chrony/chrony-4.2-tar-gz-asc.txt
+sha256  273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a  chrony-4.2.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 5a34f70e1e..15b200aeff 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.1
+CHRONY_VERSION = 4.2
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
