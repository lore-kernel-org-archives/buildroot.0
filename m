Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8ABC004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1965411B9;
	Sat, 21 Jan 2023 13:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1965411B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQFT-RxSQHR4; Sat, 21 Jan 2023 13:21:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EF2A408CD;
	Sat, 21 Jan 2023 13:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EF2A408CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 127201BF847
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8111F41CDE
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8111F41CDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q6n8ou1Yuzvg for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1380941CB3
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1380941CB3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1033C86946; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:58:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce15c411a2a7e83ff5a5838450913082aa80a031
X-Git-Newrev: 16acbf9ce30985f29afdf4d0d1aca4fd9df21292
X-Patchwork-Hint: ignore
Message-Id: <20230121131610.1033C86946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libart: switch to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=16acbf9ce30985f29afdf4d0d1aca4fd9df21292
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libart/libart.hash | 2 +-
 package/libart/libart.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libart/libart.hash b/package/libart/libart.hash
index 2cfbe7397d..c00272c594 100644
--- a/package/libart/libart.hash
+++ b/package/libart/libart.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/libart_lgpl-2.3.21.sha256sum
+# From https://download.gnome.org/sources/libart_lgpl/2.3/libart_lgpl-2.3.21.sha256sum
 sha256  2a10b1c884bb37c7bd5c5eba59dbd0d28bf68e64a42d7f2083c836f60f8e98fa  libart_lgpl-2.3.21.tar.gz
 
 # Hash for license file:
diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index b3c6176a57..2c64a3576a 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -7,7 +7,7 @@
 LIBART_VERSION_MAJOR = 2.3
 LIBART_VERSION = $(LIBART_VERSION_MAJOR).21
 LIBART_SOURCE = libart_lgpl-$(LIBART_VERSION).tar.gz
-LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/$(LIBART_VERSION_MAJOR)
+LIBART_SITE = https://download.gnome.org/sources/libart_lgpl/$(LIBART_VERSION_MAJOR)
 LIBART_AUTORECONF = YES
 LIBART_INSTALL_STAGING = YES
 LIBART_CONFIG_SCRIPTS = libart2-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
