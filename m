Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D73C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 17:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4382440B17;
	Tue, 20 Aug 2024 17:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0UWsfZiKSjk; Tue, 20 Aug 2024 17:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF7B740B65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF7B740B65;
	Tue, 20 Aug 2024 17:22:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BA201BF97E
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78D0C40275
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nnfn0ZUoa6ql for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 17:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C17840274
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C17840274
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 17:22:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 496BC86159; Tue, 20 Aug 2024 17:22:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 19:13:38 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: c00bd4e9513a77819de05561dc7aba3c375f6d30
X-Git-Newrev: ef5c954a1f19bd4fc7843ec887a7dd2e0e181af4
X-Patchwork-Hint: ignore
Message-Id: <20240820172230.496BC86159@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/ncftp: use
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef5c954a1f19bd4fc7843ec887a7dd2e0e181af4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

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
index a3aa3fb194..57c3a5d08b 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -8,7 +8,7 @@ NCFTP_VERSION = 3.2.7
 NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.xz
 NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp
 NCFTP_TARGET_BINS = ncftp
-NCFTP_LICENSE = Clarified Artistic License
+NCFTP_LICENSE = ClArtistic
 NCFTP_LICENSE_FILES = doc/LICENSE.txt
 
 NCFTP_DEPENDENCIES = host-autoconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
