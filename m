Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AABC77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 13:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 511CE429FA;
	Fri, 28 Apr 2023 13:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 511CE429FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yO_oO8Xi7e6B; Fri, 28 Apr 2023 13:13:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8424F429F6;
	Fri, 28 Apr 2023 13:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8424F429F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A6A31BF580
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 13:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3426A616E2
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 13:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3426A616E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RRphMjps8Bf6 for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 13:13:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D628605B3
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D628605B3
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 13:13:35 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout08.t-online.de (Postfix) with SMTP id 2D416236D
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 15:13:32 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.3.195]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1psNul-3GXcS90; Fri, 28 Apr 2023 15:13:31 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:43170)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1psNul-0001gA-0L
 for buildroot@buildroot.org; Fri, 28 Apr 2023 15:13:31 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 15:13:31 +0200
Message-Id: <20230428131331.456475-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1682687611-15893CF2-1A4007E4/0/0 CLEAN NORMAL
X-TOI-MSGID: 8767f36f-d452-4ecf-89b0-d5f965a08eca
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: security
 bump version to 21.1.8
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
https://lists.x.org/archives/xorg-announce/2023-March/003377.html

Fixes CVE-2023-1393:
https://lists.x.org/archives/xorg-announce/2023-March/003374.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index e2a2a251c3..092a640f04 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003321.html
-sha256  d9c60b2dd0ec52326ca6ab20db0e490b1ff4f566f59ca742d6532e92795877bb  xorg-server-21.1.7.tar.xz
-sha512  e2a093381e28da9b2aa700c6609349fa851f4ca8df23c776f30e4e2733e7a6c1b257576b93f4c4e87fb09df901385bf52528982f6e7a6ad469597aeae8640bb5  xorg-server-21.1.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-March/003377.html
+sha256  38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152  xorg-server-21.1.8.tar.xz
+sha512  6104b3620ed2e1e27d9a8e963388bbe8785a764585b1bc03dbf5d719a92894773dda580d377ca18ceeab353e65a5d23cc947bab84a4012f9dd1eca31cac36937  xorg-server-21.1.8.tar.xz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 33b35b7979..593bbd4276 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.7
+XSERVER_XORG_SERVER_VERSION = 21.1.8
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
