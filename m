Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565E1ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 15:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 095F260ABA;
	Sun, 30 Oct 2022 15:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 095F260ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDH9a_KLIx6w; Sun, 30 Oct 2022 15:57:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F7ED605AC;
	Sun, 30 Oct 2022 15:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F7ED605AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 039791BF47A
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 15:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0E0960A90
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 15:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0E0960A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdCnewBZopEg for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 15:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B3D4605AC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 15:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B3D4605AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1623987538; Sun, 30 Oct 2022 15:57:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 16:56:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abf2593ead935d07d7d2eaad2a74a4f31f59012a
X-Git-Newrev: 8d0c70370c48c3cc12baee1e572948c73e13cb4c
X-Patchwork-Hint: ignore
Message-Id: <20221030155749.1623987538@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mcelog: bump to version 189
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d0c70370c48c3cc12baee1e572948c73e13cb4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/andikleen/mcelog/releases/tag/v189
https://github.com/andikleen/mcelog/releases/tag/v188

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mcelog/mcelog.hash | 2 +-
 package/mcelog/mcelog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
index c64e652453..e0350b085d 100644
--- a/package/mcelog/mcelog.hash
+++ b/package/mcelog/mcelog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  02eb3f4cb0976048f191d124fb45a1720caf082cd246d858acb0a39a9d026641  mcelog-187.tar.gz
+sha256  30364d134ff416f3f9469720add84bdccea226268d334f06022110f484550cd9  mcelog-189.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index de1b76cfd3..8b5876d32e 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = 187
+MCELOG_VERSION = 189
 MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
 MCELOG_LICENSE = GPL-2.0
 MCELOG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
