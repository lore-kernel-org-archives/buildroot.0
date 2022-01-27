Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F69C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 16:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 735AF41CB4;
	Thu, 27 Jan 2022 16:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9BULx8rxZhDk; Thu, 27 Jan 2022 16:39:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABBE141CBA;
	Thu, 27 Jan 2022 16:39:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 872841C113E
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74FE3401DD
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:39:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6-Su0Yn3Y0M5 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 16:39:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8092C400CC
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 16:39:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 50FA382837; Thu, 27 Jan 2022 16:32:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 17:39:03 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6c0c34c6346e54ea8089a163540a45c327859082
X-Git-Newrev: b58aa61fa14b31c7c5f03151469a0fb6bdffccc5
X-Patchwork-Hint: ignore
Message-Id: <20220127163217.50FA382837@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gnuchess: bump to
 version 6.2.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=b58aa61fa14b31c7c5f03151469a0fb6bdffccc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

https://lists.gnu.org/archive/html/info-gnu-chess/2021-05/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4cb36ff7707d7b591b2896b089ce2f6c76a99275)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuchess/gnuchess.hash | 2 +-
 package/gnuchess/gnuchess.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuchess/gnuchess.hash b/package/gnuchess/gnuchess.hash
index 1641a7d8f9..b68eb6e0ee 100644
--- a/package/gnuchess/gnuchess.hash
+++ b/package/gnuchess/gnuchess.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  e536675a61abe82e61b919f6b786755441d9fcd4c21e1c82fb9e5340dd229846  gnuchess-6.2.7.tar.gz
+sha256  d50446cda8012240321da39cddbb4df4d08458a8d538a4738882814139583847  gnuchess-6.2.8.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 60327dfe06..29d3590849 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUCHESS_VERSION = 6.2.7
+GNUCHESS_VERSION = 6.2.8
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_LICENSE = GPL-3.0+
 GNUCHESS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
