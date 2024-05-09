Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C59C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C10F81AAB;
	Thu,  9 May 2024 15:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6RUyGAi0pCd; Thu,  9 May 2024 15:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A45281C56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A45281C56;
	Thu,  9 May 2024 15:59:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FAF31BF2B0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89CF9418E9
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBDi2Ptpp-xa for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:59:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4DA740701
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4DA740701
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:59:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24AE086C69; Thu,  9 May 2024 15:59:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 17:57:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c107dd33e679becf8b58d78d088b5320734d3e31
X-Git-Newrev: 1fd8391ab3d6bb3d65d7d2ca324e267f8c982226
X-Patchwork-Hint: ignore
Message-Id: <20240509155924.24AE086C69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dotconf: bump version to 1.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fd8391ab3d6bb3d65d7d2ca324e267f8c982226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dotconf/dotconf.hash | 2 +-
 package/dotconf/dotconf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dotconf/dotconf.hash b/package/dotconf/dotconf.hash
index 3233ea62c8..aa2ddc25bd 100644
--- a/package/dotconf/dotconf.hash
+++ b/package/dotconf/dotconf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7f1ecf40de1ad002a065a321582ed34f8c14242309c3547ad59710ae3c805653  dotconf-1.3.tar.gz
+sha256  5922c46cacf99b2ecc4853d28a2bda4a489292e73276e604bd9cba29dfca892d  dotconf-1.4.1.tar.gz
 sha256  a50cc98d5044a7bbddabe61fc0ec42aa671c73bf414d0c6b50da83ea8ae041c6  COPYING
diff --git a/package/dotconf/dotconf.mk b/package/dotconf/dotconf.mk
index 26e78b3c7a..7ad5c6aa74 100644
--- a/package/dotconf/dotconf.mk
+++ b/package/dotconf/dotconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOTCONF_VERSION = 1.3
+DOTCONF_VERSION = 1.4.1
 DOTCONF_SITE = $(call github,williamh,dotconf,v$(DOTCONF_VERSION))
 DOTCONF_LICENSE = LGPL-2.1
 DOTCONF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
