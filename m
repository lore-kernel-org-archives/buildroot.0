Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA85CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 16:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A6E360634;
	Sun, 12 Oct 2025 16:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVvDgkx3HUkD; Sun, 12 Oct 2025 16:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D9D86061B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D9D86061B;
	Sun, 12 Oct 2025 16:37:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BAD502A8
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A375A80FB7
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkmdNKL_XNcY for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 16:37:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9758280F64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9758280F64
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:37:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 859A38699F; Sun, 12 Oct 2025 16:37:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 18:28:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b38cc734ef0a30fa5972c03b781882eeeeccf9e9
X-Git-Newrev: 2136920d7fe41061c5ed0091500444995391a7e5
X-Patchwork-Hint: ignore
Message-Id: <20251012163745.859A38699F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp-av: bump to version 0.14.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2136920d7fe41061c5ed0091500444995391a7e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The removed patch has been merged in version 0.14.2.

Release notes:
https://gitlab.gnome.org/GNOME/gupnp-av/-/blob/gupnp-av-0.14.2/NEWS
https://gitlab.gnome.org/GNOME/gupnp-av/-/blob/gupnp-av-0.14.3/NEWS
https://gitlab.gnome.org/GNOME/gupnp-av/-/blob/gupnp-av-0.14.4/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gupnp-av/0001-libxml2.11-support.patch     | 41 ----------------------
 ...xml-Fix-compatibility-with-libxml2-2-12-x.patch | 26 --------------
 package/gupnp-av/gupnp-av.hash                     |  4 +--
 package/gupnp-av/gupnp-av.mk                       |  2 +-
 4 files changed, 3 insertions(+), 70 deletions(-)

diff --git a/package/gupnp-av/0001-libxml2.11-support.patch b/package/gupnp-av/0001-libxml2.11-support.patch
deleted file mode 100644
index 739a8d774b..0000000000
--- a/package/gupnp-av/0001-libxml2.11-support.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 4dbc4c1da2a033c497d84a1291c46f416a9cac51 Mon Sep 17 00:00:00 2001
-From: David Anes <david.anes@suse.com>
-Date: Thu, 4 May 2023 11:54:02 +0200
-Subject: use xmlReadMemory instead of xmlRecoverMemory, as it's been
- deprecated in libxml2 2.11.0
-
-Since version 2.11.0, some private symbols have been removed.
-
-Downloaded from
-https://code.opensuse.org/package/gupnp-av/blob/master/f/gupnp-av-libxml2.11-support.patch
-
-Upstream: https://gitlab.gnome.org/GNOME/gupnp-av/-/issues/10
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
-Index: gupnp-av-0.14.1/libgupnp-av/gupnp-didl-lite-parser.c
-===================================================================
---- gupnp-av-0.14.1.orig/libgupnp-av/gupnp-didl-lite-parser.c
-+++ gupnp-av-0.14.1/libgupnp-av/gupnp-didl-lite-parser.c
-@@ -230,7 +230,7 @@ gupnp_didl_lite_parser_parse_didl_recurs
-         GUPnPAVXMLDoc *xml_doc = NULL;
-         gboolean       result;
- 
--        doc = xmlRecoverMemory (didl, strlen (didl));
-+        doc = xmlReadMemory (didl, strlen (didl), NULL, NULL, XML_PARSE_RECOVER);
-         if (doc == NULL) {
-                 g_set_error (error,
-                              G_MARKUP_ERROR,
-Index: gupnp-av-0.14.1/libgupnp-av/gupnp-feature-list-parser.c
-===================================================================
---- gupnp-av-0.14.1.orig/libgupnp-av/gupnp-feature-list-parser.c
-+++ gupnp-av-0.14.1/libgupnp-av/gupnp-feature-list-parser.c
-@@ -114,7 +114,7 @@ gupnp_feature_list_parser_parse_text
-         xmlNode      *element;
-         GList        *feature_list = NULL;
- 
--        doc = xmlRecoverMemory (text, strlen (text));
-+        doc = xmlReadMemory (text, strlen (text), NULL, NULL, XML_PARSE_RECOVER);
-         if (doc == NULL) {
-                 g_set_error (error,
-                              G_MARKUP_ERROR,
diff --git a/package/gupnp-av/0002-xml-Fix-compatibility-with-libxml2-2-12-x.patch b/package/gupnp-av/0002-xml-Fix-compatibility-with-libxml2-2-12-x.patch
deleted file mode 100644
index 358098fbc4..0000000000
--- a/package/gupnp-av/0002-xml-Fix-compatibility-with-libxml2-2-12-x.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 1e10a41fcef6ae0d3e89958db89bc22398f3b4f1 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Sat, 25 Nov 2023 17:58:49 +0100
-Subject: [PATCH] xml: Fix compatibility with libxml2 2.12.x
-
-Upstream: https://gitlab.gnome.org/GNOME/gupnp-av/-/commit/1e10a41fcef6ae0d3e89958db89bc22398f3b4f1
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libgupnp-av/xml-util.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libgupnp-av/xml-util.h b/libgupnp-av/xml-util.h
-index e0e49f7..0bbe0f8 100644
---- a/libgupnp-av/xml-util.h
-+++ b/libgupnp-av/xml-util.h
-@@ -16,6 +16,7 @@
- 
- #include <glib.h>
- #include <libxml/tree.h>
-+#include <libxml/parser.h>
- #include <stdarg.h>
- #include <glib-object.h>
- 
--- 
-GitLab
-
diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
index c8ed0db2a4..27f974165a 100644
--- a/package/gupnp-av/gupnp-av.hash
+++ b/package/gupnp-av/gupnp-av.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gupnp-av/0.14/gupnp-av-0.14.1.sha256sum:
-sha256  b79ce0cc4b0c66d9c54bc22183a10e5709a0011d2af272025948efcab33a3e4f  gupnp-av-0.14.1.tar.xz
+# Hash from: https://download.gnome.org/sources/gupnp-av/0.14/gupnp-av-0.14.4.sha256sum:
+sha256  21d974b3275cb5dcf5b8aa1d9a3fc80e7edca706935f6fbd004c79787138f8c7  gupnp-av-0.14.4.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index 3821c4e170..fdc4d70343 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_AV_VERSION_MAJOR = 0.14
-GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).1
+GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).4
 GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
 GUPNP_AV_SITE = https://download.gnome.org/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
 GUPNP_AV_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
