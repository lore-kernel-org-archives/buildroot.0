Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373C7C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB8837040D;
	Sun, 29 Oct 2023 08:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB8837040D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74BhCIwnqg8V; Sun, 29 Oct 2023 08:40:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2710C70411;
	Sun, 29 Oct 2023 08:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2710C70411
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5A931BF41A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91BF5400A6
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91BF5400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yIYvps4dnSL8 for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:39:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A06B74310B
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A06B74310B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E776860E1; Sun, 29 Oct 2023 08:39:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 09:33:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e110aad3abb7eeff1359cd8254419e459b91172f
X-Git-Newrev: 073b0fc9c1fe9945eccf4b792b948633aae9a9b8
X-Patchwork-Hint: ignore
Message-Id: <20231029083901.8E776860E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flashrom: bump to version 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=073b0fc9c1fe9945eccf4b792b948633aae9a9b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.flashrom.org/release_notes/v_1_3.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flashrom/flashrom.hash | 4 ++--
 package/flashrom/flashrom.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index 2ab463d93a..d3bfbad781 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,4 +1,4 @@
 # Locally computed after checking pgp signature
-# https://download.flashrom.org/releases/flashrom-v1.2.1.tar.bz2.asc
-sha256  89a7ff5beb08c89b8795bbd253a51b9453547a864c31793302296b56bbc56d65  flashrom-v1.2.1.tar.bz2
+# https://download.flashrom.org/releases/flashrom-v1.3.0.tar.bz2.asc
+sha256  a053234453ccd012e79f3443bdcc61625cf97b7fd7cb4cdd8bfbffbe8b149623  flashrom-v1.3.0.tar.bz2
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index dd505987ed..ca55592dba 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.2.1
+FLASHROM_VERSION = 1.3.0
 FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
 FLASHROM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
