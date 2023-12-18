Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47071C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF9EC405F8;
	Mon, 18 Dec 2023 08:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF9EC405F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_3YWFRuaawj; Mon, 18 Dec 2023 08:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1714405B2;
	Mon, 18 Dec 2023 08:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1714405B2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9ACA91BF94D
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7294081F4E
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7294081F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQaQJLAUf9fp for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:18:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 380F581EBE
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 380F581EBE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 233E587BB3; Mon, 18 Dec 2023 08:18:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:16:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5714126edac88e3adc043a482b262b319a907dd3
X-Git-Newrev: 4221e1068360ca4315593974d7bef79ec9f9c14e
X-Patchwork-Hint: ignore
Message-Id: <20231218081853.233E587BB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gettext-gnu: bump version to 0.22.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4221e1068360ca4315593974d7bef79ec9f9c14e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=08f342937a09ce41977e8ceecc23509e4b330490

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gettext-gnu/gettext-gnu.hash   | 2 +-
 package/gettext-gnu/gettext-gnu.mk     | 2 +-
 package/gettext-tiny/gettext-tiny.hash | 2 +-
 package/gettext-tiny/gettext-tiny.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gettext-gnu/gettext-gnu.hash b/package/gettext-gnu/gettext-gnu.hash
index f307b4a9fd..7c649843f4 100644
--- a/package/gettext-gnu/gettext-gnu.hash
+++ b/package/gettext-gnu/gettext-gnu.hash
@@ -1,5 +1,5 @@
 # Please keep in sync with package/gettext-tiny/gettext-tiny.hash
 # Locally calculated
-sha256  b838228b3f8823a6c1eddf07297197c4db13f7e1b173b9ef93f3f945a63080b6  gettext-0.22.3.tar.xz
+sha256  29217f1816ee2e777fa9a01f9956a14139c0c23cc1b20368f06b2888e8a34116  gettext-0.22.4.tar.xz
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
 sha256  3fe5361f24b7c49ba12911c08f5a33f9cb18871d95d9fb881f5b8a4793e04288  gettext-runtime/intl/COPYING.LIB
diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index 35b79d1926..b7d0cf213c 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -6,7 +6,7 @@
 
 # Please keep in sync with GETTEXT_TINY_ARCHIVE_VERSION in
 # gettext-tiny/gettext-tiny.mk
-GETTEXT_GNU_VERSION = 0.22.3
+GETTEXT_GNU_VERSION = 0.22.4
 GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
 GETTEXT_GNU_INSTALL_STAGING = YES
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index a72b0c35e4..f7ed50b49f 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -3,4 +3,4 @@ sha256  29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383  gettex
 sha256  4c938aa3d8fa3c184bba5e87a8a2febc89560627c9d0567536879e3eca1a7b4f  LICENSE
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
 # Locally Computed:
-sha256  b838228b3f8823a6c1eddf07297197c4db13f7e1b173b9ef93f3f945a63080b6  gettext-0.22.3.tar.xz
+sha256  29217f1816ee2e777fa9a01f9956a14139c0c23cc1b20368f06b2888e8a34116  gettext-0.22.4.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index e4a3625c5a..3fe8a781d9 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -15,7 +15,7 @@ GETTEXT_TINY_PROVIDES = gettext
 
 # needed for gettextize
 # Please keep in sync with package/gettext-gnu/gettext-gnu.mk
-GETTEXT_TINY_ARCHIVE_VERSION = 0.22.3
+GETTEXT_TINY_ARCHIVE_VERSION = 0.22.4
 
 GETTEXT_TINY_EXTRA_GETTEXT_FILES = \
 	gettext-tools/misc/gettextize.in \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
