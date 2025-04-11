Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A841CC369A8
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7211B6F5D6;
	Fri, 11 Apr 2025 10:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjqdIRV-zFQe; Fri, 11 Apr 2025 10:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75A836F71E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75A836F71E;
	Fri, 11 Apr 2025 10:41:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C138108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 273A281334
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZkBlc5id98P for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:41:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 542ED81320
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 542ED81320
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 523B28429D; Fri, 11 Apr 2025 10:41:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:40:33 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 320a2cf3162c3d96b9470997a6321caccc892994
X-Git-Newrev: 7f625d612400113f0559d5c4946eda3b06e58de5
X-Patchwork-Hint: ignore
Message-Id: <20250411104148.523B28429D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libsoup3: bump to
 3.6.5
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7f625d612400113f0559d5c4946eda3b06e58de5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

News:
- https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.3.news
- https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.4.news
- https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.5.news

Also drop the krb5_config, which was dropped in commit
https://gitlab.gnome.org/GNOME/libsoup/-/commit/123eb029bf3fa08f3c45678c0a43ae4b930e6631.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b896dca532929530eb74c6daf3e2fedcbba6c53b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libsoup3/libsoup3.hash | 4 ++--
 package/libsoup3/libsoup3.mk   | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index 23af347903..32aa7382fa 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.1.sha256sum
-sha256  ceb1f1aa2bdd73b2cd8159d3998c96c55ef097ef15e4b4f36029209fa18af838  libsoup-3.6.1.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.5.sha256sum
+sha256  6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234  libsoup-3.6.5.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index f2f96c2def..0db587a93a 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP3_VERSION_MAJOR = 3.6
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).1
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).5
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
@@ -45,9 +45,7 @@ LIBSOUP3_CONF_OPTS += -Dintrospection=disabled -Dvapi=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
-LIBSOUP3_CONF_OPTS += \
-	-Dgssapi=enabled \
-	-Dkrb5_config=$(STAGING_DIR)/usr/bin/krb5-config
+LIBSOUP3_CONF_OPTS += -Dgssapi=enabled
 LIBSOUP3_DEPENDENCIES += libkrb5
 else
 LIBSOUP3_CONF_OPTS += -Dgssapi=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
