Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F17C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66C48400DB;
	Sun, 14 Jul 2024 20:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7BPJSHvQ-0o; Sun, 14 Jul 2024 20:23:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D83C5405C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D83C5405C8;
	Sun, 14 Jul 2024 20:23:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DC061BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A696401DF
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdgRHxJ_ZfzB for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE06740106
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE06740106
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:23:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D43AF86908; Sun, 14 Jul 2024 20:23:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 21:38:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca6c896bdd75cf334ac9a02a6dd786415221f55e
X-Git-Newrev: d68d8c4d34f55cae0bd2421ab18d98e172ef5bb5
X-Patchwork-Hint: ignore
Message-Id: <20240714202319.D43AF86908@busybox.osuosl.org>
Subject: [Buildroot] [git commit] skalibs: bump to version 2.14.2.0
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
Content-Type: multipart/mixed; boundary="===============5069639001390887612=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5069639001390887612==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d68d8c4d34f55cae0bd2421ab18d98e172ef5bb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/skalibs/skalibs.hash | 2 +-
 package/skalibs/skalibs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index d871ee6503..1e6bd96671 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  b6b79b816f4ba0b6801676b0ed4179b59c8c7809eeffe26db672e404636befc3  skalibs-2.14.1.1.tar.gz
+sha256  ddfec5730e5b2f19d0381ecf7f796b39a6e473236bda0ad8d3776a3fe7b07e43  skalibs-2.14.2.0.tar.gz
 sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 67e3c694fc..45f3e15a7b 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.14.1.1
+SKALIBS_VERSION = 2.14.2.0
 SKALIBS_SITE = https://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING

--===============5069639001390887612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5069639001390887612==--
