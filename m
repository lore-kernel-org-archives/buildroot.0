Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8F1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 17:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA89E81452;
	Sun, 26 Dec 2021 17:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3mmQcixX1Xo; Sun, 26 Dec 2021 17:03:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36C3481435;
	Sun, 26 Dec 2021 17:03:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96FC31BF2BF
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 17:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92DC760DA0
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 17:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZK7XVPL-BK5u for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 17:03:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 989E660B8C
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 17:03:55 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout09.t-online.de (Postfix) with SMTP id B8824DC5B
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 18:02:59 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.0.156]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n1Wv3-3WL6f30; Sun, 26 Dec 2021 18:02:49 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:51412)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n1Wv3-0006R6-89
 for buildroot@buildroot.org; Sun, 26 Dec 2021 18:02:49 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 18:02:49 +0100
Message-Id: <20211226170249.614885-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640538169-00009E39-039E3FAF/0/0 CLEAN NORMAL
X-TOI-MSGID: ad56808a-f630-48b5-b6d6-2994b366cc7d
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 0.21.3
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
http://stellarium.org/release/2021/12/25/stellarium-0.21.3.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/stellarium/stellarium.hash | 4 ++--
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 4c949d6587..c3f2e0e8d4 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,5 +1,5 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha1  e61b66eae54888cf90f6dab7b49bc4ca6d9d941b   stellarium-0.21.2.tar.gz
-sha256  e588b66a173834f74a6462f5219ce4d38e8f87405b932267f6f1d2d4dbff4a82  stellarium-0.21.2.tar.gz
+sha1  a3396c403050e073c592da695faeb048c1d5e19b  stellarium-0.21.3.tar.gz
+sha256  8ac6c054d12f136fe0d5c0deaaa8d7b69dd2a462be1711a187364574aef97e7f  stellarium-0.21.3.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 810eb0541b..ca5c07b2a7 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.21.2
+STELLARIUM_VERSION = 0.21.3
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
