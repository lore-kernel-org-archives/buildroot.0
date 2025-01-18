Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA727C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 21:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37CCB611D6;
	Sat, 18 Jan 2025 21:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpHxPZQe-ype; Sat, 18 Jan 2025 21:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ACBE70499
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ACBE70499;
	Sat, 18 Jan 2025 21:27:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 450742F96
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2C2461030
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCvAf0KBXKb5 for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 21:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8676061090
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8676061090
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72F1585E34; Sat, 18 Jan 2025 21:27:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 22:12:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32c66b585fc844b3d20801b132840236247163dd
X-Git-Newrev: 9f887a660842cb589927d6b94f63ae92d8a47c2f
X-Patchwork-Hint: ignore
Message-Id: <20250118212722.72F1585E34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-imagedecoder-raw: bump
 version to 21.0.2-Omega
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f887a660842cb589927d6b94f63ae92d8a47c2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash | 2 +-
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
index 8f9451048c..98adf46a9b 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  451ce58acf377dd4758d78baf46f3e8c35d1e76b1a073744963f7a837f336707  kodi-imagedecoder-raw-7be9cf4d985c277f3a059f64873d81b24e6edd70.tar.gz
+sha256  421812f6ca8d70e6736c920935461b43f1338ee04a919dcf7e5f7ce1879b54e2  kodi-imagedecoder-raw-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
index 87699ffaca..989742a901 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_RAW_VERSION = 7be9cf4d985c277f3a059f64873d81b24e6edd70
+KODI_IMAGEDECODER_RAW_VERSION = 21.0.2-Omega
 KODI_IMAGEDECODER_RAW_SITE = $(call github,xbmc,imagedecoder.raw,$(KODI_IMAGEDECODER_RAW_VERSION))
 KODI_IMAGEDECODER_RAW_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_RAW_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
