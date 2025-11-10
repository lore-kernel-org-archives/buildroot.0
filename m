Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A39CCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 19:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 918EF81826;
	Mon, 10 Nov 2025 19:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCaYMviGiLm8; Mon, 10 Nov 2025 19:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F6D8817AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F6D8817AD;
	Mon, 10 Nov 2025 19:08:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4473C25D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29AB14057B
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzNGKnyUlHqd for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 19:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70F8D40580
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70F8D40580
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AE9E843A2; Mon, 10 Nov 2025 19:07:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Nov 2025 19:25:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94cc48508333c95511dddfc8e6f041d062759d99
X-Git-Newrev: e61c5385c226b9964519fd6bcb0cd386b62c9f12
X-Patchwork-Hint: ignore
Message-Id: <20251110190753.5AE9E843A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxcrypt: bump version to 4.5.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e61c5385c226b9964519fd6bcb0cd386b62c9f12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSING hash updated due to the addition of new cryptographic algorithm source file names.

Release notes:
https://github.com/besser82/libxcrypt/releases/tag/v4.5.1
https://github.com/besser82/libxcrypt/releases/tag/v4.5.0

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxcrypt/libxcrypt.hash | 6 +++---
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index 88abb79ee0..af46fbb11e 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,6 +1,6 @@
-# From https://github.com/besser82/libxcrypt/releases/download/v4.4.38/libxcrypt-4.4.38.tar.xz.sha256sum
-sha256  80304b9c306ea799327f01d9a7549bdb28317789182631f1b54f4511b4206dd6  libxcrypt-4.4.38.tar.xz
+# From https://github.com/besser82/libxcrypt/releases/download/v4.5.1/libxcrypt-4.5.1.tar.xz.sha256sum
+sha256  e9b46a62397c15372935f6a75dc3929c62161f2620be7b7f57f03d69102c1a86  libxcrypt-4.5.1.tar.xz
 
 # Locally calculated
-sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
+sha256  9144e66d8140feb84f0e4e344906ac425378896320032e0248567ef195cf0135  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index c2b2ed3e4a..cb4924e0ff 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.38
+LIBXCRYPT_VERSION = 4.5.1
 LIBXCRYPT_SITE = https://github.com/besser82/libxcrypt/releases/download/v$(LIBXCRYPT_VERSION)
 LIBXCRYPT_SOURCE = libxcrypt-$(LIBXCRYPT_VERSION).tar.xz
 LIBXCRYPT_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
