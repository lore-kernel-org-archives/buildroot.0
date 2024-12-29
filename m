Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DB4E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 22:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D7CA4064E;
	Sun, 29 Dec 2024 22:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGchkoUjmYT6; Sun, 29 Dec 2024 22:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CCCC403A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CCCC403A6;
	Sun, 29 Dec 2024 22:48:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC40572
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8329403D8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QquF1FOcZgb1 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 22:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C561B4013D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C561B4013D
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:48:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B04A2877A7; Sun, 29 Dec 2024 22:48:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 23:47:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcaffa0a04af278d154e6e08b81a06a40a1b3ee9
X-Git-Newrev: 7824d5c4c842bff0d9dd6eae63c0da256082b503
X-Patchwork-Hint: ignore
Message-Id: <20241229224840.B04A2877A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/octave: bump to version 9.3.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7824d5c4c842bff0d9dd6eae63c0da256082b503
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See release announce:
https://octave.org/news/release/2024/12/15/octave-9.3.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/octave/octave.hash | 4 ++--
 package/octave/octave.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index d9313734f1..5d96f9232c 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-# https://ftp.gnu.org/gnu/octave/octave-9.2.0.tar.lz.sig
+# https://ftp.gnu.org/gnu/octave/octave-9.3.0.tar.lz.sig
 # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
-sha256  dcb2c098701cfcbc083f07e90e146261d15cdbf5e89c031032422112c89b47da  octave-9.2.0.tar.lz
+sha256  166e3ee492b2b1cade136cca50180c6adbbbd134fd1f34ae46e2948544a598ec  octave-9.3.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 34d9288c75..3989b85a4a 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 9.2.0
+OCTAVE_VERSION = 9.3.0
 OCTAVE_SITE = $(BR2_GNU_MIRROR)/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
