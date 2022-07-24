Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E20C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98DEB84AB4;
	Sun, 24 Jul 2022 12:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98DEB84AB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NmBfMAXWvR_e; Sun, 24 Jul 2022 12:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 992C184133;
	Sun, 24 Jul 2022 12:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 992C184133
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 150DF1BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8EF181BB2
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8EF181BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFLMOVaxMbtm for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:20:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A156B84C54
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A156B84C54
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8E0F185C25; Sun, 24 Jul 2022 12:06:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 14:19:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77b6d48a990f26f705d89381ab0fed0688c91fc5
X-Git-Newrev: fe920e999630e3de0db519844125dc00afd35eef
X-Patchwork-Hint: ignore
Message-Id: <20220724120647.8E0F185C25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janet: bump to version 1.23.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe920e999630e3de0db519844125dc00afd35eef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index a93129cfa5..473955e391 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7c6969f8e82badc7afa28aa1054555c1c91d2858f9f45c41a82557f5c5ce85bd  janet-1.22.0.tar.gz
+sha256  0b4d5d3632e0d376d9512ea8ea262f31f75c132b488dd7870f472acae709a865  janet-1.23.0.tar.gz
 
 # Locally calculated
 sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index ad09d47c6a..070eae1cf0 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.22.0
+JANET_VERSION = 1.23.0
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
