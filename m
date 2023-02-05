Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D156C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 08:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A1A54010F;
	Sun,  5 Feb 2023 08:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A1A54010F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jd1ZXLEYZ3DP; Sun,  5 Feb 2023 08:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC4CB40106;
	Sun,  5 Feb 2023 08:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC4CB40106
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0B21BF20B
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 08:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9B81400F3
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 08:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9B81400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5aZzf7uXVGnv for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 08:16:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85541400D7
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85541400D7
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 08:16:33 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout04.t-online.de (Postfix) with SMTP id 42EA920ACB;
 Sun,  5 Feb 2023 09:16:20 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.195.67]) by fwd83.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pOaCA-1tlsgb0; Sun, 5 Feb 2023 09:16:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:34828)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pOaCA-0008Sg-0N;
 Sun, 05 Feb 2023 09:16:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 09:16:16 +0100
Message-Id: <20230205081617.113018-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205081617.113018-1-bernd.kuhls@t-online.de>
References: <20230205081617.113018-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675584978-23FFC378-E346FC51/0/0 CLEAN NORMAL
X-TOI-MSGID: 78310a1d-af90-43fe-a494-d7780327c0e5
Subject: [Buildroot] [PATCH 2/3] package/sofia-sip: bump version to 1.13.12
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to github helper due to lack of upstream-provided tarball.

Needed for upcoming bump of freeswitch to version 1.10.9.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sofia-sip/sofia-sip.hash | 2 +-
 package/sofia-sip/sofia-sip.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index 776136bb15..4617725571 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  daf75c41408c559c2d58a8fd4d39be4a8ff5144bc1db220d4dbc28deeed6670a  sofia-sip-1.13.9-f6ee306084.tar.gz
+sha256  03dda8653367501b7b1188a6b6513416902372e27475553de9318ee89ac390ff  sofia-sip-1.13.12.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 9071d964e4..59c365365b 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.9
-SOFIA_SIP_SOURCE = sofia-sip-$(SOFIA_SIP_VERSION)-f6ee306084.tar.gz
-SOFIA_SIP_SITE = https://files.freeswitch.org/downloads/libs/sofia-sip
+SOFIA_SIP_VERSION = 1.13.12
+SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
 SOFIA_SIP_INSTALL_STAGING = YES
+# Fetched from github, no pre-generated configure script provided
+SOFIA_SIP_AUTORECONF = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
 SOFIA_SIP_LICENSE = LGPL-2.1+
 SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
