Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD76C28B28
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9D3F83ACC;
	Tue, 18 Mar 2025 15:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfAcasrlIf52; Tue, 18 Mar 2025 15:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1FB683A9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1FB683A9E;
	Tue, 18 Mar 2025 15:05:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74FBB16E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E64C40D96
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jG70m8E6PAOV for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE3674077A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE3674077A
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA20E85FD1; Tue, 18 Mar 2025 15:02:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Mar 2025 22:11:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b9a6f5373093ad8764ff48e0c4ec0beb791afa2
X-Git-Newrev: 2af019a1bd3e4d9d8a3600cf12682a14acb6e965
X-Patchwork-Hint: ignore
Message-Id: <20250318150243.AA20E85FD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsigc2: bump to version 2.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2af019a1bd3e4d9d8a3600cf12682a14acb6e965
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/libsigcplusplus/libsigcplusplus/blob/2.12.1/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libsigc2/libsigc2.hash | 4 ++--
 package/libsigc2/libsigc2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsigc2/libsigc2.hash b/package/libsigc2/libsigc2.hash
index 4811213568..e7bf7d4e7d 100644
--- a/package/libsigc2/libsigc2.hash
+++ b/package/libsigc2/libsigc2.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libsigc++/2.12/libsigc++-2.12.0.sha256sum
-sha256  1c466d2e64b34f9b118976eb21b138c37ed124d0f61497df2a90ce6c3d9fa3b5  libsigc++-2.12.0.tar.xz
+# From https://download.gnome.org/sources/libsigc++/2.12/libsigc++-2.12.1.sha256sum
+sha256  a9dbee323351d109b7aee074a9cb89ca3e7bcf8ad8edef1851f4cf359bd50843  libsigc++-2.12.1.tar.xz
 
 # Locally calculated
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libsigc2/libsigc2.mk b/package/libsigc2/libsigc2.mk
index 845d03ba85..b5685fd50a 100644
--- a/package/libsigc2/libsigc2.mk
+++ b/package/libsigc2/libsigc2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSIGC2_VERSION_MAJOR = 2.12
-LIBSIGC2_VERSION = $(LIBSIGC2_VERSION_MAJOR).0
+LIBSIGC2_VERSION = $(LIBSIGC2_VERSION_MAJOR).1
 LIBSIGC2_SOURCE = libsigc++-$(LIBSIGC2_VERSION).tar.xz
 LIBSIGC2_SITE = https://download.gnome.org/sources/libsigc++/$(LIBSIGC2_VERSION_MAJOR)
 LIBSIGC2_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
