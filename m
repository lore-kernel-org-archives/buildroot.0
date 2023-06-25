Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F20EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 15:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD4E416CA;
	Sun, 25 Jun 2023 15:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AD4E416CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yt5TI_ucLXqa; Sun, 25 Jun 2023 15:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A32840932;
	Sun, 25 Jun 2023 15:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A32840932
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24BAA1BF909
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEA6081CDB
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEA6081CDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vaHcnfKNx8Qi for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 15:01:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E229B81CA0
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 15:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E229B81CA0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDCDD84AE9; Sun, 25 Jun 2023 15:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 16:43:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50da44aa0cede1466264011a94fdd80f5c345043
X-Git-Newrev: f4319f892b7a7559a4e2eef733eb1673ed8a7108
X-Patchwork-Hint: ignore
Message-Id: <20230625150109.CDCDD84AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xwd: bump version to
 1.0.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4319f892b7a7559a4e2eef733eb1673ed8a7108
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-June/003400.html

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/x11r7/xapp_xwd/xapp_xwd.hash | 6 +++---
 package/x11r7/xapp_xwd/xapp_xwd.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xwd/xapp_xwd.hash b/package/x11r7/xapp_xwd/xapp_xwd.hash
index 7595286499..cc81b05ce5 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.hash
+++ b/package/x11r7/xapp_xwd/xapp_xwd.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-August/003102.html
-sha256  fbaa2b34163714fe7be22b60920ea4683f63b355babb1781aec2e452a033031b  xwd-1.0.8.tar.bz2
-sha512  d2aaf42c60d20c4b09f4947d3702058dbfad4633b2c5c8ea62e8897fc9ced1ab3417ce99255a223286d21a731f543019470737e3074f1bc68033b4eb47bc773e  xwd-1.0.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-June/003400.html
+sha256  dc121b84947eb4a3d1131bff1e9844cfa2124d95b47b35f9932340fa931fbd3f  xwd-1.0.9.tar.xz
+sha512  ae59661b05160f5658920fd79031b6b8548cb7bbfc734194edb0acef5c95f76b210ca4443e9506fc1a0cb9df47ee7c22948502971afe578b44c75aa2a1138d56  xwd-1.0.9.tar.xz
 # Locally computed
 sha256  7cfda56afd92a1ecd2f23bd0064e01b5141053390d854785504adfe2c0fbd946  COPYING
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index 1c5bd50166..8960aaffdb 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XWD_VERSION = 1.0.8
-XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.bz2
+XAPP_XWD_VERSION = 1.0.9
+XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.xz
 XAPP_XWD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XWD_LICENSE = MIT
 XAPP_XWD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
