Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B07AC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 10:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5377D8130B;
	Sun,  7 May 2023 10:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5377D8130B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbXR94Pl7yI4; Sun,  7 May 2023 10:38:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FA2481285;
	Sun,  7 May 2023 10:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA2481285
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E4511BF863
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DEC882077
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DEC882077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CnBVP_S_N9B0 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 10:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A11C2820EF
 for <buildroot@buildroot.org>; Sun,  7 May 2023 10:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A11C2820EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90B2885EEA; Sun,  7 May 2023 10:37:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 12:29:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efa3bdcdba716e1a3370f08e8c8cfc4c1f1e2093
X-Git-Newrev: a916182beedacb2f91a61855e7d43220be14efc0
X-Patchwork-Hint: ignore
Message-Id: <20230507103723.90B2885EEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-*: mass version
 bump to Nexus
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a916182beedacb2f91a61855e7d43220be14efc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash    | 2 +-
 package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk  | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash                | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk                  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
index 888c0ca918..7dbcee6585 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4693793a44b54204884c676a285bd371b354c426162736e5adae4ad2aa6088cf  kodi-inputstream-ffmpegdirect-19.0.3-Matrix.tar.gz
+sha256  a849b6b4d5ce740ec3552d244acc4c7a4d64792358428f5154236052473d5734  kodi-inputstream-ffmpegdirect-20.5.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
index 39347010b5..ff66f13e14 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 19.0.3-Matrix
+KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 20.5.0-Nexus
 KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index 62a1c261a2..affe8b5171 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8ed3db36f9ef667295fbce8fb2be6f032039e3d0e18e34677ed17de11be8a6e8  kodi-inputstream-rtmp-19.0.1-Matrix.tar.gz
+sha256  6a6129dca822e1447c0945ddf9cc6dbff1203dab313395d27efb4669a0ef3370  kodi-inputstream-rtmp-20.3.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index b719a6ab2e..f496fd3881 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = 19.0.1-Matrix
+KODI_INPUTSTREAM_RTMP_VERSION = 20.3.0-Nexus
 KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
