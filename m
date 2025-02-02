Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAE9C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C7167077A;
	Fri, 28 Feb 2025 17:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtM0lFiczvdE; Fri, 28 Feb 2025 17:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6655970929
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6655970929;
	Fri, 28 Feb 2025 17:07:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D07668
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BB3942EF9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKfO9o0MHmQN for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0500042EFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0500042EFB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01F2684767; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 2 Feb 2025 12:35:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e68eeacef9d3653bd374f48b08809c2239353a0d
X-Git-Newrev: 2d9ccb307a5fddf476ed03c6add76238f9aac08d
X-Patchwork-Hint: ignore
Message-Id: <20250228163024.01F2684767@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libg7221: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d9ccb307a5fddf476ed03c6add76238f9aac08d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libg7221/libg7221.hash | 2 +-
 package/libg7221/libg7221.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libg7221/libg7221.hash b/package/libg7221/libg7221.hash
index b467438bae..1d3bcc2b77 100644
--- a/package/libg7221/libg7221.hash
+++ b/package/libg7221/libg7221.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c0162993e0af557e05b9000e082f6a755e54a6c20a88e2ab725ed5068b4c4ff6  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34.tar.gz
+sha256  44ebe717888f1c4d65dd0f6abecbccd96b642c49f2e472e6436ec530582f6103  libg7221-97d7ff5cf508fb6584a43b9e0c09220f8765cb3b.tar.gz
 sha256  26cc5f718279b45dbe34e25a2d29b2c8ca487bd9ab11b2d68c9318ff59d5c645  COPYING
diff --git a/package/libg7221/libg7221.mk b/package/libg7221/libg7221.mk
index b62a3b8b84..0e62a9b1f4 100644
--- a/package/libg7221/libg7221.mk
+++ b/package/libg7221/libg7221.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBG7221_VERSION = dbfc29d4806ecdace50379a2f4d68a992a6fec34
+LIBG7221_VERSION = 97d7ff5cf508fb6584a43b9e0c09220f8765cb3b
 # we use the FreeSwitch fork because it contains pkgconf support
 LIBG7221_SITE = $(call github,freeswitch,libg7221,$(LIBG7221_VERSION))
 LIBG7221_LICENSE = Polycom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
