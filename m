Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD4AC6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 22:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAF578126E;
	Wed, 22 Mar 2023 22:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAF578126E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B58H-KePIohm; Wed, 22 Mar 2023 22:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22A34811A9;
	Wed, 22 Mar 2023 22:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22A34811A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11BBA1BF909
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBFC08401E
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBFC08401E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bFZHd-UhQKPD for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1661A84027
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1661A84027
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0273787589; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 23:38:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 556c32264c98f5696b523c3028d121adaed1e386
X-Git-Newrev: a9d4b6a32fed767d7074febc1e3a9b19fbcfa9bc
X-Patchwork-Hint: ignore
Message-Id: <20230322224400.0273787589@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: bump version to 9.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9d4b6a32fed767d7074febc1e3a9b19fbcfa9bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2023-03/msg00005.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.hash | 2 +-
 package/coreutils/coreutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index eb9a5744c6..72f63b242d 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  61a1f410d78ba7e7f37a5a4f50e6d1320aca33375484a3255eddf17a38580423  coreutils-9.1.tar.xz
+sha256  6885ff47b9cdb211de47d368c17853f406daaf98b148aaecdf10de29cc04b0b3  coreutils-9.2.tar.xz
 # Locally computed
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 931859b0ac..9b07bb31d2 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.1
+COREUTILS_VERSION = 9.2
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
