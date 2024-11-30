Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F060E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D6E4812D9;
	Sun,  8 Dec 2024 13:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgGj_-w9zfoi; Sun,  8 Dec 2024 13:08:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD5DE81E5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD5DE81E5B;
	Sun,  8 Dec 2024 13:08:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04492ED2
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC3026082C
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOKtkJXr6kTk for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:06:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FF196085D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FF196085D
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D21286B54; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Nov 2024 23:23:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0030fc93998275fd5533ea1fdca7a7665bbea86
X-Git-Newrev: 5b808454f8e11555483dc465098b6d0b2cd677c4
X-Patchwork-Hint: ignore
Message-Id: <20241208130653.9D21286B54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/simple-mail: version bump 3.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b808454f8e11555483dc465098b6d0b2cd677c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 3.0.0, see:
https://github.com/cutelyst/simple-mail/compare/v3.0.0...v3.1.0

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/simple-mail/simple-mail.hash | 2 +-
 package/simple-mail/simple-mail.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/simple-mail/simple-mail.hash b/package/simple-mail/simple-mail.hash
index 4de1525b53..ba4d36c2b3 100644
--- a/package/simple-mail/simple-mail.hash
+++ b/package/simple-mail/simple-mail.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f93e93843d11da5c4ec44225eba46ccb3e9710fd594a27b966901745429ed4f4  simple-mail-3.0.0.tar.gz
+sha256  d4a46b5c3f706669ffb3c9e4d2ff5e2bd892eda639f80784d862fa94a2082eb2  simple-mail-3.1.0.tar.gz
 
 # Hash for license file
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
diff --git a/package/simple-mail/simple-mail.mk b/package/simple-mail/simple-mail.mk
index 82bea45f21..7063e9dd0f 100644
--- a/package/simple-mail/simple-mail.mk
+++ b/package/simple-mail/simple-mail.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIMPLE_MAIL_VERSION = 3.0.0
+SIMPLE_MAIL_VERSION = 3.1.0
 SIMPLE_MAIL_SITE = $(call github,cutelyst,simple-mail,v$(SIMPLE_MAIL_VERSION))
 SIMPLE_MAIL_INSTALL_STAGING = YES
 SIMPLE_MAIL_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
