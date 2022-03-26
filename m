Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63F4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Mar 2022 14:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F100405B6;
	Sat, 26 Mar 2022 14:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mouI8GiVSSdf; Sat, 26 Mar 2022 14:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BA7940493;
	Sat, 26 Mar 2022 14:20:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8EF41BF983
 for <buildroot@lists.busybox.net>; Sat, 26 Mar 2022 14:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5EE5403FD
 for <buildroot@lists.busybox.net>; Sat, 26 Mar 2022 14:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EoHs6cyNs81v for <buildroot@lists.busybox.net>;
 Sat, 26 Mar 2022 14:20:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 592A1400E5
 for <buildroot@buildroot.org>; Sat, 26 Mar 2022 14:20:10 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout02.t-online.de (Postfix) with SMTP id CFA175CB9;
 Sat, 26 Mar 2022 15:20:07 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.205.42]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nY7Gx-1vtsA50; Sat, 26 Mar 2022 15:20:07 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:41766)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nY7Gx-00016l-2u;
 Sat, 26 Mar 2022 15:20:07 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 26 Mar 2022 15:20:06 +0100
Message-Id: <20220326142007.864294-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220326142007.864294-1-bernd.kuhls@t-online.de>
References: <20220326142007.864294-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1648304407-00013579-DDF0186E/0/0 CLEAN NORMAL
X-TOI-MSGID: ac800cfb-4a35-4a12-a974-a7523a84af92
Subject: [Buildroot] [PATCH v2 2/3] package/intel-gmmlib: bump version to
 22.1.2
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: bump version to 22.1.2

 package/intel-gmmlib/0001-Drop-hardening-related-flags.patch | 2 +-
 package/intel-gmmlib/intel-gmmlib.hash                       | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk                         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch b/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
index 581afd9066..c429df6581 100644
--- a/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
+++ b/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
@@ -15,7 +15,7 @@ diff --git a/Source/GmmLib/Linux.cmake b/Source/GmmLib/Linux.cmake
 index 1a09bc4..b28fc1b 100644
 --- a/Source/GmmLib/Linux.cmake
 +++ b/Source/GmmLib/Linux.cmake
-@@ -62,7 +62,6 @@ SET (GMMLIB_COMPILER_FLAGS_COMMON
+@@ -99,7 +99,6 @@ SET (GMMLIB_COMPILER_FLAGS_COMMON
      -DUSE_SSE3
      -DUSE_SSSE3
      # Other common flags
diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index beb3cfd6ae..5e48238448 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d70ffc76e9dd7c533f4f3cd829da3a6df00b86418f78f057051d5e7cf208bc8d  intel-gmmlib-22.0.3.tar.gz
+sha256  3b9a6d5e7e3f5748b3d0a2fb0e980ae943907fece0980bd9c0508e71c838e334  intel-gmmlib-22.1.2.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 06628132a2..25cc733e0c 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.0.3
+INTEL_GMMLIB_VERSION = 22.1.2
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
