Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090A0C7EE2E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 10:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DBAE61198;
	Sun, 11 Jun 2023 10:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DBAE61198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ctYVDHXuTB6x; Sun, 11 Jun 2023 10:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3586A61133;
	Sun, 11 Jun 2023 10:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3586A61133
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B283B1BF389
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 10:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B38D84423
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 10:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B38D84423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9D-4oTWFyp7G for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 10:57:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A282843D0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A282843D0
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 10:57:02 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout09.t-online.de (Postfix) with SMTP id A067D1E78A
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 12:56:59 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8Ikl-1avCpV0; Sun, 11 Jun 2023 12:56:59 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:49118)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8Ikk-0002MQ-2r
 for buildroot@buildroot.org; Sun, 11 Jun 2023 12:56:58 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 12:56:58 +0200
Message-Id: <20230611105658.715692-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686481019-D37E92C5-69133A52/0/0 CLEAN NORMAL
X-TOI-MSGID: 39623b28-1642-4b23-ae52-6554b8c33a11
Subject: [Buildroot] [PATCH 1/1] package/leafnode2: bump version to
 2.0.0.alpha202301
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebased patch.

Updated license hash due to upstream refresh of the license file:
https://gitlab.com/leafnode-2/leafnode-2/-/commit/37442bbb7dd4f3cfd36f7264b9c3772e09531b5a

Switched project URLs to gitlab.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/leafnode2/0001-cross_makefile.patch | 10 +++++-----
 package/leafnode2/Config.in                 |  9 +--------
 package/leafnode2/leafnode2.hash            |  4 ++--
 package/leafnode2/leafnode2.mk              |  6 +++---
 4 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/package/leafnode2/0001-cross_makefile.patch b/package/leafnode2/0001-cross_makefile.patch
index b61a8ef3c6..32116446c3 100644
--- a/package/leafnode2/0001-cross_makefile.patch
+++ b/package/leafnode2/0001-cross_makefile.patch
@@ -10,11 +10,11 @@ Fix cross-compilation issues
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: b/Makefile.in
+Index: b/Makefile.am
 ===================================================================
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -1853,7 +1853,7 @@
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -311,7 +311,7 @@
  
  configparam_data.c: $(srcdir)/config.table b_sortnl$(EXEEXT) genconfigparam_data.awk
  	rm -f config.table.sorted
@@ -23,7 +23,7 @@ Index: b/Makefile.in
  	$(AWK) -f $(srcdir)/genconfigparam_data.awk <config.table.sorted >$@ \
  	|| { rm -f $@ ; false ; }
  
-@@ -1868,13 +1868,7 @@
+@@ -326,13 +326,7 @@
  install-data-hook:
  	$(INSTALL) -d -m 02770 $(DESTDIR)$(SPOOLDIR)
  	$(INSTALL) -d -m 02770 $(DESTDIR)$(SPOOLDIR)/leaf.node
diff --git a/package/leafnode2/Config.in b/package/leafnode2/Config.in
index e244bdc45b..3700b6fb80 100644
--- a/package/leafnode2/Config.in
+++ b/package/leafnode2/Config.in
@@ -7,11 +7,4 @@ config BR2_PACKAGE_LEAFNODE2
 	  server designed for small sites with just a few active
 	  newsgroups.
 
-	  Leafnode-2 needs inetd, check chapter 14 of the documentation
-	  at:
-	  http://krusty.dt.e-technik.tu-dortmund.de/~ma/leafnode/beta/leafnode-readme.txt
-
-	  For example, you can add this line to inetd.conf:
-	  nntp    stream  tcp     nowait  news    /usr/sbin/leafnode
-
-	  http://krusty.dt.e-technik.tu-dortmund.de/~ma/leafnode/beta
+	  https://gitlab.com/leafnode-2/leafnode-2
diff --git a/package/leafnode2/leafnode2.hash b/package/leafnode2/leafnode2.hash
index 7dfa7cce8d..d03ea472b1 100644
--- a/package/leafnode2/leafnode2.hash
+++ b/package/leafnode2/leafnode2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  34eba2cbbb871b724c8d5dd402d1c358aeb21ba426beb5658e155ed0d7461075  leafnode-2.0.0.alpha20140727b.tar.bz2
+sha256  1c74de60c3f91ef6f8a3ec20f0c34a0933658aeac8e3723a5f286c0646319e5c  leafnode2-ce7d3b13fb285c9fb7bffc382ea10fd41e12582d.tar.gz
 sha256  59d37f745dc5a2d63a51dff344f4ad89f72e76f8c7b7d877f20880d838b1bec9  COPYING
-sha256  0c92246a9d3636e0aa6a244f6c481639b2e530fbbb25bc048ce7acd83e1fc5f6  COPYING.LGPL
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index e82ca2e1ee..3ed2e20266 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LEAFNODE2_VERSION = 2.0.0.alpha20140727b
-LEAFNODE2_SOURCE = leafnode-$(LEAFNODE2_VERSION).tar.bz2
-LEAFNODE2_SITE = http://krusty.dt.e-technik.tu-dortmund.de/~ma/leafnode/beta
+LEAFNODE2_VERSION = ce7d3b13fb285c9fb7bffc382ea10fd41e12582d
+LEAFNODE2_SITE = $(call gitlab,leafnode-2,leafnode-2,$(LEAFNODE2_VERSION))
 LEAFNODE2_LICENSE = LGPL-2.1
 LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
 LEAFNODE2_DEPENDENCIES = host-pcre pcre
+LEAFNODE2_AUTORECONF = YES
 
 LEAFNODE2_CONF_ENV = \
 	PCRECONFIG="$(STAGING_DIR)/usr/bin/pcre-config"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
