Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447FDEB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 13:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4BF2839A4;
	Wed, 14 Jun 2023 13:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4BF2839A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XGhQ5TX0016W; Wed, 14 Jun 2023 13:52:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84E8883979;
	Wed, 14 Jun 2023 13:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84E8883979
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0253B1BF2BA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC416402BA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC416402BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fAyVV_OEqxL for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 13:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0097402B7
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0097402B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA3E7836BC; Wed, 14 Jun 2023 13:52:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 15:41:44 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: fcb704ecfc1d42a7382bd5cedb1a2b03e23569fe
X-Git-Newrev: 952bf976b230cd1ce92281b81716a4a899525fcc
X-Patchwork-Hint: ignore
Message-Id: <20230614135234.CA3E7836BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/bird: bump to
 version 2.0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=952bf976b230cd1ce92281b81716a4a899525fcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Bugfix release, with "Important bugfixes".  For details, see the
announcement:

https://bird.network.cz/pipermail/bird-users/2023-January/016560.html

Signed-off-by: Itz 'toinux' Wam <itz.wam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit eb940ab43d6ec8b0703182fd491e3ef9c57acc6e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bird/bird.hash | 2 +-
 package/bird/bird.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bird/bird.hash b/package/bird/bird.hash
index 3e00a1993d..a62fbba630 100644
--- a/package/bird/bird.hash
+++ b/package/bird/bird.hash
@@ -1,2 +1,2 @@
-sha256  60a7b83b67b9d089d2a745a11fddd12461f631abc7b645b6c085adf90b3f55d6  bird-2.0.11.tar.gz
+sha256  3ec462a237d06d1f4455d6ec00a42f0b1686061fc988e5c89a841d01dd753b53  bird-2.0.12.tar.gz
 sha256  94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 1295358fb9..f1b2ee6c5e 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIRD_VERSION = 2.0.11
+BIRD_VERSION = 2.0.12
 BIRD_SITE = https://bird.network.cz/download
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
