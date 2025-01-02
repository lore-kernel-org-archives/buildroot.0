Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA7FE77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 13:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A3C740314;
	Thu,  2 Jan 2025 13:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jaeDeHmCtIz; Thu,  2 Jan 2025 13:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE2424068A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2424068A;
	Thu,  2 Jan 2025 13:30:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35C81F29
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD26640295
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jne5_dGfQDso for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 13:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DC40402EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DC40402EF
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 13:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AAD2837DF; Thu,  2 Jan 2025 13:29:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Jan 2025 14:19:27 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1bc589c515273a755a7afd65ac164f58260b6c81
X-Git-Newrev: af9f7bdd7c350ed7a9981421adc43b97cd8a87c2
X-Patchwork-Hint: ignore
Message-Id: <20250102132958.8AAD2837DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/gst1-plugins-good: bump version to 1.22.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=af9f7bdd7c350ed7a9981421adc43b97cd8a87c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

For various bugfixes. For details, see the release notes:

https://gstreamer.freedesktop.org/releases/1.22/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 84f8e7c18bfdcbab26b4fd52d5696992ce6d0bbe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 4410da6ef4..1e1b83e115 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.9.tar.xz.sha256sum
-sha256  26959fcfebfff637d4ea08ef40316baf31b61bb7729820b0684e800c3a1478b6  gst-plugins-good-1.22.9.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.12.tar.xz.sha256sum
+sha256  9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7  gst-plugins-good-1.22.12.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 2bb826d807..7ba2667792 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.22.9
+GST1_PLUGINS_GOOD_VERSION = 1.22.12
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
