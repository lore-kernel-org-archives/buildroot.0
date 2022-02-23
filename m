Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F14CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 13:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A3BE40ADD;
	Wed,  9 Mar 2022 13:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmYOMOgGtwlm; Wed,  9 Mar 2022 13:32:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 229264051B;
	Wed,  9 Mar 2022 13:32:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 324221BF869
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0755684001
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SaqcWkzIetgC for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 13:30:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CC078404C
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 13:30:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CB55D83915; Wed,  9 Mar 2022 13:21:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 21:27:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ce909afa98223bbd6bb1b2c65dec6cc8982ad31
X-Git-Newrev: 1868f372c02760e324f91ebcf5685323855351f1
X-Patchwork-Hint: ignore
Message-Id: <20220309132156.CB55D83915@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dialog: bump to version
 1.3-20220117
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

commit: https://git.buildroot.net/buildroot/commit/?id=1868f372c02760e324f91ebcf5685323855351f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://invisible-mirror.net/dialog/CHANGES.html#index-t20220117

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14596

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dialog/dialog.hash | 2 +-
 package/dialog/dialog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
index 2286590b66..3136d18b2b 100644
--- a/package/dialog/dialog.hash
+++ b/package/dialog/dialog.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  466163e8b97c2b7709d00389199add3156bd813f60ccb0335d0a30f2d4a17f99  dialog-1.3-20200327.tgz
+sha256  754cb6bf7dc6a9ac5c1f80c13caa4d976e30a5a6e8b46f17b3bb9b080c31041f  dialog-1.3-20220117.tgz
 # Locally computed
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 1c98d354e3..681f8ec9fe 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIALOG_VERSION = 1.3-20200327
+DIALOG_VERSION = 1.3-20220117
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = https://invisible-mirror.net/archives/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
