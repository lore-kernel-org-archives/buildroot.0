Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE8EC02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 20:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1730C704BF;
	Fri, 17 Jan 2025 20:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJ8zTC1y4jrw; Fri, 17 Jan 2025 20:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 236B9704C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 236B9704C4;
	Fri, 17 Jan 2025 20:34:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 685E0B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55BE4704C0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tP2JYKUVHjl for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 20:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C2836FBAA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C2836FBAA
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:34:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D50D85D33; Fri, 17 Jan 2025 20:34:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Jan 2025 21:15:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6d54bc4e611eae28b6de5f1e7b9dcb5bd685c55
X-Git-Newrev: 4ccf7ec1ce7c9136d98623f1dd753e290c52e338
X-Patchwork-Hint: ignore
Message-Id: <20250117203422.7D50D85D33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxcrypt: bump version to 4.4.38
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ccf7ec1ce7c9136d98623f1dd753e290c52e338
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/besser82/libxcrypt/releases/tag/v4.4.38
https://github.com/besser82/libxcrypt/releases/tag/v4.4.37

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxcrypt/libxcrypt.hash | 4 ++--
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index 9bcf119077..88abb79ee0 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,5 +1,5 @@
-# From https://github.com/besser82/libxcrypt/releases/download/v4.4.36/libxcrypt-4.4.36.tar.xz.sha256sum
-sha256  e5e1f4caee0a01de2aee26e3138807d6d3ca2b8e67287966d1fefd65e1fd8943  libxcrypt-4.4.36.tar.xz
+# From https://github.com/besser82/libxcrypt/releases/download/v4.4.38/libxcrypt-4.4.38.tar.xz.sha256sum
+sha256  80304b9c306ea799327f01d9a7549bdb28317789182631f1b54f4511b4206dd6  libxcrypt-4.4.38.tar.xz
 
 # Locally calculated
 sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 60901988ac..c2b2ed3e4a 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.36
+LIBXCRYPT_VERSION = 4.4.38
 LIBXCRYPT_SITE = https://github.com/besser82/libxcrypt/releases/download/v$(LIBXCRYPT_VERSION)
 LIBXCRYPT_SOURCE = libxcrypt-$(LIBXCRYPT_VERSION).tar.xz
 LIBXCRYPT_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
