Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6155EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1999861063;
	Tue,  3 May 2022 20:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKcfJtLmsOV3; Tue,  3 May 2022 20:31:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3592260F2E;
	Tue,  3 May 2022 20:31:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68E241BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 652AA60F2E
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3KK6Ddh0jtN for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:31:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFCD760EAF
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:31:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5A48E85369; Tue,  3 May 2022 20:20:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 22:20:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c4abd0e6151bf568a2c9bd6dbbfd87f65995410
X-Git-Newrev: 4dd01598c227c028c39c90b806e0ffa3b817cafe
X-Patchwork-Hint: ignore
Message-Id: <20220503202054.5A48E85369@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: bump to version 2.9.14
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4dd01598c227c028c39c90b806e0ffa3b817cafe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 81ac3e3f31..e67d3b0b8a 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.9/libxml2-2.9.13.sha256sum
-sha256  276130602d12fe484ecc03447ee5e759d0465558fbc9d6bd144e3745306ebf0e  libxml2-2.9.13.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.9/libxml2-2.9.14.sha256sum
+sha256  60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee  libxml2-2.9.14.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  COPYING
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 5382f28ec4..3647549a4b 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.9
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).13
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).14
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
