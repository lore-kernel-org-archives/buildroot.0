Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFE8C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CDBB83E28;
	Mon, 20 Feb 2023 23:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CDBB83E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P6FsDPl3mVEy; Mon, 20 Feb 2023 23:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41B5283E1D;
	Mon, 20 Feb 2023 23:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41B5283E1D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 725031BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6217C41758
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6217C41758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RrYWbBbJ7yFn for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9682541749
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9682541749
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 845CF8648F; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:51:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 11bb66247bc364ab46b9bf10d769cecdb7b6fdc0
X-Git-Newrev: 7d3690e8628c29d96993e981a9cc8ef05f22a3cc
X-Patchwork-Hint: ignore
Message-Id: <20230220205237.845CF8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bitstream-vera: switch
 to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d3690e8628c29d96993e981a9cc8ef05f22a3cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bitstream-vera/bitstream-vera.hash | 2 +-
 package/bitstream-vera/bitstream-vera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bitstream-vera/bitstream-vera.hash b/package/bitstream-vera/bitstream-vera.hash
index bb31b17a4a..54deb2661c 100644
--- a/package/bitstream-vera/bitstream-vera.hash
+++ b/package/bitstream-vera/bitstream-vera.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-1.10.tar.bz2.sha256sum
+# From https://download.gnome.org/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-1.10.tar.bz2.sha256sum
 sha256  db5b27df7bbb318036ebdb75acd3e98f1bd6eb6608fb70a67d478cd243d178dc  ttf-bitstream-vera-1.10.tar.bz2
 # locally computed
 sha256  3361d054759a2fc686a2c058be82deaf9c2e6fe549be9004d7935a6c1736315d  COPYRIGHT.TXT
diff --git a/package/bitstream-vera/bitstream-vera.mk b/package/bitstream-vera/bitstream-vera.mk
index f487d637c2..2c9dc1a5cb 100644
--- a/package/bitstream-vera/bitstream-vera.mk
+++ b/package/bitstream-vera/bitstream-vera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BITSTREAM_VERA_VERSION = 1.10
-BITSTREAM_VERA_SITE = http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/$(BITSTREAM_VERA_VERSION)
+BITSTREAM_VERA_SITE = https://download.gnome.org/sources/ttf-bitstream-vera/$(BITSTREAM_VERA_VERSION)
 BITSTREAM_VERA_SOURCE = ttf-bitstream-vera-$(BITSTREAM_VERA_VERSION).tar.bz2
 BITSTREAM_VERA_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/ttf-bitstream-vera
 BITSTREAM_VERA_LICENSE = BitstreamVera
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
