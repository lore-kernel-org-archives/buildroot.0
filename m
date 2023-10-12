Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93844CDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 14:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40A0C41633;
	Thu, 12 Oct 2023 14:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40A0C41633
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4aPKfTw0MEe; Thu, 12 Oct 2023 14:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A866416B5;
	Thu, 12 Oct 2023 14:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A866416B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDBF71BF365
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 14:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B746341690
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 14:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B746341690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vpeRPBAHUVTi for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 14:39:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3A5340120
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 14:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3A5340120
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A23F5845F7; Thu, 12 Oct 2023 14:39:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 16:36:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa30acd770f4ef4bf1bc548f9cb8df3adf06938b
X-Git-Newrev: 3e255877b76ceeaaa742861e5e1eac0e0b30403d
X-Patchwork-Hint: ignore
Message-Id: <20231012143924.A23F5845F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gettext-gnu: bump version to 0.22.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e255877b76ceeaaa742861e5e1eac0e0b30403d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=blob;f=NEWS;h=9ed51966572af1c65074fcfbd18db24f1321c55d;hb=c9af3e4eeccc178a0833754e3d8c7083591e75ba

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gettext-gnu/gettext-gnu.hash   | 2 +-
 package/gettext-gnu/gettext-gnu.mk     | 2 +-
 package/gettext-tiny/gettext-tiny.hash | 2 +-
 package/gettext-tiny/gettext-tiny.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gettext-gnu/gettext-gnu.hash b/package/gettext-gnu/gettext-gnu.hash
index 878253bea4..f307b4a9fd 100644
--- a/package/gettext-gnu/gettext-gnu.hash
+++ b/package/gettext-gnu/gettext-gnu.hash
@@ -1,5 +1,5 @@
 # Please keep in sync with package/gettext-tiny/gettext-tiny.hash
 # Locally calculated
-sha256  4c82fbfe5e53d71a97c634aa98a898b9da807b08b27410f6a4641e8bb44dc4b2  gettext-0.22.2.tar.xz
+sha256  b838228b3f8823a6c1eddf07297197c4db13f7e1b173b9ef93f3f945a63080b6  gettext-0.22.3.tar.xz
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
 sha256  3fe5361f24b7c49ba12911c08f5a33f9cb18871d95d9fb881f5b8a4793e04288  gettext-runtime/intl/COPYING.LIB
diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index 06ada568b1..35b79d1926 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -6,7 +6,7 @@
 
 # Please keep in sync with GETTEXT_TINY_ARCHIVE_VERSION in
 # gettext-tiny/gettext-tiny.mk
-GETTEXT_GNU_VERSION = 0.22.2
+GETTEXT_GNU_VERSION = 0.22.3
 GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
 GETTEXT_GNU_INSTALL_STAGING = YES
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index 02d9a803da..a72b0c35e4 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -3,4 +3,4 @@ sha256  29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383  gettex
 sha256  4c938aa3d8fa3c184bba5e87a8a2febc89560627c9d0567536879e3eca1a7b4f  LICENSE
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
 # Locally Computed:
-sha256  4c82fbfe5e53d71a97c634aa98a898b9da807b08b27410f6a4641e8bb44dc4b2  gettext-0.22.2.tar.xz
+sha256  b838228b3f8823a6c1eddf07297197c4db13f7e1b173b9ef93f3f945a63080b6  gettext-0.22.3.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 0aef4b0058..e4a3625c5a 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -15,7 +15,7 @@ GETTEXT_TINY_PROVIDES = gettext
 
 # needed for gettextize
 # Please keep in sync with package/gettext-gnu/gettext-gnu.mk
-GETTEXT_TINY_ARCHIVE_VERSION = 0.22.2
+GETTEXT_TINY_ARCHIVE_VERSION = 0.22.3
 
 GETTEXT_TINY_EXTRA_GETTEXT_FILES = \
 	gettext-tools/misc/gettextize.in \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
