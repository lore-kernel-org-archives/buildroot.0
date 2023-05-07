Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B070C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C467080F04;
	Sun,  7 May 2023 12:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C467080F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fo0h9m13ZuH3; Sun,  7 May 2023 12:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D855F81A34;
	Sun,  7 May 2023 12:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D855F81A34
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 811921BF2FA
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 603ED418B3
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 603ED418B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38PT-wFVlCpV for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:04:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC2A2418C5
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC2A2418C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA8E685EF0; Sun,  7 May 2023 12:04:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 13:59:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58035c687aa9128408e6519857a8b6a8c64ae6e8
X-Git-Newrev: 551a702b93ea356a7e050ce4710eed30ededf793
X-Patchwork-Hint: ignore
Message-Id: <20230507120438.DA8E685EF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xfont_font-util: bump
 version to 1.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=551a702b93ea356a7e050ce4710eed30ededf793
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-February/003331.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xfont_font-util/xfont_font-util.hash | 6 +++---
 package/x11r7/xfont_font-util/xfont_font-util.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.hash b/package/x11r7/xfont_font-util/xfont_font-util.hash
index a7664efec2..cf52a2348f 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.hash
+++ b/package/x11r7/xfont_font-util/xfont_font-util.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003190.html
-sha256  e791c890779c40056ab63aaed5e031bb6e2890a98418ca09c534e6261a2eebd2  font-util-1.3.3.tar.xz
-sha512  5e1cb8af44fe0bea72b1a6a4e455f50ca49b7531c2f4b605800c0b2b7578b9826ccf17fa195c505ab1d6339fd4ad697c01ba3b9777616f354ab62b23434d47c9  font-util-1.3.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-February/003331.html
+sha256  9f724bf940128c7e39f7252bd961cd38cfac2359de2100a8bed696bf40d40f7d  font-util-1.4.0.tar.xz
+sha512  05fff613019718a4bd8537ff7eb270bd85345ffb006c16f81b739d6e8cdbfaa9d6503aef9bc48d6c7f70330bf90ff1a46bacdff3c99e8017191d935c85f73d60  font-util-1.4.0.tar.xz
 # Locally calculated
 sha256  ce16c3ee6f2a38db6870b66bdb54fce9dcf24acd1161840789e321f6faa1251c  COPYING
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index b864dce23c..8a97c85d68 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_UTIL_VERSION = 1.3.3
+XFONT_FONT_UTIL_VERSION = 1.4.0
 XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.xz
-XFONT_FONT_UTIL_SITE = https://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_UTIL_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_UTIL_LICENSE = MIT/BSD-2-Clause
 XFONT_FONT_UTIL_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
