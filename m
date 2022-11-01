Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6033C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 17:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45B9C409EF;
	Tue,  1 Nov 2022 17:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45B9C409EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vXCPikeasn6i; Tue,  1 Nov 2022 17:00:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECF4A40919;
	Tue,  1 Nov 2022 17:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECF4A40919
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 566FB1BF859
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 17:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31B2040445
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 17:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31B2040445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Md9i52B-jWvO for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 17:00:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B93E400D2
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B93E400D2
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 17:00:50 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout05.t-online.de (Postfix) with SMTP id 8B96B1D5AE;
 Tue,  1 Nov 2022 18:00:47 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.183.139]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1opud5-28GWW10; Tue, 1 Nov 2022 18:00:47 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:36288)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1opud5-0001NY-05;
 Tue, 01 Nov 2022 18:00:47 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 18:00:46 +0100
Message-Id: <20221101170046.2122339-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667322047-C3FF99D3-BB9BFBAB/0/0 CLEAN NORMAL
X-TOI-MSGID: c08c2f1f-0d22-4285-a8cd-da9f8be3d8d7
Subject: [Buildroot] [PATCH 1/1] package/intel-gmmlib: bump version to 22.3.0
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

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-gmmlib/0001-Drop-hardening-related-flags.patch | 2 +-
 package/intel-gmmlib/intel-gmmlib.hash                       | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk                         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch b/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
index c429df6581..b63d82f3c8 100644
--- a/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
+++ b/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
@@ -15,7 +15,7 @@ diff --git a/Source/GmmLib/Linux.cmake b/Source/GmmLib/Linux.cmake
 index 1a09bc4..b28fc1b 100644
 --- a/Source/GmmLib/Linux.cmake
 +++ b/Source/GmmLib/Linux.cmake
-@@ -99,7 +99,6 @@ SET (GMMLIB_COMPILER_FLAGS_COMMON
+@@ -97,7 +97,6 @@ SET (GMMLIB_COMPILER_FLAGS_COMMON
      -DUSE_SSE3
      -DUSE_SSSE3
      # Other common flags
diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index bfff5e4b82..490ff46dfc 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  363084a52db1557f6e7409278c8ce46a66fcafa2b4672e399c452501a60b4437  intel-gmmlib-22.2.1.tar.gz
+sha256  c1f33e1519edfc527127baeb0436b783430dfd256c643130169a3a71dc86aff9  intel-gmmlib-22.3.0.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index e949176cf7..ee5b60ab6b 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.2.1
+INTEL_GMMLIB_VERSION = 22.3.0
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
