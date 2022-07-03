Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A636C43334
	for <buildroot@archiver.kernel.org>; Sun,  3 Jul 2022 13:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05B3482E22;
	Sun,  3 Jul 2022 13:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05B3482E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QnhHPKwQ3npX; Sun,  3 Jul 2022 13:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F1D682DD9;
	Sun,  3 Jul 2022 13:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F1D682DD9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 623C31BF860
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 13:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B0C6606F2
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 13:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B0C6606F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rKxRXKCHfr9O for <buildroot@lists.busybox.net>;
 Sun,  3 Jul 2022 13:02:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47BAE606FF
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47BAE606FF
 for <buildroot@buildroot.org>; Sun,  3 Jul 2022 13:02:41 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout06.t-online.de (Postfix) with SMTP id C2B178C2A;
 Sun,  3 Jul 2022 15:02:38 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.181.254]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o7zF2-3OepxB0; Sun, 3 Jul 2022 15:02:25 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:42034)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o7zF2-0007Il-LM;
 Sun, 03 Jul 2022 15:02:24 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  3 Jul 2022 15:02:24 +0200
Message-Id: <20220703130224.100778-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1656853345-0143E336-5E74FDD3/0/0 CLEAN NORMAL
X-TOI-MSGID: c4072257-a7c0-4758-9259-4b0529612e09
Subject: [Buildroot] [PATCH 1/1] package/x264: bump version
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
Cc: David du Colombier <0intro@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x264/x264.hash | 2 +-
 package/x264/x264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index f1396279f8..f8b26b6910 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  58f39bf23a4e38ac3dd841a3f9ccf2aa16d2b0c35df9aecd9f3b5062780e5d74  x264-35417dcd65a57321fbadf98c9a4cff1cb741db4b-br1.tar.gz
+sha256  e83cda2a69e72bc45bcb14aa7ca5e689cf0f67dc29fc6f1dce63abe2a428fc01  x264-baee400fa9ced6f5481a728138fed6e867b0ff7f-br1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 9de618eb5e..97caf19466 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = 35417dcd65a57321fbadf98c9a4cff1cb741db4b
+X264_VERSION = baee400fa9ced6f5481a728138fed6e867b0ff7f
 X264_SITE = https://code.videolan.org/videolan/x264.git
 X264_SITE_METHOD = git
 X264_LICENSE = GPL-2.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
