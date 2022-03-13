Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBE8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEC4240545;
	Sun, 13 Mar 2022 09:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8mRHgRcMeRR8; Sun, 13 Mar 2022 09:52:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9260A401E1;
	Sun, 13 Mar 2022 09:52:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E546E1BF2A6
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD30340156
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nMq6t4LSe_W3 for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:52:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 962C5401E1
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:52:13 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout10.t-online.de (Postfix) with SMTP id 76A8718B86;
 Sun, 13 Mar 2022 10:52:10 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.92]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nTKtS-0vdOYD0; Sun, 13 Mar 2022 10:52:07 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:59896)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nTKtS-00013I-Dt;
 Sun, 13 Mar 2022 10:52:06 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 10:52:05 +0100
Message-Id: <20220313095206.1266409-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220313095206.1266409-1-bernd.kuhls@t-online.de>
References: <20220313095206.1266409-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647165127-0000B8A1-590AFD0C/0/0 CLEAN NORMAL
X-TOI-MSGID: fb74f4d0-878d-4e8d-b07a-bbe4b96fd41e
Subject: [Buildroot] [PATCH 2/3] package/intel-mediadriver: bump version to
 22.2.2
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 7c615620ae..044b9d7013 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1a0277306d7bb3a1e20c7693ff090fa4ae5c0b68981aa13452ed1c6df9062854  intel-media-22.2.1.tar.gz
+sha256  b74227ab165fdb09f184968589129dbf29bf382b44b415dd69db9e612f551345  intel-media-22.2.2.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 4895c1535d..84eda811ae 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,8 +6,8 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 22.2.1
-INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
+INTEL_MEDIADRIVER_VERSION = 22.2.2
+INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
 INTEL_MEDIADRIVER_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
