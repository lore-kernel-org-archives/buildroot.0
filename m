Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F209CAC5B0
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 19:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60CF7804C2;
	Mon, 29 Sep 2025 19:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNb945Gce34r; Mon, 29 Sep 2025 19:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90B7B80483
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90B7B80483;
	Mon, 29 Sep 2025 19:14:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A61D12D
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C765409FE
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcTgOQOERf2d for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 19:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20CAF409C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20CAF409C9
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:14:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F77786466; Mon, 29 Sep 2025 19:14:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Sep 2025 21:12:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49974951907e9d115e556043efeae1334fddf90f
X-Git-Newrev: 65c8f868e4d2da35164fa2905b73a0c3fe52ed0a
X-Patchwork-Hint: ignore
Message-Id: <20250929191424.0F77786466@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/enet: bump to version 1.3.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=65c8f868e4d2da35164fa2905b73a0c3fe52ed0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://github.com/lsalzman/enet/blob/v1.3.18/ChangeLog

Update file hash due to update license dates:
https://github.com/lsalzman/enet/commit/2662c0de09e36f2a2030ccc2c528a3e4c9e8138a

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/enet/enet.hash | 4 ++--
 package/enet/enet.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enet/enet.hash b/package/enet/enet.hash
index 2643878ca9..88c19ff897 100644
--- a/package/enet/enet.hash
+++ b/package/enet/enet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a38f0f194555d558533b8b15c0c478e946310022d0ec7b34334e19e4574dcedc  enet-1.3.17.tar.gz
-sha256  77f94e3be39938801163844b8bf9a4f12badcc0da136e9886e7da14a816d74d3  LICENSE
+sha256  2a8a0c5360d68bb4fcd11f2e4c47c69976e8d2c85b109dd7d60b1181a4f85d36  enet-1.3.18.tar.gz
+sha256  a29cd246638974da7c6edf423a0a69d4a6f7d759940b7cfa9a2bc3442ac3834c  LICENSE
diff --git a/package/enet/enet.mk b/package/enet/enet.mk
index e2feb26b54..71e6dad39a 100644
--- a/package/enet/enet.mk
+++ b/package/enet/enet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENET_VERSION = 1.3.17
+ENET_VERSION = 1.3.18
 ENET_SITE = http://enet.bespin.org/download
 ENET_LICENSE = MIT
 ENET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
