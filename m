Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F451C38147
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 09:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14097421E4;
	Sat, 16 Dec 2023 09:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14097421E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMixfVSffj60; Sat, 16 Dec 2023 09:51:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BB48421C3;
	Sat, 16 Dec 2023 09:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BB48421C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B927B1BF867
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 912A140146
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 912A140146
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EjWUUjxtZi5b for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 09:51:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 934D740123
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 09:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 934D740123
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EFCA81963; Sat, 16 Dec 2023 09:51:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 10:49:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f9431c3ad04e56b11bb72f3775cc804fc32918a
X-Git-Newrev: 3b0e7680cf59968f5adac6be8a68d0cdb9dd9e7f
X-Patchwork-Hint: ignore
Message-Id: <20231216095110.7EFCA81963@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/z3: bump to version 4.12.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b0e7680cf59968f5adac6be8a68d0cdb9dd9e7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 4.12.2, see:
https://github.com/Z3Prover/z3/blob/z3-4.12.4/RELEASE_NOTES.md#version-4124

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index bddf3066ba..c20bbce2d6 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9f58f3710bd2094085951a75791550f547903d75fe7e2fcb373c5f03fc761b8f  z3-4.12.2.tar.gz
+sha256  25e9b18d04ee22f1d872dfe0daaf4c39034744525214e34fedd206e25140e96e  z3-4.12.4.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index 501d9ee61a..f9510ba592 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.12.2
+Z3_VERSION = 4.12.4
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
