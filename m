Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2C8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 763B941505;
	Sun, 10 Apr 2022 15:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6YU9F_q4pphg; Sun, 10 Apr 2022 15:38:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DDE14109B;
	Sun, 10 Apr 2022 15:38:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 159151BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 134EB81D88
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XVD2bnSxdHtd for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:38:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F20882512
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:38:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 88768836D1; Sun, 10 Apr 2022 15:29:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 17:34:19 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 97fcc6ef0e07337dd419128663f4c0e95d1150ee
X-Git-Newrev: 92da1d43290f88f8067580b985b44531a984f6a2
X-Patchwork-Hint: ignore
Message-Id: <20220410152900.88768836D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ace: bump to
 version 7.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=92da1d43290f88f8067580b985b44531a984f6a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 539d915e44ae3b9a826966f106a3cfb3ced1801e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ace/ace.hash | 5 ++++-
 package/ace/ace.mk   | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/ace/ace.hash b/package/ace/ace.hash
index 92fd42e131..2387927879 100644
--- a/package/ace/ace.hash
+++ b/package/ace/ace.hash
@@ -1,3 +1,6 @@
+# From https://download.dre.vanderbilt.edu/previous_versions/ACE-7.0.6.tar.bz2.md5:
+md5  d1656851619aff15365270ccf2d56c6e  ACE-7.0.6.tar.bz2
+
 # Locally Computed:
-sha256  a28339750620c70cd29a8a7088a4bc6ebaf1ff7ba667498a0279ac97f0e32e01  ACE-7.0.1.tar.gz
+sha256  4a0cd7da4851f769fddfcf33f663eba4afad824efeff9f59f134c4640ee80216  ACE-7.0.6.tar.bz2
 sha256  687bf9d16119e0caf6fb5c18214928fd6ea0da10df91e906255b7613af8061d8  COPYING
diff --git a/package/ace/ace.mk b/package/ace/ace.mk
index 8df89d8c6f..7299f0d40c 100644
--- a/package/ace/ace.mk
+++ b/package/ace/ace.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ACE_VERSION = 7.0.1
-ACE_SOURCE = ACE-$(ACE_VERSION).tar.gz
+ACE_VERSION = 7.0.6
+ACE_SOURCE = ACE-$(ACE_VERSION).tar.bz2
 ACE_SITE = http://download.dre.vanderbilt.edu/previous_versions
 ACE_LICENSE = DOC
 ACE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
