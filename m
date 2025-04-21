Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0B0C369D3
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 09:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9896A8130D;
	Mon, 21 Apr 2025 09:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CV_d0SWYyY_w; Mon, 21 Apr 2025 09:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B562E8135C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B562E8135C;
	Mon, 21 Apr 2025 09:50:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 172B01C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EBC540680
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwJW9BCKyiEQ for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 09:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CFB54071E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CFB54071E
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:50:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39B8885F0D; Mon, 21 Apr 2025 09:50:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 10:44:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34fdd488bd1684f906568f0c630f9fec5abaf330
X-Git-Newrev: 56b441825b0a905f7806c0338efdb5a6aea7638b
X-Patchwork-Hint: ignore
Message-Id: <20250421095000.39B8885F0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtkmm3: bump to version 3.24.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=56b441825b0a905f7806c0338efdb5a6aea7638b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/gtkmm/-/blob/3.24.10/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gtkmm3/gtkmm3.hash | 4 ++--
 package/gtkmm3/gtkmm3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
index 9bfd68e027..3671a1d001 100644
--- a/package/gtkmm3/gtkmm3.hash
+++ b/package/gtkmm3/gtkmm3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.8.sha256sum
-sha256  d2940c64922e5b958554b23d4c41d1839ea9e43e0d2e5b3819cfb46824a098c4  gtkmm-3.24.8.tar.xz
+# From https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.10.sha256sum
+sha256  7ab7e2266808716e26c39924ace1fb46da86c17ef39d989624c42314b32b5a76  gtkmm-3.24.10.tar.xz
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index f4fc54849c..5a7e494bf7 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GTKMM3_VERSION_MAJOR = 3.24
-GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).8
+GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).10
 GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
 GTKMM3_SITE = https://download.gnome.org/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
 GTKMM3_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
