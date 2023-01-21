Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8D5C004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF0BC41872;
	Sat, 21 Jan 2023 13:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF0BC41872
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WkBCVJd4PQ1I; Sat, 21 Jan 2023 13:19:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C719741862;
	Sat, 21 Jan 2023 13:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C719741862
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FE331BF859
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D136641CE4
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D136641CE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CU4lWRXu3IJL for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF38841CA6
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF38841CA6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB6D386946; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:55:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9086723227c535010986d831954ec932d3e783fb
X-Git-Newrev: cb96dcaff49c259ad02fad428ab3ae3d210416e4
X-Patchwork-Hint: ignore
Message-Id: <20230121131609.AB6D386946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtk2-engines: switch to https
 download
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb96dcaff49c259ad02fad428ab3ae3d210416e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gtk2-engines/gtk2-engines.hash | 2 +-
 package/gtk2-engines/gtk2-engines.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gtk2-engines/gtk2-engines.hash b/package/gtk2-engines/gtk2-engines.hash
index 20125c706c..71a0ecd213 100644
--- a/package/gtk2-engines/gtk2-engines.hash
+++ b/package/gtk2-engines/gtk2-engines.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk-engines/2.20/gtk-engines-2.20.2.sha256sum
+# From https://download.gnome.org/sources/gtk-engines/2.20/gtk-engines-2.20.2.sha256sum
 sha256  15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5  gtk-engines-2.20.2.tar.bz2
 # Locally computed
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index 5f145940b2..ea41bccaea 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -7,7 +7,7 @@
 GTK2_ENGINES_VERSION_MAJOR = 2.20
 GTK2_ENGINES_VERSION = $(GTK2_ENGINES_VERSION_MAJOR).2
 GTK2_ENGINES_SOURCE = gtk-engines-$(GTK2_ENGINES_VERSION).tar.bz2
-GTK2_ENGINES_SITE = http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/$(GTK2_ENGINES_VERSION_MAJOR)
+GTK2_ENGINES_SITE = https://download.gnome.org/sources/gtk-engines/$(GTK2_ENGINES_VERSION_MAJOR)
 GTK2_ENGINES_DEPENDENCIES = libgtk2 host-intltool
 GTK2_ENGINES_LICENSE = LGPL-2.1+
 GTK2_ENGINES_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
