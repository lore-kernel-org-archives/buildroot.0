Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77D5CAC5B8
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 11:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72D74418A2;
	Sat, 27 Sep 2025 11:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gC_GFK7Dt1j9; Sat, 27 Sep 2025 11:26:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FEDD4174C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FEDD4174C;
	Sat, 27 Sep 2025 11:26:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2CB177
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00FB940FAF
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWQ5To0BBsT1 for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 11:26:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49AB540F78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49AB540F78
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:26:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3893986464; Sat, 27 Sep 2025 11:26:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Sep 2025 13:22:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 092817421e3ab6acf1a5ac5765ea1e50a68445c8
X-Git-Newrev: 46a913126395aea64df4e39853d41e22430e286c
X-Patchwork-Hint: ignore
Message-Id: <20250927112632.3893986464@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cukinia: bump version to 0.9.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=46a913126395aea64df4e39853d41e22430e286c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://github.com/savoirfairelinux/cukinia/releases/tag/v0.9.0

Signed-off-by: Serosh Deljam <serosh.deljam@savoirfairelinux.com>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cukinia/cukinia.hash | 2 +-
 package/cukinia/cukinia.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cukinia/cukinia.hash b/package/cukinia/cukinia.hash
index cc0393aff9..6957c0e1b5 100644
--- a/package/cukinia/cukinia.hash
+++ b/package/cukinia/cukinia.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  8f608571354d87f7ec2949bd335c616881c05f66fc60d7a2fc7488369c9d307d  cukinia-0.8.0.tar.gz
+sha256  fec5f1d06ed4072b32fff8c7b1e9784aa1d2923d501c4066d47ac792c28e11b0  cukinia-0.9.0.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/cukinia/cukinia.mk b/package/cukinia/cukinia.mk
index a4e3658ede..f5eccdeb63 100644
--- a/package/cukinia/cukinia.mk
+++ b/package/cukinia/cukinia.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUKINIA_VERSION = 0.8.0
+CUKINIA_VERSION = 0.9.0
 CUKINIA_SITE = $(call github,savoirfairelinux,cukinia,v$(CUKINIA_VERSION))
 CUKINIA_LICENSE = Apache-2.0
 CUKINIA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
