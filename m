Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC956EDE9BF
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAF7460A6F;
	Tue, 10 Sep 2024 20:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yL5SnRuKVf8K; Tue, 10 Sep 2024 20:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C07060A99
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C07060A99;
	Tue, 10 Sep 2024 20:52:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0623E1BF95A
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 991AF40247
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyJMtP3lltd9 for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7A0640465
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7A0640465
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE8C186F5D; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fcb823ffdcfc3d89503f859a1042a56ad5d47f46
X-Git-Newrev: e2a0ab180c13ecb41b1c1aea65c9ca69fbe8bc90
X-Patchwork-Hint: ignore
Message-Id: <20240910205130.DE8C186F5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bc: fix typos in patch descriptions
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2a0ab180c13ecb41b1c1aea65c9ca69fbe8bc90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch                | 2 +-
 package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch | 2 +-
 package/bc/0004-no-gen-libmath.patch                                   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch b/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
index 03d15f5524..5ff6125f67 100644
--- a/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
+++ b/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
@@ -3,7 +3,7 @@ From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Fri, 13 Sep 2019 13:45:02 -0500
 Subject: [PATCH] bc: use MAKEINFO variable for docs
 
-Use the appropiate MAKEINFO variable rather than the hardcoded makeinfo
+Use the appropriate MAKEINFO variable rather than the hardcoded makeinfo
 command directly, otherwise missing logic never works.
 
 Fixes:
diff --git a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
index 87654e3c14..7649ae8c4f 100644
--- a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
+++ b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
@@ -16,7 +16,7 @@ Quoting from the bug report:
      were correct.  I _think_ I got them all.  -iwj.
      -- Ian Jackson <iwj@ubuntu.com>  Tue,  4 Apr 2006 17:21:02 +0100
 
-Upsteam:
+Upstream:
 https://sources.debian.org/patches/bc/1.07.1-2/05_notice_read_write_errors.diff/
 
 [Reformatted to GIT for 1.0.7.1 by Matt W]
diff --git a/package/bc/0004-no-gen-libmath.patch b/package/bc/0004-no-gen-libmath.patch
index 7cd506be2c..15b7b9e5a8 100644
--- a/package/bc/0004-no-gen-libmath.patch
+++ b/package/bc/0004-no-gen-libmath.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] no gen libmath
 
 These rules are not cross-friendly so delete them.  libmath has been
 generated offline and included as part of this patch as the fbc tool
-used to generate that header is assuming the cross archtecture and
+used to generate that header is assuming the cross architecture and
 can't execute.
 
 Upstream:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
