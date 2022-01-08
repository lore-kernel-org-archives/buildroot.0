Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E99DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A4D240194;
	Sat,  8 Jan 2022 10:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKjfPLI8CDSQ; Sat,  8 Jan 2022 10:04:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 462A74017C;
	Sat,  8 Jan 2022 10:04:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A0341BF343
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4480C410B8
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5lHCde9uvXg for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:03:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C73A409A3
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:03:57 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout04.t-online.de (Postfix) with SMTP id 274A339A0
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 11:03:54 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.177.158]) by fwd70.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n68Zj-1SKZ610; Sat, 8 Jan 2022 11:03:51 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55042)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n68Zi-0005g6-Lc
 for buildroot@buildroot.org; Sat, 08 Jan 2022 11:03:50 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 11:03:50 +0100
Message-Id: <20220108100350.1102692-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1641636231-00004E7B-A1922D44/0/0 CLEAN NORMAL
X-TOI-MSGID: 5071d248-02e6-4b56-b3f0-499e58dcc736
Subject: [Buildroot] [PATCH 1/1] package/libsoundtouch: bump version to 2.3.1
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

Updated license hash due to upstream commit:
https://codeberg.org/soundtouch/soundtouch/commit/d11a3adb2daddcdfafac2d86ec8de3b3f41d2f78

Updated _SITE:
https://codeberg.org/soundtouch/soundtouch/commit/d063c0d9f9d29ef1f3302fbdee2f11f997bb2bce

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsoundtouch/libsoundtouch.hash | 4 ++--
 package/libsoundtouch/libsoundtouch.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
index fe6a108e33..9de72521bd 100644
--- a/package/libsoundtouch/libsoundtouch.hash
+++ b/package/libsoundtouch/libsoundtouch.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f1ce96bac35779d3b752f4cc8696975b3d58f3deb9db47ffc45862767c2a2bdd  libsoundtouch-2.2.tar.gz
-sha256  6b73f6327136a924821ec044bbd9f17cf8677faf2f2a2b1366a9fff6188c9688  COPYING.TXT
+sha256  6900996607258496ce126924a19fe9d598af9d892cf3f33d1e4daaa9b42ae0b1  soundtouch-2.3.1.tar.gz
+sha256  84c6d82dc7de80f5b73f231edfd3ddc5b53513908117452bfa37ea36bb4b7e0a  COPYING.TXT
diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index 8a0e807d7a..c372c32ac7 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBSOUNDTOUCH_VERSION = 2.2
-LIBSOUNDTOUCH_SITE = $(call gitlab,soundtouch,soundtouch,$(LIBSOUNDTOUCH_VERSION))
+LIBSOUNDTOUCH_VERSION = 2.3.1
+LIBSOUNDTOUCH_SOURCE = soundtouch-$(LIBSOUNDTOUCH_VERSION).tar.gz
+LIBSOUNDTOUCH_SITE = https://www.surina.net/soundtouch
 LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
 LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
 LIBSOUNDTOUCH_AUTORECONF = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
