Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9D1ECAAD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 20:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A9941794;
	Thu,  1 Sep 2022 20:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A9941794
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYAHi88jjgv2; Thu,  1 Sep 2022 20:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FB4D41677;
	Thu,  1 Sep 2022 20:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FB4D41677
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F54E1BF393
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7801A401E1
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7801A401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vh-_AkguuBie for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 20:12:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 712D840134
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 712D840134
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 20:12:26 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout12.t-online.de (Postfix) with SMTP id 0F8A21B09A;
 Thu,  1 Sep 2022 22:12:07 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.182.238]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oTqXl-0rmA090; Thu, 1 Sep 2022 22:12:05 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36488)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oTqXl-0003gc-05;
 Thu, 01 Sep 2022 22:12:05 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  1 Sep 2022 22:12:02 +0200
Message-Id: <20220901201204.3514426-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901201204.3514426-1-bernd.kuhls@t-online.de>
References: <20220901201204.3514426-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1662063125-0144CFA9-F86ADB38/0/0 CLEAN NORMAL
X-TOI-MSGID: cb92c1a9-f118-4f8b-970b-07b762e4ad23
Subject: [Buildroot] [PATCH/next 1/3] package/daq3: bump version to 3.0.9
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/snort3/libdaq/releases/tag/v3.0.9

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/daq3/daq3.hash | 2 +-
 package/daq3/daq3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
index a97f81833b..4a24f98173 100644
--- a/package/daq3/daq3.hash
+++ b/package/daq3/daq3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  4281464c5502037669e69d314b628df863420f590c4999c5b567c8016cd1e658  daq3-3.0.5.tar.gz
+sha256  c0e8535533720a6df05ab884b7c8f5fb4222f3aac12bdc11829e08c79716d338  daq3-3.0.9.tar.gz
 
 # Hash for license files:
 sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index ed97615e61..6ecd1134c7 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAQ3_VERSION = 3.0.5
+DAQ3_VERSION = 3.0.9
 DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
 DAQ3_LICENSE = GPL-2.0
 DAQ3_LICENSE_FILES = COPYING LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
