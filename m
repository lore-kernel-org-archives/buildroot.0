Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0096DCAC5B8
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 19:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A37C661617;
	Mon,  6 Oct 2025 19:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAEPWsbZly4w; Mon,  6 Oct 2025 19:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFEDA615BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFEDA615BA;
	Mon,  6 Oct 2025 19:46:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D372119
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 19:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30226615BA
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 19:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 98EFqqT8opSL for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 19:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85DF4614A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85DF4614A4
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 19:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 741C486997; Mon,  6 Oct 2025 19:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Oct 2025 21:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88f7fed5f2ce041be72c6f1576120b4b3b434298
X-Git-Newrev: 81772044a075ddfd892a4ce49f108998c3f7ffef
X-Patchwork-Hint: ignore
Message-Id: <20251006194644.741C486997@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fcft: bump to version 3.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=81772044a075ddfd892a4ce49f108998c3f7ffef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://codeberg.org/dnkl/fcft/src/tag/3.3.2/CHANGELOG.md#3-3-2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: update release note URL to use tag]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fcft/fcft.hash | 2 +-
 package/fcft/fcft.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fcft/fcft.hash b/package/fcft/fcft.hash
index d95111d4fa..f5a499edcc 100644
--- a/package/fcft/fcft.hash
+++ b/package/fcft/fcft.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f18bf79562e06d41741690cd1e07a02eb2600ae39eb5752eef8a698f603a482c  3.3.1.tar.gz
+sha256  79e52aaafc0b57fa2b68ed6127de13e98318050399a939691b8ca30d44d48591  3.3.2.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/fcft/fcft.mk b/package/fcft/fcft.mk
index 5fe38b5bb2..b9ce43b454 100644
--- a/package/fcft/fcft.mk
+++ b/package/fcft/fcft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FCFT_VERSION = 3.3.1
+FCFT_VERSION = 3.3.2
 FCFT_SOURCE = $(FCFT_VERSION).tar.gz
 FCFT_SITE = https://codeberg.org/dnkl/fcft/archive
 FCFT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
