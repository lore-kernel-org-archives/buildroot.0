Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C6CC7EE2F
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 16:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 303A441F69;
	Sat, 10 Jun 2023 16:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 303A441F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H4P6t-yzqhlL; Sat, 10 Jun 2023 16:50:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A0DA4267E;
	Sat, 10 Jun 2023 16:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A0DA4267E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23A691BF32E
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 16:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 090CA4267E
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 16:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 090CA4267E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2a4Kf-fdCl4 for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 16:50:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3C544267D
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3C544267D
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 16:50:03 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout03.t-online.de (Postfix) with SMTP id 7CD468E9B
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 18:50:01 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd78.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q81mq-0BY3M10; Sat, 10 Jun 2023 18:50:00 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:55796)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q81mp-0002iE-2b
 for buildroot@buildroot.org; Sat, 10 Jun 2023 18:49:59 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 18:49:59 +0200
Message-Id: <20230610164959.1049309-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686415800-097C5714-88AF88F3/0/0 CLEAN NORMAL
X-TOI-MSGID: 55059f07-0763-4238-9f65-3020ee309d12
Subject: [Buildroot] [PATCH 1/1] package/ncurses: bump version to
 6.4.20230603
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
https://github.com/ThomasDickey/ncurses-snapshots/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ncurses/ncurses.hash | 2 +-
 package/ncurses/ncurses.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index a5f83c8725..b82a7b29e4 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  004603a9b3ec51599ef0a0089482004ee3d33b0240d87ce17b6f77525b51fb4e  ncurses-6.4-20230429.tar.gz
+sha256  b0910671694c2c8377f579eea68477a15d67bd20ddd4b29328cfe15c62c7b3fd  ncurses-6.4-20230603.tar.gz
 # Locally computed
 sha256  0413b2f4ea863194c174673032f0fca84f1ea1ed4eed6476baea68c075a631ce  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 4753da299c..3b805cb1fd 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -6,7 +6,7 @@
 
 # When there is no snapshost yet for a new version, set it to the empty string
 NCURSES_VERSION_MAJOR = 6.4
-NCURSES_SNAPSHOT_DATE = 20230429
+NCURSES_SNAPSHOT_DATE = 20230603
 NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
 NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
 NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
