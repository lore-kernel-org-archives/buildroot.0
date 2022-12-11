Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43697C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 08:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7969404D1;
	Sun, 11 Dec 2022 08:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7969404D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rD6QbFdZpY7m; Sun, 11 Dec 2022 08:21:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EE03403A7;
	Sun, 11 Dec 2022 08:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EE03403A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 229001BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5371404CF
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5371404CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpP8Bqi9qQWE for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:20:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33BB4403A7
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33BB4403A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 218F585FA8; Sun, 11 Dec 2022 08:20:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:19:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fc4b59ffd3007ca9e436d33647acc5dfff62970
X-Git-Newrev: 76423bd3a657f0ca197e2301bbb21e4fc9eee992
X-Patchwork-Hint: ignore
Message-Id: <20221211082030.218F585FA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/davfs2: bump to version 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=76423bd3a657f0ca197e2301bbb21e4fc9eee992
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://savannah.nongnu.org/forum/forum.php?forum_id=10244
https://git.savannah.nongnu.org/cgit/davfs2.git/tree/ChangeLog?h=rel-1-7-0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/davfs2/davfs2.hash | 2 +-
 package/davfs2/davfs2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/davfs2/davfs2.hash b/package/davfs2/davfs2.hash
index a555779dbc..1cbacc388f 100644
--- a/package/davfs2/davfs2.hash
+++ b/package/davfs2/davfs2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ce3eb948ece582a51c934ccb0cc70e659839172717caff173f69a5e2af90c5c0  davfs2-1.6.1.tar.gz
+sha256  251db75a27380cca1330b1b971700c5e5dcc0c90e5a47622285f0140edfe3a2f  davfs2-1.7.0.tar.gz
 # License file, locally calculated
 sha256  0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index 42192faa59..a67c506250 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAVFS2_VERSION = 1.6.1
+DAVFS2_VERSION = 1.7.0
 DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
