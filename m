Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714AFCEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 22:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22AD183DC3;
	Mon, 17 Nov 2025 22:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOzXAOs6vxYW; Mon, 17 Nov 2025 22:19:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6749983D6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6749983D6F;
	Mon, 17 Nov 2025 22:19:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76EC5D5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 22:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66DB660DCF
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 22:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vYG-1qJLFIe for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 22:19:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91D826065C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91D826065C
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 22:19:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A70D84D67; Mon, 17 Nov 2025 22:19:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 23:18:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75a566edb4997ee603293bbb42d561b4ed10028e
X-Git-Newrev: a1f5023bd9f87731287ca92cd9cea5558a7a043b
X-Patchwork-Hint: ignore
Message-Id: <20251117221906.8A70D84D67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdecor: bump version to 0.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1f5023bd9f87731287ca92cd9cea5558a7a043b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit log:
https://gitlab.freedesktop.org/libdecor/libdecor/-/commits/0.2.4

Switched to xz tarball and hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libdecor/libdecor.hash | 3 ++-
 package/libdecor/libdecor.mk   | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libdecor/libdecor.hash b/package/libdecor/libdecor.hash
index 7572663466..69163f3227 100644
--- a/package/libdecor/libdecor.hash
+++ b/package/libdecor/libdecor.hash
@@ -1,3 +1,4 @@
+# From https://gitlab.freedesktop.org/libdecor/libdecor/-/releases/0.2.4/downloads/libdecor-0.2.4.tar.xz.sha256sum
+sha256  b17cf420e8dcb526bf82da5d36f8443a91fad0777083fa4ec5c1df8ee877416f  libdecor-0.2.4.tar.xz
 # Locally calculated
-sha256  21a471e3f48088d3fd8ecc5999c45258a32198782c0157482f7ebe82de42f79c  libdecor-0.2.3.tar.gz
 sha256  508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1  LICENSE
diff --git a/package/libdecor/libdecor.mk b/package/libdecor/libdecor.mk
index d064c9e9ef..26f4be40a6 100644
--- a/package/libdecor/libdecor.mk
+++ b/package/libdecor/libdecor.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBDECOR_VERSION = 0.2.3
-LIBDECOR_SITE = https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/$(LIBDECOR_VERSION)
+LIBDECOR_VERSION = 0.2.4
+LIBDECOR_SOURCE = libdecor-$(LIBDECOR_VERSION).tar.xz
+LIBDECOR_SITE = https://gitlab.freedesktop.org/libdecor/libdecor/-/releases/$(LIBDECOR_VERSION)/downloads
 LIBDECOR_LICENSE = MIT
 LIBDECOR_LICENSE_FILES = LICENSE
 LIBDECOR_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
