Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86AFC433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 517698143F;
	Tue, 10 May 2022 19:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42fzn4cAoA48; Tue, 10 May 2022 19:38:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D99C81433;
	Tue, 10 May 2022 19:38:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6B01BF32E
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AB1481422
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJobE-N95toT for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:38:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A78CB813CF
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7E26485CD9; Tue, 10 May 2022 19:27:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 21:37:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0eb073ca2ba89dad2e531644fd33f693d228ef94
X-Git-Newrev: cf46a20f26a4002de8f316845d0f08f7591d6f58
X-Patchwork-Hint: ignore
Message-Id: <20220510192737.7E26485CD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdbm: bump to version 1.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf46a20f26a4002de8f316845d0f08f7591d6f58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdbm/gdbm.hash | 6 +++---
 package/gdbm/gdbm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
index 59f9ea62de..7449d5dc9d 100644
--- a/package/gdbm/gdbm.hash
+++ b/package/gdbm/gdbm.hash
@@ -1,6 +1,6 @@
 # From https://www.gnu.org.ua/software/gdbm/download.html
-md5  0bbd38f12656e4728e2f7c4708aec014  gdbm-1.22.tar.gz
-sha1  c45cc0178cbf41828369b07749d41778741703bd  gdbm-1.22.tar.gz
+md5  8551961e36bf8c70b7500d255d3658ec  gdbm-1.23.tar.gz
+sha1  50ba1b1d45ce33fd44e4fdaaf3b55a9d8f3dc418  gdbm-1.23.tar.gz
 # Locally computed
-sha256  f366c823a6724af313b6bbe975b2809f9a157e5f6a43612a72949138d161d762  gdbm-1.22.tar.gz
+sha256  74b1081d21fff13ae4bd7c16e5d6e504a4c26f7cde1dca0d963a484174bbcacd  gdbm-1.23.tar.gz
 sha256  690d762f2e8e149ab1e2d6a409a3853b6151a2533b2382fae549a176d6bedecf  COPYING
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 52624f5807..e807a8e1e7 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.22
+GDBM_VERSION = 1.23
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
