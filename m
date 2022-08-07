Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9109DC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 17:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D89A24160F;
	Sun,  7 Aug 2022 17:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D89A24160F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p03KdHcyS8Bs; Sun,  7 Aug 2022 17:32:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4DFC41608;
	Sun,  7 Aug 2022 17:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4DFC41608
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42AAE1BF3D6
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 181D840550
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 181D840550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xn4qz3P6_HWd for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 17:32:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A33040377
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 17:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A33040377
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AB2E486F9D; Sun,  7 Aug 2022 17:18:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 19:23:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbf7d5542167c3fda8489f946ba487c0d9381f87
X-Git-Newrev: bcc080cb260c4516dfb5402f89eac80d7e31e2be
X-Patchwork-Hint: ignore
Message-Id: <20220807171817.AB2E486F9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/octave: bump to version 7.2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bcc080cb260c4516dfb5402f89eac80d7e31e2be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 7.1.0, see:
- https://octave.org/news/release/2022/07/28/octave-7.2.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/octave/octave.hash | 2 +-
 package/octave/octave.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index 72d47cdf54..81d7311eeb 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9e8d1f4d64fa1bcfa30a571e240dc83715dbaede1de96a982bdc89cac7ced42c  octave-7.1.0.tar.lz
+sha256  009388289b82fdcc920a2371355049cb6958c735ee9aa3893a256df4a6bf7515  octave-7.2.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 4e828eb734..b28617438a 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 7.1.0
+OCTAVE_VERSION = 7.2.0
 OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
