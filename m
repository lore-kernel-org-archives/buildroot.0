Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32404C531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 17:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B894F40AEB;
	Tue, 20 Aug 2024 17:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QITK1uWfinaE; Tue, 20 Aug 2024 17:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94F1C40B09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94F1C40B09;
	Tue, 20 Aug 2024 17:21:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 823F41BF37C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 079056088D
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCQy81HXLzrH for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 17:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28DEB608F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28DEB608F9
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 17:21:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 215348614D; Tue, 20 Aug 2024 17:21:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 19:13:43 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 53e5169e863532455a53ff5c030d6ffa1d230670
X-Git-Newrev: e61425fd6448b2d46216fabb5936b0383ed1ea96
X-Patchwork-Hint: ignore
Message-Id: <20240820172121.215348614D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ncftp: use
 correct SPDX license code
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

commit: https://git.buildroot.net/buildroot/commit/?id=e61425fd6448b2d46216fabb5936b0383ed1ea96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

According to https://spdx.org/licenses/, the correct license code for
the "Clarified Artistic License" is ClArtistic.

The only other package in Buildroot containing code under this license
is google-breakpad, and it is already using the ClArtistic SPDX code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 2ca698051c50546a70e9f7b625f2ee9a2a6a2840)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncftp/ncftp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index d380ebae02..789da1f454 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -10,7 +10,7 @@ NCFTP_VERSION = 3.2.6
 NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.gz
 NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp/older_versions
 NCFTP_TARGET_BINS = ncftp
-NCFTP_LICENSE = Clarified Artistic License
+NCFTP_LICENSE = ClArtistic
 NCFTP_LICENSE_FILES = doc/LICENSE.txt
 
 NCFTP_DEPENDENCIES = host-autoconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
