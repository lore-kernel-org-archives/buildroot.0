Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3349AC71150
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 11:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E781380B34;
	Sun, 15 Jun 2025 11:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Uhjz_1IMhmG; Sun, 15 Jun 2025 11:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 377FD80B57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 377FD80B57;
	Sun, 15 Jun 2025 11:13:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CF8B1A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8ED4C40073
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nw0wKtyF0D8H for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 11:13:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7BF84004E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7BF84004E
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:13:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B41EA838A5; Sun, 15 Jun 2025 11:13:18 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 13:05:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2a4e7f7adaeda8a9dc2fda361e002556e8a1b32
X-Git-Newrev: 2aea00d782aa371e6d6ef6ffdca8b911ce9172a0
X-Patchwork-Hint: ignore
Message-Id: <20250615111318.B41EA838A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.5.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=2aea00d782aa371e6d6ef6ffdca8b911ce9172a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release announce:
https://sourceforge.net/p/fetchmail/mailman/message/59193648/

Updated license hash due to copyright year bump:
https://sourceforge.net/p/fetchmail/git/ci/62a11ca4064e5b59e57ca7a8fce08c82af259731/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to release announce]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fetchmail/fetchmail.hash | 6 +++---
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index f52dbed3d9..2a67bc1e22 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59113044/
-sha256  8fd0477408620ae382c1d0ef83d8946a95e5be0c2e582dd4ebe55cba513a45fe  fetchmail-6.5.2.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59193648/
+sha256  d74e893b78ef29ebef375ab7e726d2977140f8f1208f5905569395cbdae4c23d  fetchmail-6.5.3.tar.xz
 # Locally computed:
-sha256  1d5eb054414ceb75e018e2830d2c2b61d3ac0df02d5376330766237a091ea771  COPYING
+sha256  e5768c44445cf051dd88e0cf8bfc16d81f7b1a7cc28f4e0204a4f8d81cd16977  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index ef91196d63..e3fad2f4c4 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.5
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).2
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).3
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
