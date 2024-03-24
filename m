Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BE6C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D866400E4;
	Sun, 24 Mar 2024 15:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYwXTvol6dJN; Sun, 24 Mar 2024 15:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCF3240608
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCF3240608;
	Sun, 24 Mar 2024 15:11:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A78D1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63F146075B
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAS26XY6TOMS for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE40605BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FE40605BB
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 695D583AE9; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:59:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e248a312b04a86881b5a243433a213bfd8eea057
X-Git-Newrev: 49384a0a01ad8b73ea1dc10043c3605d035933f8
X-Patchwork-Hint: ignore
Message-Id: <20240324151125.695D583AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtorrent-rasterbar: bump to
 version 1.2.19
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=49384a0a01ad8b73ea1dc10043c3605d035933f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/arvidn/libtorrent/releases/tag/v1.2.19
https://github.com/arvidn/libtorrent/releases/tag/v1.2.18
https://github.com/arvidn/libtorrent/releases/tag/v1.2.17
https://github.com/arvidn/libtorrent/releases/tag/v1.2.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libtorrent-rasterbar/libtorrent-rasterbar.hash | 2 +-
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
index 3f59642b72..b1abe85d84 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c8ad8638684c0a903ebabc30490079e31b1a6a638da2adec5a8bef6a0e62214b  libtorrent-rasterbar-1.2.15.tar.gz
+sha256  eee8e99548dc5eb5e643e49db9202f4f97112c032dba883dfdc8144af5b6e40e  libtorrent-rasterbar-1.2.19.tar.gz
 sha256  f3a5dd1558cce616b12edad521427ec8976ce2bb0af33f7f359cfa648bf55ad8  COPYING
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 085b38343c..6b497bbe58 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTORRENT_RASTERBAR_VERSION = 1.2.15
+LIBTORRENT_RASTERBAR_VERSION = 1.2.19
 LIBTORRENT_RASTERBAR_SITE = \
 	https://github.com/arvidn/libtorrent/releases/download/v$(LIBTORRENT_RASTERBAR_VERSION)
 LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
