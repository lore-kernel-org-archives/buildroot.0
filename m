Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8532BCCA470
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 20:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B8816157D;
	Mon,  6 Oct 2025 20:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aw1JYx1VXpEC; Mon,  6 Oct 2025 20:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62B326156D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B326156D;
	Mon,  6 Oct 2025 20:38:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E52F272
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0460761528
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMTs28wqDr8l for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 20:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D7261488
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46D7261488
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:38:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4295C869A9; Mon,  6 Oct 2025 20:38:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Oct 2025 22:23:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a20dace711417fd377d1c0f40fad85b8265c988
X-Git-Newrev: 3c6440c1dd1f17e2ae8e084f79b6a1d549f7468d
X-Patchwork-Hint: ignore
Message-Id: <20251006203822.4295C869A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libidn2: bump version to 2.3.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c6440c1dd1f17e2ae8e084f79b6a1d549f7468d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://gitlab.com/libidn/libidn2/-/blob/v2.3.8/NEWS?ref_type=tags

Updated license hashes due to upstream commits:
https://gitlab.com/libidn/libidn2/-/commit/61ee87ee229c811bd9bf945084645058249b52cc
https://gitlab.com/libidn/libidn2/-/commit/1e863fa32b34c9df5b715c9f2fdf57895d9e31f7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libidn2/libidn2.hash | 8 ++++----
 package/libidn2/libidn2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
index 3d2a41a00e..412ec8804d 100644
--- a/package/libidn2/libidn2.hash
+++ b/package/libidn2/libidn2.hash
@@ -1,8 +1,8 @@
 # Calculated locally after checking signature
-sha256  4c21a791b610b9519b9d0e12b8097bf2f359b12f8dd92647611a929e6bfd7d64  libidn2-2.3.7.tar.gz
+sha256  f557911bf6171621e1f72ff35f5b1825bb35b52ed45325dcdee931e5d3c0787a  libidn2-2.3.8.tar.gz
 
 # Hash for license files:
-sha256  73483f797a83373fca1b968c11785b98c4fc4803cdc7d3210811ca8b075d6d76  COPYING
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSERv3
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSERv3
 sha256  01d621eef165cf4d3d3dbb737aa0699178d94c6f18cf87e9dde6db3ca7790f46  COPYING.unicode
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index 59db3662e4..00a87d46b8 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN2_VERSION = 2.3.7
+LIBIDN2_VERSION = 2.3.8
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN2_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
