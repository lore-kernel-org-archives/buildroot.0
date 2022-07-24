Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C033AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 20:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F00A405D0;
	Sun, 24 Jul 2022 20:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F00A405D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7F2tKTa_x0vt; Sun, 24 Jul 2022 20:00:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DC67404C4;
	Sun, 24 Jul 2022 20:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DC67404C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A54181BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDF6183EE8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF6183EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NBhGD-OfqW8o for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 480C283EF7
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 480C283EF7
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7A46085CC8; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f3368c6d1e260a016325028c0c9ee26b6e67ad5
X-Git-Newrev: b9f6c89e7ee9e1103f98c6c712bf5e820f77b550
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.7A46085CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xfont_font-util: bump
 version to 1.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9f6c89e7ee9e1103f98c6c712bf5e820f77b550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xfont_font-util/xfont_font-util.hash | 11 ++++-------
 package/x11r7/xfont_font-util/xfont_font-util.mk   |  6 +++---
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.hash b/package/x11r7/xfont_font-util/xfont_font-util.hash
index 55beba89f3..a7664efec2 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.hash
+++ b/package/x11r7/xfont_font-util/xfont_font-util.hash
@@ -1,8 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-August/003019.html
-md5 3d6adb76fdd072db8c8fae41b40855e8  font-util-1.3.2.tar.bz2
-sha1 1b36275c174b64a9c16da5c902c91546789a67ef  font-util-1.3.2.tar.bz2
-sha256 3ad880444123ac06a7238546fa38a2a6ad7f7e0cc3614de7e103863616522282  font-util-1.3.2.tar.bz2
-sha512 7cac529b12ae71185b89c72c1569b9826f52eeaecc1c76010338e7c42c4078ae339f18220b580bbd68fb5dc09df6ecf169a47c32e6104d8ee53bd443fa21d167  font-util-1.3.2.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2022-July/003190.html
+sha256  e791c890779c40056ab63aaed5e031bb6e2890a98418ca09c534e6261a2eebd2  font-util-1.3.3.tar.xz
+sha512  5e1cb8af44fe0bea72b1a6a4e455f50ca49b7531c2f4b605800c0b2b7578b9826ccf17fa195c505ab1d6339fd4ad697c01ba3b9777616f354ab62b23434d47c9  font-util-1.3.3.tar.xz
 # Locally calculated
-sha256	ce16c3ee6f2a38db6870b66bdb54fce9dcf24acd1161840789e321f6faa1251c	COPYING
+sha256  ce16c3ee6f2a38db6870b66bdb54fce9dcf24acd1161840789e321f6faa1251c  COPYING
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index cd2ae81cc3..b864dce23c 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_UTIL_VERSION = 1.3.2
-XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
-XFONT_FONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_UTIL_VERSION = 1.3.3
+XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.xz
+XFONT_FONT_UTIL_SITE = https://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_UTIL_LICENSE = MIT/BSD-2-Clause
 XFONT_FONT_UTIL_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
