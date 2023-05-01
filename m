Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01733C77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 07:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACCFD605AF;
	Mon,  1 May 2023 07:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACCFD605AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2iVWOQHhbjp5; Mon,  1 May 2023 07:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD679606F2;
	Mon,  1 May 2023 07:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD679606F2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 666F81BF859
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EFA5417BF
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EFA5417BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1i0BwvPHszZu for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 07:18:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 423CB416AC
 for <buildroot@buildroot.org>; Mon,  1 May 2023 07:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 423CB416AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FD64844D2; Mon,  1 May 2023 07:18:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 09:14:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 987a80f8f44659d206ab564bbf6f51271b0bb2d8
X-Git-Newrev: 839c0c7d7ce5d197dce1bb281a401e843fcb1a3a
X-Patchwork-Hint: ignore
Message-Id: <20230501071802.2FD64844D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: security bump version to
 2.4.57
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

commit: https://git.buildroot.net/buildroot/commit/?id=839c0c7d7ce5d197dce1bb281a401e843fcb1a3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.apache.org/thread/lp9t6w2t0qsbbo14lylk2yvfj8hgfoh9

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.57
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 36144917fb..1f0020f65a 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.56.tar.bz2.{sha256,sha512}
-sha256  d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5442d41afdb2d7c  httpd-2.4.56.tar.bz2
-sha512  5f12cd9878d822384b1bb163fea4d8edee5e7a0dd8b2389264387971268145cccc6a5a27ddf0436c5f1f631acc5fdc4874da2a47911483e421ca40bf783e0e12  httpd-2.4.56.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.57.tar.bz2.{sha256,sha512}
+sha256  dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83caecb262e5cf94d2a  httpd-2.4.57.tar.bz2
+sha512  4d1e0a274ee90bdfb5f38d4a7d73a7367ed1c6388e26280e640014e49abc0df03683705b88dcfe2ec2da313dda4c7b4a3b86daffa1911f58e224eba89d82d155  httpd-2.4.57.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 80205a6362..320a6ad20e 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.56
+APACHE_VERSION = 2.4.57
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://downloads.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
