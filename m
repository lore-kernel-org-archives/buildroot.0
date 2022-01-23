Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB278C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FE3340323;
	Sun, 23 Jan 2022 19:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vv6bg5F_GkCz; Sun, 23 Jan 2022 19:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 902DE4014C;
	Sun, 23 Jan 2022 19:52:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D4EE1BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D0114033A
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJvuIYKDfZSm for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:52:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 603C440319
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:52:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B33D38296B; Sun, 23 Jan 2022 19:45:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 20:49:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d824fc1145de69ef00415232668f6f1efe814668
X-Git-Newrev: aa1a33027fabe03f98b10edfa2a94555e9413415
X-Patchwork-Hint: ignore
Message-Id: <20220123194537.B33D38296B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xl2tp: bump to version 1.3.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa1a33027fabe03f98b10edfa2a94555e9413415
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/xelerance/xl2tpd/releases/tag/v1.3.17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xl2tp/xl2tp.hash | 2 +-
 package/xl2tp/xl2tp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xl2tp/xl2tp.hash b/package/xl2tp/xl2tp.hash
index 471657f0f2..eca918bc83 100644
--- a/package/xl2tp/xl2tp.hash
+++ b/package/xl2tp/xl2tp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  c28608b315adb25c8bf9579c1d6ab52ab47c4c43b68a5ab63c5d039196fd180f  xl2tp-1.3.16.tar.gz
+sha256  898d9b6a374c78dea5f20d80fd50fac13428ad746fefb16ff5f6bec449affe67  xl2tp-1.3.17.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index ca404060a2..e42eeb1709 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XL2TP_VERSION = 1.3.16
+XL2TP_VERSION = 1.3.17
 XL2TP_SITE = $(call github,xelerance,xl2tpd,v$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
 XL2TP_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
