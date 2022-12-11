Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77576C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 267934EEFB;
	Mon, 20 Feb 2023 22:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 267934EEFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r4QGfeQGuA2o; Mon, 20 Feb 2023 22:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC4D84EF0D;
	Mon, 20 Feb 2023 22:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC4D84EF0D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70AE71BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 977FD6115C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 977FD6115C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OT6-rpUefbx8 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9C266113E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9C266113E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A93B9828C8; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:15:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6ec2adee4efb96787cf702f418d09b45cb686482
X-Git-Newrev: d0aea5f9d8e63f6146730c39b05ec8cae15dd100
X-Patchwork-Hint: ignore
Message-Id: <20230220205200.A93B9828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sed: bump to version
 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0aea5f9d8e63f6146730c39b05ec8cae15dd100
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update hash of COPYING (URL updated:
https://git.savannah.gnu.org/cgit/sed.git/commit/?id=5adab913a82ef1b7f844339ab209531ccf198990)

https://git.savannah.gnu.org/cgit/sed.git/tree/NEWS?h=v4.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sed/sed.hash | 6 +++---
 package/sed/sed.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sed/sed.hash b/package/sed/sed.hash
index bb48128526..10e2c36d8f 100644
--- a/package/sed/sed.hash
+++ b/package/sed/sed.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz.sig
+# https://ftp.gnu.org/gnu/sed/sed-4.9.tar.xz.sig
 # with the key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633  sed-4.8.tar.xz
+sha256  6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181  sed-4.9.tar.xz
 # Locally calculated
-sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 64fb2035b0..8165083658 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SED_VERSION = 4.8
+SED_VERSION = 4.9
 SED_SOURCE = sed-$(SED_VERSION).tar.xz
 SED_SITE = $(BR2_GNU_MIRROR)/sed
 SED_LICENSE = GPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
