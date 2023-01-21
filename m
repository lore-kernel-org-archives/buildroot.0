Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E65AC004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B93B8818A1;
	Sat, 21 Jan 2023 13:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B93B8818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQLBePGWpfoY; Sat, 21 Jan 2023 13:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3401814B6;
	Sat, 21 Jan 2023 13:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3401814B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC5551BF40B
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8804082C8F
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8804082C8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_lWxhZcAMbv for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7E4D82C35
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7E4D82C35
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C63B48694B; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:55:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76c0ac9725cb798487ec44b1b67057d5cb895070
X-Git-Newrev: cfdd3fcd158031dfa2157454b9f5071e801171b5
X-Patchwork-Hint: ignore
Message-Id: <20230121131609.C63B48694B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp-av: switch to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfdd3fcd158031dfa2157454b9f5071e801171b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gupnp-av/gupnp-av.hash | 2 +-
 package/gupnp-av/gupnp-av.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
index ceab42ef52..ab1739aaa4 100644
--- a/package/gupnp-av/gupnp-av.hash
+++ b/package/gupnp-av/gupnp-av.hash
@@ -1,4 +1,4 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.14/gupnp-av-0.14.0.sha256sum:
+# Hash from: https://download.gnome.org/sources/gupnp-av/0.14/gupnp-av-0.14.0.sha256sum:
 sha256  20aed546fc882e78a3f186a0c8bce5c841cc3a44b7ea528298fbdc82596fb156  gupnp-av-0.14.0.tar.xz
 
 # Hash for license file:
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index 655de87608..e83aa57bda 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -7,7 +7,7 @@
 GUPNP_AV_VERSION_MAJOR = 0.14
 GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).0
 GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
-GUPNP_AV_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
+GUPNP_AV_SITE = https://download.gnome.org/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
 GUPNP_AV_LICENSE = LGPL-2.1+
 GUPNP_AV_LICENSE_FILES = COPYING
 GUPNP_AV_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
