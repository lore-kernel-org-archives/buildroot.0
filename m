Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E022CD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 20:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5673410D4;
	Tue,  2 Apr 2024 20:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9NxyafTUuot; Tue,  2 Apr 2024 20:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 228EB410AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 228EB410AD;
	Tue,  2 Apr 2024 20:02:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63EC91BF977
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 20:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D881E81F38
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXaaEfD_nqqs for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 20:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B98481F53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B98481F53
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5D2D8462A; Tue,  2 Apr 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Apr 2024 21:39:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8937db8dd595e0988751e5dbb568e870b07b39cc
X-Git-Newrev: 6a518322b3dc70e1d589d20b87c44f5fdafa25c6
X-Patchwork-Hint: ignore
Message-Id: <20240402200226.C5D2D8462A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/git: bump to version 2.44.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a518322b3dc70e1d589d20b87c44f5fdafa25c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the package version to 2.44.0. For the full release notes, see the
release announcement at [1].

[1] https://lore.kernel.org/git/xmqqbk87w164.fsf@gitster.g/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 9cf044cc07..f609a4aaa4 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  5446603e73d911781d259e565750dcd277a42836c8e392cac91cf137aa9b76ec  git-2.43.0.tar.xz
+sha256  e358738dcb5b5ea340ce900a0015c03ae86e804e7ff64e47aa4631ddee681de3  git-2.44.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 1502968186..a9cc3c30a7 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.43.0
+GIT_VERSION = 2.44.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
