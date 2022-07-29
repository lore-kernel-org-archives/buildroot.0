Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EF2C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 18:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 583AC60F69;
	Fri, 29 Jul 2022 18:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 583AC60F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9QiVI-UNMsH; Fri, 29 Jul 2022 18:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CEEF610CD;
	Fri, 29 Jul 2022 18:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CEEF610CD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2768B1C11A5
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10E2C404D5
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10E2C404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYUHtSjGH_px for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 18:00:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0A8F40298
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0A8F40298
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 18:00:03 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout02.t-online.de (Postfix) with SMTP id AD99D1FB;
 Fri, 29 Jul 2022 19:59:47 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.206.67]) by fwd74.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oHUH4-2lqSxt0; Fri, 29 Jul 2022 19:59:46 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:57396)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oHUH3-00044K-31;
 Fri, 29 Jul 2022 19:59:46 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 19:59:44 +0200
Message-Id: <20220729175945.362462-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729175945.362462-1-bernd.kuhls@t-online.de>
References: <20220729175945.362462-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1659117586-0144CE29-3241637F/0/0 CLEAN NORMAL
X-TOI-MSGID: 818298c0-7b35-4b66-a9f5-6ff07f7c7687
Subject: [Buildroot] [PATCH 2/3] package/intel-mediadriver: bump version to
 22.5.1
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
 .../0001-Fix-uClibc-build.patch                | 18 +++++++++---------
 .../intel-mediadriver/intel-mediadriver.hash   |  2 +-
 package/intel-mediadriver/intel-mediadriver.mk |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/intel-mediadriver/0001-Fix-uClibc-build.patch b/package/intel-mediadriver/0001-Fix-uClibc-build.patch
index 2a14a260d0..97919d0632 100644
--- a/package/intel-mediadriver/0001-Fix-uClibc-build.patch
+++ b/package/intel-mediadriver/0001-Fix-uClibc-build.patch
@@ -1,6 +1,6 @@
 From 2007edc683499d2e82772f84241b453bdf319372 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Fri, 10 Jun 2022 18:42:34 +0200
+Date: Fri, 29 Jul 2022 19:51:39 +0200
 Subject: [PATCH] Fix uClibc build
 
 uClibc does not provide execinfo.h
@@ -14,7 +14,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  2 files changed, 10 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8305acfdb..6bec00f7d 100755
+index 053904748..4a3f0869e 100755
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -53,6 +53,12 @@ option (BUILD_CMRTLIB "Build and Install cmrtlib together with media driver" ON)
@@ -31,20 +31,20 @@ index 8305acfdb..6bec00f7d 100755
  
  if (BUILD_CMRTLIB AND NOT CMAKE_WDDM_LINUX)
 diff --git a/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp b/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
-index ff0b68655..8ea621f0e 100644
+index bde216b83..120b02d55 100644
 --- a/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
 +++ b/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
-@@ -51,7 +51,9 @@
+@@ -34,7 +34,9 @@
  #include <signal.h>
  #include <unistd.h>  // fork
  #include <algorithm>
 +#ifdef HAVE_EXECINFO
  #include <execinfo.h> // backtrace
 +#endif
- 
- const char           *MosUtilitiesSpecificNext::m_szUserFeatureFile     = USER_FEATURE_FILE;
- MOS_PUF_KEYLIST      MosUtilitiesSpecificNext::m_ufKeyList              = nullptr;
-@@ -2492,6 +2494,7 @@ void MosUtilities::MosTraceEvent(
+ #include <sys/types.h>
+ #include <sys/stat.h>  // fstat
+ #include <sys/ipc.h>  // System V IPC
+@@ -2473,6 +2475,7 @@ void MosUtilities::MosTraceEvent(
                  MOS_FreeMemory(pTraceBuf);
              }
          }
@@ -52,7 +52,7 @@ index ff0b68655..8ea621f0e 100644
          if (m_mosTraceFilter & (1ULL << TR_KEY_CALL_STACK))
          {
              // reserve space for header and stack size field.
-@@ -2511,6 +2514,7 @@ void MosUtilities::MosTraceEvent(
+@@ -2492,6 +2495,7 @@ void MosUtilities::MosTraceEvent(
                  size_t ret = write(MosUtilitiesSpecificNext::m_mosTraceFd, traceBuf, nLen);
              }
          }
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 9a7944860e..890f48029e 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7cfa02442711f4ffa7fc1bd6effda49446a005422a3db4083bbc1a621815f672  intel-media-22.5.0.tar.gz
+sha256  17905258374dafe2051073fee5722527c6b756c111b2962af051b37d1fc0df56  intel-media-22.5.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index b11dc07d14..606bab5f06 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 22.5.0
+INTEL_MEDIADRIVER_VERSION = 22.5.1
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
