Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC74C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 14:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66BF960A7E;
	Sun, 11 Jun 2023 14:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66BF960A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nz51rouAvR9e; Sun, 11 Jun 2023 14:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93D7761139;
	Sun, 11 Jun 2023 14:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93D7761139
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46A511BF3E8
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E19F40129
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E19F40129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uo8Q9DYoe3CG for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 14:56:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C233400C1
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C233400C1
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 14:56:23 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout12.t-online.de (Postfix) with SMTP id 734EF13CC5
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 16:56:21 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8MUP-1woWEl0; Sun, 11 Jun 2023 16:56:21 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34716)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8MUO-0001vD-2x
 for buildroot@buildroot.org; Sun, 11 Jun 2023 16:56:20 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 16:56:11 +0200
Message-Id: <20230611145617.758070-7-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611145617.758070-1-bernd.kuhls@t-online.de>
References: <20230611145617.758070-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686495381-43FF1266-4E935BEF/0/0 CLEAN NORMAL
X-TOI-MSGID: 3be03749-7cc9-40cd-87f3-9ae9545cd9c3
Subject: [Buildroot] [PATCH 06/12] package/x11r7/xapp_xwd: bump version to
 1.0.9
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
https://lists.x.org/archives/xorg-announce/2023-June/003400.html

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xwd/xapp_xwd.hash | 6 +++---
 package/x11r7/xapp_xwd/xapp_xwd.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xwd/xapp_xwd.hash b/package/x11r7/xapp_xwd/xapp_xwd.hash
index 7595286499..cc81b05ce5 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.hash
+++ b/package/x11r7/xapp_xwd/xapp_xwd.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-August/003102.html
-sha256  fbaa2b34163714fe7be22b60920ea4683f63b355babb1781aec2e452a033031b  xwd-1.0.8.tar.bz2
-sha512  d2aaf42c60d20c4b09f4947d3702058dbfad4633b2c5c8ea62e8897fc9ced1ab3417ce99255a223286d21a731f543019470737e3074f1bc68033b4eb47bc773e  xwd-1.0.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-June/003400.html
+sha256  dc121b84947eb4a3d1131bff1e9844cfa2124d95b47b35f9932340fa931fbd3f  xwd-1.0.9.tar.xz
+sha512  ae59661b05160f5658920fd79031b6b8548cb7bbfc734194edb0acef5c95f76b210ca4443e9506fc1a0cb9df47ee7c22948502971afe578b44c75aa2a1138d56  xwd-1.0.9.tar.xz
 # Locally computed
 sha256  7cfda56afd92a1ecd2f23bd0064e01b5141053390d854785504adfe2c0fbd946  COPYING
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index 1c5bd50166..8960aaffdb 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XWD_VERSION = 1.0.8
-XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.bz2
+XAPP_XWD_VERSION = 1.0.9
+XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.xz
 XAPP_XWD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XWD_LICENSE = MIT
 XAPP_XWD_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
