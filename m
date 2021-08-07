Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B97BC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:13:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B36E461058
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B36E461058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6787E40112;
	Sat,  7 Aug 2021 18:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CE4jUC4suFQU; Sat,  7 Aug 2021 18:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5767F401D0;
	Sat,  7 Aug 2021 18:13:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 124E01BF403
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B3A440019
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTTcjoVYjI9w for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 18:11:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 118F440112
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 18:11:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4F56C86E9C; Sat,  7 Aug 2021 18:11:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 19:59:28 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: cac618d0c119a0ba8e5604fc7c6b106352b2e6ff
X-Git-Newrev: f7e2d9de22180d16a73344219a5c99f88122fceb
X-Patchwork-Hint: ignore
Message-Id: <20210807181131.4F56C86E9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libgtk3: bump to
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7e2d9de22180d16a73344219a5c99f88122fceb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 64ace4e5f146c34c3315c9c89659a3caeb3a657a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
