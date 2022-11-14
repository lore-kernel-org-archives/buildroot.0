Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD588C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9579260A71;
	Mon,  5 Dec 2022 11:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9579260A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lP0EbXo1FYvE; Mon,  5 Dec 2022 11:59:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0ADB60A47;
	Mon,  5 Dec 2022 11:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0ADB60A47
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F240A1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55FBA415FE
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55FBA415FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uyWUr6MmNyzU for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C9164163E
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C9164163E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A49B85BA3; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 23:13:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4aaac0684add37f65fdf69512cdb04ec8f5ef0e
X-Git-Newrev: b2bf6853c11fffb5621632d60f1d3d5ee71e8c0d
X-Patchwork-Hint: ignore
Message-Id: <20221205112609.9A49B85BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/octave: bump to version 7.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2bf6853c11fffb5621632d60f1d3d5ee71e8c0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 7.2.0, see:
https://octave.org/news/release/2022/11/02/octave-7.3.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/octave/octave.hash | 2 +-
 package/octave/octave.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index 81d7311eeb..9696f2a00a 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  009388289b82fdcc920a2371355049cb6958c735ee9aa3893a256df4a6bf7515  octave-7.2.0.tar.lz
+sha256  fdb32602252289e068431329add2eed146e6f26301cbb5fc4412f9d972db9475  octave-7.3.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index b28617438a..647f988a3f 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 7.2.0
+OCTAVE_VERSION = 7.3.0
 OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
