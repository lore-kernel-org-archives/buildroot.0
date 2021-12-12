Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D816BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 16:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 891FE40550;
	Sun, 12 Dec 2021 16:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9HoSV2Do_dKn; Sun, 12 Dec 2021 16:06:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9960E40281;
	Sun, 12 Dec 2021 16:06:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 037921BF331
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 16:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6F5242A13
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 16:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SDTcVW_vVYBD for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 16:06:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E451429FB
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 16:06:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2842683548; Sun, 12 Dec 2021 16:01:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 17:05:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d0cceda4a3e46c5a06339f01f0c0794d3ae95d6
X-Git-Newrev: 37cee265c6713763f159543895641a7f7b4f804e
X-Patchwork-Hint: ignore
Message-Id: <20211212160112.2842683548@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/assimp: bump version to 5.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=37cee265c6713763f159543895641a7f7b4f804e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1], [2] and [3].

[1] https://github.com/assimp/assimp/releases/tag/v5.1.1
[2] https://github.com/assimp/assimp/releases/tag/v5.1.2
[3] https://github.com/assimp/assimp/releases/tag/v5.1.3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/assimp/assimp.hash | 2 +-
 package/assimp/assimp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index c61bf88b29..2f4a308c3d 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b96f609bca45cc4747bf8ea4b696816ada484aed2812e60ea4d16aae18360b0b  assimp-5.1.0.tar.gz
+sha256  50a7bd2c8009945e1833c591d16f4f7c491a3c6190f69d9d007167aadb175c35  assimp-5.1.3.tar.gz
 sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 919f7a0a8c..90a617e0c6 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 5.1.0
+ASSIMP_VERSION = 5.1.3
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
