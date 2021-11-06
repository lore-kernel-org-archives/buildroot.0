Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70144C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 11:14:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C947461054
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 11:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C947461054
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 847CF40010;
	Sat,  6 Nov 2021 11:14:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNA-oHP72vmi; Sat,  6 Nov 2021 11:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B47F400CC;
	Sat,  6 Nov 2021 11:14:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD9201BF83E
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 11:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9ECF6F94D
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 11:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RiJbRffu1LbZ for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 11:14:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE05E60B5A
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 11:14:38 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout05.t-online.de (Postfix) with SMTP id 6EEF09C20;
 Sat,  6 Nov 2021 12:11:57 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.204.142]) by fwd78.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mjJbu-3bc3oP0; Sat, 6 Nov 2021 12:11:46 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:40884)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mjJbu-0001oX-3j;
 Sat, 06 Nov 2021 12:11:46 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 12:11:44 +0100
Message-Id: <20211106111145.1648068-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211106111145.1648068-1-bernd.kuhls@t-online.de>
References: <20211106111145.1648068-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636197106-0000146A-2887B29E/0/0 CLEAN NORMAL
X-TOI-MSGID: ada88ad4-8b56-4472-b7c1-929a3cf3ea74
Subject: [Buildroot] [PATCH v2 2/3] package/sofia-sip: bump version to 1.13.6
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

Needed to bump freeswitch to 1.10.7.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes, added libks to v2 of this patch series

 package/sofia-sip/sofia-sip.hash | 2 +-
 package/sofia-sip/sofia-sip.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index 0484cc1501..6f6ff6d052 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b539444a5d03e281b829ee9133ae9e717f2d2a03399808365e5ab85574e25d95  sofia-sip-1.13.3-8071e8accd.tar.gz
+sha256  d39a3287038f1c9a747c1abc94a1379a726a9dfaf969285f955141883f7b810f  sofia-sip-1.13.6-4152840260.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index fb565637eb..2bac480542 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.3-8071e8accd
-SOFIA_SIP_SITE = https://files.freeswitch.org/downloads/libs
+SOFIA_SIP_VERSION = 1.13.6-4152840260
+SOFIA_SIP_SITE = https://files.freeswitch.org/downloads/libs/sofia-sip
 SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
 SOFIA_SIP_LICENSE = LGPL-2.1+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
