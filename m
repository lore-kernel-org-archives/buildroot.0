Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD3AC7EE29
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 17:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 031F3404A1;
	Sat, 10 Jun 2023 17:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 031F3404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86nMeQ1iRE0R; Sat, 10 Jun 2023 17:46:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42C9640217;
	Sat, 10 Jun 2023 17:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C9640217
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83A661BF32B
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 17:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69BDA40217
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 17:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69BDA40217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ix0AAYtH6Kew for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 17:46:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40AB440129
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40AB440129
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 17:46:29 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout12.t-online.de (Postfix) with SMTP id 33852136EA
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 19:46:27 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd81.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q82fR-4Mys8v0; Sat, 10 Jun 2023 19:46:26 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:53338)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q82fR-00041j-28
 for buildroot@buildroot.org; Sat, 10 Jun 2023 19:46:25 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 19:46:25 +0200
Message-Id: <20230610174625.1122318-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686419186-DA7FADA8-B6CC7359/0/0 CLEAN NORMAL
X-TOI-MSGID: 3fa506da-3de3-435a-a99a-4d36842bdce4
Subject: [Buildroot] [PATCH 1/1] package/rrdtool: bump version to 1.8.0
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
https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.8.0

Switched _SITE due to upstream move: https://oss.oetiker.ch/rrdtool/pub/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rrdtool/rrdtool.hash | 2 +-
 package/rrdtool/rrdtool.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
index 5266e5b7a1..1a6d18aea9 100644
--- a/package/rrdtool/rrdtool.hash
+++ b/package/rrdtool/rrdtool.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  a199faeb7eff7cafc46fac253e682d833d08932f3db93a550a4a5af180ca58db  rrdtool-1.7.2.tar.gz
+sha256  bd37614137d7a8dc523359648eb2a81631a34fd91a82ed5581916a52c08433f4  rrdtool-1.8.0.tar.gz
 sha256  ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320  COPYRIGHT
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 051aec1c19..24d84c79c3 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RRDTOOL_VERSION = 1.7.2
-RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
+RRDTOOL_VERSION = 1.8.0
+RRDTOOL_SITE = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(RRDTOOL_VERSION)
 RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
 RRDTOOL_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
