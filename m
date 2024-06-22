Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFC2C27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 16:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 420864057F;
	Sat, 22 Jun 2024 16:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPO20AJqkIK6; Sat, 22 Jun 2024 16:43:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F28DC40497
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F28DC40497;
	Sat, 22 Jun 2024 16:43:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 127791BF5DC
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 16:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1F7D606E5
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 16:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3yjmDEJnZbt for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 16:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1996A606C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1996A606C8
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 16:43:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4DE58268F; Sat, 22 Jun 2024 16:43:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 18:42:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 853b7661bf5ddca5d4b81964ef1a19a133beac85
X-Git-Newrev: d6b635db9bddd4ca7d4463c9c36d03bafe1ba71f
X-Patchwork-Hint: ignore
Message-Id: <20240622164301.B4DE58268F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.121
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d6b635db9bddd4ca7d4463c9c36d03bafe1ba71f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2024-June/003516.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index dd43a89d68..8b0f7c0d74 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2024-January/003441.html
-sha256  3bf55363f76c7250946441ab51d3a6cc0ae518055c0ff017324ab76cdefb327a  libdrm-2.4.120.tar.xz
-sha512  6dc16e5134a669eeb59debb1dc2d15b857483ab7476dc2b94bd05a32d8953f046f5656f6cf9e1a63e97e7156fb65ebb58b6a29fe45cb6326058baaf820626e70  libdrm-2.4.120.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-June/003516.html
+sha256  909084a505d7638887f590b70791b3bbd9069c710c948f5d1f1ce6d080cdfcab  libdrm-2.4.121.tar.xz
+sha512  cc8816d61884caa0e404348d1caeb0b2952fb50e1dc401716adfe08121096e2a67826db0bda0d8b163d67c5ee048870177670d5eac28a5abe5792d09ba77ab2e  libdrm-2.4.121.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index e0c1217b38..c87a225515 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.120
+LIBDRM_VERSION = 2.4.121
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
