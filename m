Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70AAC4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:39:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DD0960EBB
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DD0960EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BE9783A62;
	Tue,  3 Aug 2021 22:39:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OFofima8bq96; Tue,  3 Aug 2021 22:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCDC482BBA;
	Tue,  3 Aug 2021 22:39:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C0931BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 839784045A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rys-dy6iLuWj for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F70F40599
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 888D48750D; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 11:37:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b1af56fddc556973aada3f220812a3bcd386146f
X-Git-Newrev: 64ace4e5f146c34c3315c9c89659a3caeb3a657a
X-Patchwork-Hint: ignore
Message-Id: <20210803211025.888D48750D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgtk3: bump to
 version 3.24.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=64ace4e5f146c34c3315c9c89659a3caeb3a657a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgtk3/0002-fix-introspection-check.patch | 2 +-
 package/libgtk3/libgtk3.hash                       | 4 ++--
 package/libgtk3/libgtk3.mk                         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgtk3/0002-fix-introspection-check.patch b/package/libgtk3/0002-fix-introspection-check.patch
index 90f5facbb0..450505c914 100644
--- a/package/libgtk3/0002-fix-introspection-check.patch
+++ b/package/libgtk3/0002-fix-introspection-check.patch
@@ -14,7 +14,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1685,7 +1685,10 @@
+@@ -1650,7 +1650,10 @@
  # GObject introspection
  ##################################################
 
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index d5638780de..1493998686 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.29.sha256sum
-sha256  f57ec4ade8f15cab0c23a80dcaee85b876e70a8823d9105f067ce335a8268caa  gtk+-3.24.29.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.30.sha256sum
+sha256  ba75bfff320ad1f4cfbee92ba813ec336322cc3c660d406aad014b07087a3ba9  gtk+-3.24.30.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 0c40bff80e..80a2affd87 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).29
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).30
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
