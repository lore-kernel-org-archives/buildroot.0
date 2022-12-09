Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535F6C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0372344625;
	Mon, 20 Feb 2023 21:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0372344625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVH6thAMIRUd; Mon, 20 Feb 2023 21:41:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B84044571A;
	Mon, 20 Feb 2023 21:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B84044571A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D1871BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E2F2415A9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E2F2415A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rvDXQuaXfzhY for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8F03415A0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8F03415A0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2001828C8; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 07f7d434a438421eb382a27349e67cffd97d8a3f
X-Git-Newrev: 59d64c57c755338306e9eddc9ff98a948ef79694
X-Patchwork-Hint: ignore
Message-Id: <20230220205157.C2001828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xcompmgr:
 bump version to 1.1.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=59d64c57c755338306e9eddc9ff98a948ef79694
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-November/003254.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash | 8 +++-----
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
index 6f0d755261..b9675a5ecf 100644
--- a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002989.html
-md5  ef8c7d4140c11efb8de4141b3968208c  xcompmgr-1.1.8.tar.bz2
-sha1  7bb28329b4bb687763df2d2c1723cb6ecb20945a  xcompmgr-1.1.8.tar.bz2
-sha256  0b89daf4f060fa3fa83cca862c45d531fef7121b5d06552c1d73d396ad9a7243  xcompmgr-1.1.8.tar.bz2
-sha512  ccf29426ffb0797a53653d1ce152de5eee0cec284811fed4b8e634ea0d948180531e4619d96f47e4f9594432c57322624fe0fdaee2c9200efac427fc0904953d  xcompmgr-1.1.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003254.html
+sha256  4875b6698672d01eb3a5080bde6eac9a989d486a82226a2d5e23624f1527a6f0  xcompmgr-1.1.9.tar.xz
+sha512  699117492af7fd84b36d317dcbf422d5ec86a7f21e29370caa737cd940d8ff866a5c8704ba2e7bd17a64e085d77fd23b628263d619813dead85cd669ff5b860e  xcompmgr-1.1.9.tar.xz
 # Locally computed
 sha256  c843545f72771b3ff95eb88defc2e3ed8f9a1802d9bb6c32c196bb5eec3d3a5d  COPYING
diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
index 24ebad7bda..c754ea37b3 100644
--- a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCOMPMGR_VERSION = 1.1.8
-XAPP_XCOMPMGR_SOURCE = xcompmgr-$(XAPP_XCOMPMGR_VERSION).tar.bz2
-XAPP_XCOMPMGR_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCOMPMGR_VERSION = 1.1.9
+XAPP_XCOMPMGR_SOURCE = xcompmgr-$(XAPP_XCOMPMGR_VERSION).tar.xz
+XAPP_XCOMPMGR_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCOMPMGR_LICENSE = MIT
 XAPP_XCOMPMGR_LICENSE_FILES = COPYING
 XAPP_XCOMPMGR_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
