Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C38C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:09:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9157760FE7
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9157760FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6784D83487;
	Fri, 30 Jul 2021 14:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5UleR96-4Dj; Fri, 30 Jul 2021 14:09:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3F6383A5F;
	Fri, 30 Jul 2021 14:09:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0058F1BF377
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0EE540226
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8mYojuYfCoj for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 14:09:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF4F0400E5
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 14:09:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7817C838DF; Fri, 30 Jul 2021 13:34:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 16:07:12 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5d050e12e4e65a068b9d9907978bf383c135d8b1
X-Git-Newrev: 49cb1aa62613c88390ed952b860e4a27d50f5ef0
X-Patchwork-Hint: ignore
Message-Id: <20210730133421.7817C838DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libgtk3: bump to
 version 3.24.29
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=49cb1aa62613c88390ed952b860e4a27d50f5ef0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Bugfix release. For details, see the NEWS file:
https://github.com/GNOME/gtk/blob/3.24.29/NEWS

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 767ed6b72e15e4f900a5b1356db1dfbf1579864f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/0001-no-gtk-doc.patch | 2 +-
 package/libgtk3/libgtk3.hash          | 4 ++--
 package/libgtk3/libgtk3.mk            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgtk3/0001-no-gtk-doc.patch b/package/libgtk3/0001-no-gtk-doc.patch
index db15c6cba7..e1d3208022 100644
--- a/package/libgtk3/0001-no-gtk-doc.patch
+++ b/package/libgtk3/0001-no-gtk-doc.patch
@@ -14,7 +14,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
 --- a/gtk-doc.make
 +++ b/gtk-doc.make
-@@ -299,7 +299,7 @@
+@@ -300,7 +300,7 @@
  #
  # Require gtk-doc when making dist
  #
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 22cf16dad7..d5638780de 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.24.sha256sum
-sha256  cc9d4367c55b724832f6b09ab85481738ea456871f0381768a6a99335a98378a  gtk+-3.24.24.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.29.sha256sum
+sha256  f57ec4ade8f15cab0c23a80dcaee85b876e70a8823d9105f067ce335a8268caa  gtk+-3.24.29.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 9ece409ba3..0c40bff80e 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).24
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).29
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
