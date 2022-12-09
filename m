Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89260C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39E3846702;
	Mon, 20 Feb 2023 21:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39E3846702
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcjPe0kWU-2u; Mon, 20 Feb 2023 21:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E39CE4E456;
	Mon, 20 Feb 2023 21:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E39CE4E456
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67C5C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7459415AF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7459415AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNprcyRljFP0 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14F87415BC
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14F87415BC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0588986496; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:34:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b97079d921d8e62ce73d08e11069f5c04734e048
X-Git-Newrev: 228780fbde4c2b645ea52a870df5ec020912ddf8
X-Patchwork-Hint: ignore
Message-Id: <20230220205158.0588986496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xutil_makedepend: bump version to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=228780fbde4c2b645ea52a870df5ec020912ddf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-October/003243.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.hash | 8 +++-----
 package/x11r7/xutil_makedepend/xutil_makedepend.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.hash b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
index 079fa9ef8f..3a7496e1a4 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.hash
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002985.html
-md5  b2ca7f2f21f1c04a88b6a254c19c9b68  makedepend-1.0.6.tar.bz2
-sha1  3f321f7b570ec98f1fabc441267d29347a2e1456  makedepend-1.0.6.tar.bz2
-sha256  d558a52e8017d984ee59596a9582c8d699a1962391b632bec3bb6804bf4d501c  makedepend-1.0.6.tar.bz2
-sha512  eb0e8ee8ab7515806d7d98a060cdcd392ec38e4225e5e05db26daa6651f185d0b764aab403edeea904d4d23211b1f7db20daeee6eafce8abe65225784ed0aa42  makedepend-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003243.html
+sha256  a729cfd3c0f4e16c0db1da351e7f53335222e058e3434e84f91251fd6d407065  makedepend-1.0.7.tar.xz
+sha512  fd575de737aa56ef8e475d1ddb7b2392e730ee1b23c0b853bbb21975b757c3fc56f94d57ecc5a784dceed2be653feb10909e86fd96fdc074b50fbbd0e27a19db  makedepend-1.0.7.tar.xz
 # Locally computed
 sha256  0530078db78c47ae978dc2bd77f4f427e6cd97df868672c95b1ef284113c8cb7  COPYING
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 18f8eb1f6a..b16bbe0978 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XUTIL_MAKEDEPEND_VERSION = 1.0.6
-XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
-XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
+XUTIL_MAKEDEPEND_VERSION = 1.0.7
+XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.xz
+XUTIL_MAKEDEPEND_SITE = https://xorg.freedesktop.org/archive/individual/util
 XUTIL_MAKEDEPEND_LICENSE = MIT
 XUTIL_MAKEDEPEND_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
