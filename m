Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D87AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2A78409F8;
	Sun, 13 Mar 2022 09:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGHuJLNrKKgf; Sun, 13 Mar 2022 09:52:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3DC8409F1;
	Sun, 13 Mar 2022 09:52:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2146C1BF2A6
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18EAB40474
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nk5dSIcNXfYZ for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:52:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97CF740156
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:52:12 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout08.t-online.de (Postfix) with SMTP id 4C8F4597E;
 Sun, 13 Mar 2022 10:52:09 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.92]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nTKtT-4GxAg50; Sun, 13 Mar 2022 10:52:07 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:59896)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nTKtS-00013I-HJ;
 Sun, 13 Mar 2022 10:52:06 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 10:52:06 +0100
Message-Id: <20220313095206.1266409-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220313095206.1266409-1-bernd.kuhls@t-online.de>
References: <20220313095206.1266409-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647165127-0001619A-330319FD/0/0 CLEAN NORMAL
X-TOI-MSGID: a09847be-b884-4189-a1d0-e063e8af346d
Subject: [Buildroot] [PATCH 3/3] package/intel-mediasdk: bump version to
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

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch | 2 +-
 package/intel-mediasdk/intel-mediasdk.hash                     | 2 +-
 package/intel-mediasdk/intel-mediasdk.mk                       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch b/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
index a7e3b70294..b3ecfc98b7 100644
--- a/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
+++ b/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
@@ -40,7 +40,7 @@ index 7e36ae2d..5b8b9b9d 100644
  #  message( STATUS "Libva located at: ${PKG_LIBVA_LIBRARY_DIRS}" )
  
    if( ARGV1 MATCHES hw AND Linux )
-@@ -445,7 +445,7 @@ function(configure_dependencies target dependencies variant)
+@@ -452,7 +452,7 @@ function(configure_dependencies target dependencies variant)
    endforeach()
  
    set(SCOPE_CFLAGS ${SCOPE_CFLAGS} PARENT_SCOPE)
diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
index ee4f317242..d9acf49637 100644
--- a/package/intel-mediasdk/intel-mediasdk.hash
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae56d4fe69856ff4e184a2863f23d0e861a16add225fd3e159a5440774d5c80a  intel-mediasdk-22.2.1.tar.gz
+sha256  3f8029e487aa163a9bf1061129fa1bf42ec85cd6a11014303d6d41e52463972f  intel-mediasdk-22.2.2.tar.gz
 sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index 7589ff9737..698d2348b2 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MEDIASDK_VERSION = 22.2.1
+INTEL_MEDIASDK_VERSION = 22.2.2
 INTEL_MEDIASDK_SITE = https://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
 INTEL_MEDIASDK_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
