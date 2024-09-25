Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAB8CCF9E7
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 17:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7642841AB;
	Wed, 25 Sep 2024 17:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjtSbEZ5Z_KH; Wed, 25 Sep 2024 17:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0405D8436C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0405D8436C;
	Wed, 25 Sep 2024 17:38:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2E251BF4E7
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D167D424BE
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQ-pV2PbjfQN for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 17:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 027F542488
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 027F542488
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 17:38:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F005B844B4; Wed, 25 Sep 2024 17:38:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 19:34:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f6075c6346caed8afc4c9264b55bbe7b317f78e
X-Git-Newrev: 5660a06c29e3008f168e986e81a51a6b011566ec
X-Patchwork-Hint: ignore
Message-Id: <20240925173814.F005B844B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hicolor-icon-theme: bump to
 version 0.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=5660a06c29e3008f168e986e81a51a6b011566ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

switch to meson build

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/hicolor-icon-theme/hicolor-icon-theme.hash | 2 +-
 package/hicolor-icon-theme/hicolor-icon-theme.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hicolor-icon-theme/hicolor-icon-theme.hash b/package/hicolor-icon-theme/hicolor-icon-theme.hash
index ec9635f05a..5bff03fe4d 100644
--- a/package/hicolor-icon-theme/hicolor-icon-theme.hash
+++ b/package/hicolor-icon-theme/hicolor-icon-theme.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  317484352271d18cbbcfac3868eab798d67fff1b8402e740baa6ff41d588a9d8  hicolor-icon-theme-0.17.tar.xz
+sha256  db0e50a80aa3bf64bb45cbca5cf9f75efd9348cf2ac690b907435238c3cf81d7  hicolor-icon-theme-0.18.tar.xz
 sha256  b0a64377d4ee87b7dbcf418ce4fb33ec3b2d7081b6732890e4af06b8118c4526  COPYING
diff --git a/package/hicolor-icon-theme/hicolor-icon-theme.mk b/package/hicolor-icon-theme/hicolor-icon-theme.mk
index 088aecf31c..f3368a292b 100644
--- a/package/hicolor-icon-theme/hicolor-icon-theme.mk
+++ b/package/hicolor-icon-theme/hicolor-icon-theme.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-HICOLOR_ICON_THEME_VERSION = 0.17
+HICOLOR_ICON_THEME_VERSION = 0.18
 HICOLOR_ICON_THEME_SITE = http://icon-theme.freedesktop.org/releases
 HICOLOR_ICON_THEME_SOURCE = hicolor-icon-theme-$(HICOLOR_ICON_THEME_VERSION).tar.xz
 HICOLOR_ICON_THEME_LICENSE = GPL-2.0
 HICOLOR_ICON_THEME_LICENSE_FILES = COPYING
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
