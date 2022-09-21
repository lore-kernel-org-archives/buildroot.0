Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84136C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 19:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDE0782FE4;
	Wed, 21 Sep 2022 19:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDE0782FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYshX6a68_6o; Wed, 21 Sep 2022 19:31:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00BA582FA2;
	Wed, 21 Sep 2022 19:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00BA582FA2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61DD81C1148
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DF3E61064
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DF3E61064
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcyNtPLcWv48 for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2777361049
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2777361049
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 126E785CFC; Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 21:24:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44767bb7dda4f45ee0c00c3223ed0ddf2ebb09ad
X-Git-Newrev: c0a1c0c37570e301e4e36de94becfcc37e079703
X-Patchwork-Hint: ignore
Message-Id: <20220921193119.126E785CFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dracut: bump to version 057
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0a1c0c37570e301e4e36de94becfcc37e079703
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kernel tarball is not provided anymore:
https://github.com/dracutdevs/dracut/issues/1850

https://github.com/dracutdevs/dracut/blob/057/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dracut/dracut.hash | 2 +-
 package/dracut/dracut.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/dracut/dracut.hash b/package/dracut/dracut.hash
index 3cda736856..34db6af23b 100644
--- a/package/dracut/dracut.hash
+++ b/package/dracut/dracut.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4baa08206cceeb124dbf1075a0daf774b5a8f144ce2e01d82a144af3020fd65b  dracut-055.tar.xz
+sha256  24f149d683d188c0d25756529b7d1e5cd6be8028e0c1043110f303d0d706757d  dracut-057.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 2b6a144aac..742a073a36 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-DRACUT_VERSION = 055
-DRACUT_SOURCE = dracut-$(DRACUT_VERSION).tar.xz
-DRACUT_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/boot/dracut
+DRACUT_VERSION = 057
+DRACUT_SITE = $(call github,dracutdevs,dracut,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
