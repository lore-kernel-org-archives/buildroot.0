Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFAAC7EE29
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 10:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7819941B72;
	Sun,  4 Jun 2023 10:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7819941B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fNwTKo2SR6w6; Sun,  4 Jun 2023 10:42:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ABC141B50;
	Sun,  4 Jun 2023 10:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ABC141B50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B95E81BF3B5
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 10:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 920FA41B4B
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 10:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 920FA41B4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ig9AbY_PKGlu for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 10:42:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EAE841B31
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 10:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EAE841B31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E004867CA; Sun,  4 Jun 2023 10:42:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Jun 2023 12:42:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a46ac2346558d05afe405dda3730169df4b677d2
X-Git-Newrev: 2cd0059419ced783957a6c2d18bac529173fdfcd
X-Patchwork-Hint: ignore
Message-Id: <20230604104244.6E004867CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/git: bump to version
 2.41.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cd0059419ced783957a6c2d18bac529173fdfcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump the package version to 2.41.0. For the release announcement and
notes, see [1].

Link: https://lore.kernel.org/git/xmqqleh3a3wm.fsf@gitster.g/ [1]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 1efa95ed44..91d723ecd1 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  4893b8b98eefc9fdc4b0e7ca249e340004faa7804a433d17429e311e1fef21d2  git-2.40.1.tar.xz
+sha256  e748bafd424cfe80b212cbc6f1bbccc3a47d4862fb1eb7988877750478568040  git-2.41.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index ba86915b36..99646b10dc 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.40.1
+GIT_VERSION = 2.41.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
