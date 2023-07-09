Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD20EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CF50606FF;
	Sun,  9 Jul 2023 16:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CF50606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGWlV1S1cl0o; Sun,  9 Jul 2023 16:46:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EACD606EC;
	Sun,  9 Jul 2023 16:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EACD606EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA42E1BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B311781CDB
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B311781CDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JU2WWz83r3Tk for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:46:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEC5C81CE9
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEC5C81CE9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE50686975; Sun,  9 Jul 2023 16:46:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Jul 2023 18:45:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80304d9911f34f8a0173a4f37d52f93177478cc7
X-Git-Newrev: 683b3e93eb40bf4b312d76a1ce88b2df0519487a
X-Patchwork-Hint: ignore
Message-Id: <20230709164606.AE50686975@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valgrind: bump version to 3.21.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=683b3e93eb40bf4b312d76a1ce88b2df0519487a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added sha1 hash provided by upstream, removed md5 hash.

Release notes: https://valgrind.org/docs/manual/dist.news.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/valgrind/valgrind.hash | 4 ++--
 package/valgrind/valgrind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 83717f26f3..d406babe35 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-md5  e3ca8e03c6c527e80e7da5135a1b6beb  valgrind-3.20.0.tar.bz2
+sha1  817d769743d278b5d07526e85115082054e9bf9c  valgrind-3.21.0.tar.bz2
 # locally computed
-sha256  8536c031dbe078d342f121fa881a9ecd205cb5a78e639005ad570011bdb9f3c6  valgrind-3.20.0.tar.bz2
+sha256  10ce1618bb3e33fad16eb79552b0a3e1211762448a0d7fce11c8a6243b9ac971  valgrind-3.21.0.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 98beb7ffef..4c4c3ce543 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.20.0
+VALGRIND_VERSION = 3.21.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
