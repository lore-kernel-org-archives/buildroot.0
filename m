Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1210C38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 481D840334;
	Mon, 24 Oct 2022 21:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 481D840334
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KkSeZpe4v9JZ; Mon, 24 Oct 2022 21:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5ED8402B9;
	Mon, 24 Oct 2022 21:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5ED8402B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFE9D1BF966
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB9F28132A
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB9F28132A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRzmMS-b7-qJ for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B438F81328
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B438F81328
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D2828704B; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 23:27:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07197baadb40303afd543a0ed915cbdfb87e9e08
X-Git-Newrev: 13596db789ead1ae68d3d53c298cbdb73e55cdfc
X-Patchwork-Hint: ignore
Message-Id: <20221024214302.9D2828704B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh: bump to version 0.10.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=13596db789ead1ae68d3d53c298cbdb73e55cdfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=libssh-0.10.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 4dbab11374..90bc4c82d8 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.9/libssh-0.9.6.tar.xz.asc
+# https://www.libssh.org/files/0.10/libssh-0.10.4.tar.xz.asc
 # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256  86bcf885bd9b80466fe0e05453c58b877df61afa8ba947a58c356d7f0fab829b  libssh-0.9.6.tar.xz
+sha256  07392c54ab61476288d1c1f0a7c557b50211797ad00c34c3af2bbc4dbc4bd97d  libssh-0.10.4.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 4cadf83aee..5deb64b82e 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSSH_VERSION_MAJOR = 0.9
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).6
+LIBSSH_VERSION_MAJOR = 0.10
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).4
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
