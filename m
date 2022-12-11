Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1597FC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB8804EF3F;
	Mon, 20 Feb 2023 22:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB8804EF3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6Ib0cixhQK2; Mon, 20 Feb 2023 22:11:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 699FD4EF3A;
	Mon, 20 Feb 2023 22:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 699FD4EF3A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68F831BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9C19416C5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9C19416C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIEQxbYDk408 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22C04416C3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22C04416C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1303786495; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:32:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eb2f2886b2364e5b6a0867f55106bf83acb064e7
X-Git-Newrev: 3f8dacd79bb578b61b710d626cfa82ed64d5a2ec
X-Patchwork-Hint: ignore
Message-Id: <20230220205206.1303786495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hans: bump to version
 1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f8dacd79bb578b61b710d626cfa82ed64d5a2ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/friedrich/hans/blob/v1.1/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hans/hans.hash | 6 +++---
 package/hans/hans.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/hans/hans.hash b/package/hans/hans.hash
index c555528efb..a1f591eb1c 100644
--- a/package/hans/hans.hash
+++ b/package/hans/hans.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/hanstunnel/files/source/
-md5  8628393ec1b61a6c3a47a0a3dcb455b3  hans-1.0.tar.gz
-sha1  0bc857df109af222732cb95c861a0f0a6dd53dee  hans-1.0.tar.gz
+md5  d23fbaeb990ed7d05695fcc8f8ef7847  hans-1.1.tar.gz
+sha1  15dd4b717e8808d9279af970d4826aad826bc849  hans-1.1.tar.gz
 # Locally computed
-sha256  f8f70cf22ba14d9223695c9e9a2d75289d8360f61f533b83ee538836f29a458e  hans-1.0.tar.gz
+sha256  966962d8734ab6b4d871e035d08f45256025a5220216bd48e41fa7fd0ad136c5  hans-1.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/hans/hans.mk b/package/hans/hans.mk
index e26c2f37f8..6d2b1dabe5 100644
--- a/package/hans/hans.mk
+++ b/package/hans/hans.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HANS_VERSION = 1.0
+HANS_VERSION = 1.1
 HANS_SITE = http://downloads.sourceforge.net/project/hanstunnel/source
 HANS_LICENSE = GPL-3.0+
 HANS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
