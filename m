Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8224C27C76
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5468D60D95;
	Sat, 21 Jan 2023 13:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5468D60D95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpTcz3Cko13b; Sat, 21 Jan 2023 13:24:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A76161052;
	Sat, 21 Jan 2023 13:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A76161052
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF8651BF40B
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86E054061C
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86E054061C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6_-XpQCa85C for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D2614011C
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D2614011C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A76986948; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:58:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a511e286d68e7abb9058421dda4c05e288f6cf4
X-Git-Newrev: abe3c7f81bba9fea46cc9ea379c6dbab624e447e
X-Patchwork-Hint: ignore
Message-Id: <20230121131610.6A76986948@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpeas: switch to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=abe3c7f81bba9fea46cc9ea379c6dbab624e447e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libpeas/libpeas.hash | 2 +-
 package/libpeas/libpeas.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpeas/libpeas.hash b/package/libpeas/libpeas.hash
index c503558f85..f69fd2945f 100644
--- a/package/libpeas/libpeas.hash
+++ b/package/libpeas/libpeas.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/GNOME/sources/libpeas/1.32/libpeas-1.32.0.sha256sum
+# From https://download.gnome.org/sources/libpeas/1.32/libpeas-1.32.0.sha256sum
 sha256  d625520fa02e8977029b246ae439bc218968965f1e82d612208b713f1dcc3d0e  libpeas-1.32.0.tar.xz
 # Locally calculated
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/libpeas/libpeas.mk b/package/libpeas/libpeas.mk
index 5550162e04..3d2e79452c 100644
--- a/package/libpeas/libpeas.mk
+++ b/package/libpeas/libpeas.mk
@@ -7,7 +7,7 @@
 LIBPEAS_VERSION_MAJOR = 1.32
 LIBPEAS_VERSION = $(LIBPEAS_VERSION_MAJOR).0
 LIBPEAS_SOURCE = libpeas-$(LIBPEAS_VERSION).tar.xz
-LIBPEAS_SITE = http://ftp.gnome.org/pub/gnome/sources/libpeas/$(LIBPEAS_VERSION_MAJOR)
+LIBPEAS_SITE = https://download.gnome.org/sources/libpeas/$(LIBPEAS_VERSION_MAJOR)
 LIBPEAS_LICENSE = LGPL-2.1+
 LIBPEAS_LICENSE_FILES = COPYING
 LIBPEAS_CPE_ID_VENDOR = gnome
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
