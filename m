Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F86EC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 186C642A75;
	Sat,  6 May 2023 17:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 186C642A75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Fwwv1DpnxiB; Sat,  6 May 2023 17:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3422B40C2B;
	Sat,  6 May 2023 17:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3422B40C2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B37611BF369
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AE84409B1
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AE84409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ai7jXEqr_tQp for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DB964136B
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DB964136B
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:30 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout03.t-online.de (Postfix) with SMTP id 56337583E
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:27 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd70.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsN-0Z0R1f0; Sat, 6 May 2023 19:39:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsN-0004jT-26
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:15 +0200
Message-Id: <20230506173917.1112500-20-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394759-DD540C15-864A0098/0/0 CLEAN NORMAL
X-TOI-MSGID: a43e3098-fd38-4cea-83cf-65767fd4b094
Subject: [Buildroot] [PATCH 20/22] package/x11r7/xfont_font-util: bump
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2023-February/003331.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
