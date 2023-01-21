Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1122AC27C76
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DCD44061C;
	Sat, 21 Jan 2023 13:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DCD44061C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yXWe1A7wAFsu; Sat, 21 Jan 2023 13:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30250404DF;
	Sat, 21 Jan 2023 13:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30250404DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 698D71BF859
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5000941CD7
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5000941CD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YKVjYPOajde1 for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D85741C96
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D85741C96
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34D3386946; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:49:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a49f00010da29e904c07debea9fd1ab54f2f6c50
X-Git-Newrev: d74dc17559ba88854e175ca2cc11c91dabc1694e
X-Patchwork-Hint: ignore
Message-Id: <20230121131609.34D3386946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/adwaita-icon-theme: switch to
 https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=d74dc17559ba88854e175ca2cc11c91dabc1694e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/adwaita-icon-theme/adwaita-icon-theme.hash | 2 +-
 package/adwaita-icon-theme/adwaita-icon-theme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.hash b/package/adwaita-icon-theme/adwaita-icon-theme.hash
index ce6acb8d9a..ae28a7a152 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.hash
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/3.22/adwaita-icon-theme-3.22.0.sha256sum
+# From https://download.gnome.org/sources/adwaita-icon-theme/3.27/adwaita-icon-theme-3.27.2.sha256sum
 sha256  a594e7440971f860cc61b1b8291be15ffc1b8dd06a9f11485a5a7faf189bcf6b  adwaita-icon-theme-3.37.2.tar.xz
 # locally computed
 sha256  51f83b2b4e9ed2beebc9b8eed2ecad29314a58ed8c5184b22ad8f9df703d3ce5  COPYING
diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
index 3950cfa636..6b71c41d52 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.mk
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
@@ -6,7 +6,7 @@
 
 ADWAITA_ICON_THEME_VERSION_MAJOR = 3.37
 ADWAITA_ICON_THEME_VERSION = $(ADWAITA_ICON_THEME_VERSION_MAJOR).2
-ADWAITA_ICON_THEME_SITE = http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
+ADWAITA_ICON_THEME_SITE = https://download.gnome.org/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
 ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
 ADWAITA_ICON_THEME_INSTALL_STAGING = YES
 ADWAITA_ICON_THEME_LICENSE = LGPL-3.0 or CC-BY-SA-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
