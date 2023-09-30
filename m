Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790BCE7737D
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 18:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FF7340297;
	Sat, 30 Sep 2023 18:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FF7340297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgihlXo1FBxr; Sat, 30 Sep 2023 18:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AC924016C;
	Sat, 30 Sep 2023 18:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AC924016C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A20991BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 18:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 873EA41774
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 18:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 873EA41774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-5KUL9lfhN0 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 18:12:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AF5A4175B
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 18:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AF5A4175B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36EBA83C6E; Sat, 30 Sep 2023 18:12:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 19:54:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d65b960859046be486ced6c490d3671bd1392661
X-Git-Newrev: 6c1e01d9f8e84d54f242f850696582657ecc9fdf
X-Patchwork-Hint: ignore
Message-Id: <20230930181236.36EBA83C6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gettext-gnu: bump version to 0.22.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c1e01d9f8e84d54f242f850696582657ecc9fdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=blob;f=NEWS;h=35f2a2f82c7da4764b73617f45b8faa6c8d7e9c3;hb=775d1d26a8f72214834ef4d399bad4690b7a604c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gettext-gnu/gettext-gnu.hash   | 5 +----
 package/gettext-gnu/gettext-gnu.mk     | 2 +-
 package/gettext-tiny/gettext-tiny.hash | 4 +---
 package/gettext-tiny/gettext-tiny.mk   | 2 +-
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/gettext-gnu/gettext-gnu.hash b/package/gettext-gnu/gettext-gnu.hash
index b4ec27642c..878253bea4 100644
--- a/package/gettext-gnu/gettext-gnu.hash
+++ b/package/gettext-gnu/gettext-gnu.hash
@@ -1,8 +1,5 @@
 # Please keep in sync with package/gettext-tiny/gettext-tiny.hash
-# From https://lists.gnu.org/archive/html/info-gnu/2023-06/msg00003.html
-sha1  d9666d3b9c47a84c814d32e76fa75f60ec23756f  gettext-0.22.tar.xz
-
 # Locally calculated
-sha256  0e60393a47061567b46875b249b7d2788b092d6457d656145bb0e7e6a3e26d93  gettext-0.22.tar.xz
+sha256  4c82fbfe5e53d71a97c634aa98a898b9da807b08b27410f6a4641e8bb44dc4b2  gettext-0.22.2.tar.xz
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
 sha256  3fe5361f24b7c49ba12911c08f5a33f9cb18871d95d9fb881f5b8a4793e04288  gettext-runtime/intl/COPYING.LIB
diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index 271d6ac57f..06ada568b1 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -6,7 +6,7 @@
 
 # Please keep in sync with GETTEXT_TINY_ARCHIVE_VERSION in
 # gettext-tiny/gettext-tiny.mk
-GETTEXT_GNU_VERSION = 0.22
+GETTEXT_GNU_VERSION = 0.22.2
 GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
 GETTEXT_GNU_INSTALL_STAGING = YES
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index f40e6274c0..02d9a803da 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -2,7 +2,5 @@
 sha256  29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383  gettext-tiny-0.3.2.tar.gz
 sha256  4c938aa3d8fa3c184bba5e87a8a2febc89560627c9d0567536879e3eca1a7b4f  LICENSE
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
-# From https://lists.gnu.org/archive/html/info-gnu/2023-06/msg00003.html
-sha1  d9666d3b9c47a84c814d32e76fa75f60ec23756f  gettext-0.22.tar.xz
 # Locally Computed:
-sha256  0e60393a47061567b46875b249b7d2788b092d6457d656145bb0e7e6a3e26d93  gettext-0.22.tar.xz
+sha256  4c82fbfe5e53d71a97c634aa98a898b9da807b08b27410f6a4641e8bb44dc4b2  gettext-0.22.2.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 234b974075..0aef4b0058 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -15,7 +15,7 @@ GETTEXT_TINY_PROVIDES = gettext
 
 # needed for gettextize
 # Please keep in sync with package/gettext-gnu/gettext-gnu.mk
-GETTEXT_TINY_ARCHIVE_VERSION = 0.22
+GETTEXT_TINY_ARCHIVE_VERSION = 0.22.2
 
 GETTEXT_TINY_EXTRA_GETTEXT_FILES = \
 	gettext-tools/misc/gettextize.in \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
