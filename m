Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87557C27C76
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F823404C3;
	Sat, 21 Jan 2023 13:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F823404C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id frVbuEgRPPRt; Sat, 21 Jan 2023 13:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A612404AE;
	Sat, 21 Jan 2023 13:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A612404AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CEE71BF847
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26B5B82C75
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26B5B82C75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iCt66Wzf7VfP for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65A6282BA7
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65A6282BA7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 536DA8694D; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:51:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d3690e8628c29d96993e981a9cc8ef05f22a3cc
X-Git-Newrev: 0e483a7340a4aeecf1d362328e06c2fcdec1dcae
X-Patchwork-Hint: ignore
Message-Id: <20230121131609.536DA8694D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cantarell: switch to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e483a7340a4aeecf1d362328e06c2fcdec1dcae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cantarell/cantarell.hash | 2 +-
 package/cantarell/cantarell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cantarell/cantarell.hash b/package/cantarell/cantarell.hash
index 49b4634063..18e0fc2cfa 100644
--- a/package/cantarell/cantarell.hash
+++ b/package/cantarell/cantarell.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.25.sha256sum
+# From https://download.gnome.org/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.25.sha256sum
 sha256  14a228aa0b516dfc367b434a850f955a00c57fc549cbb05348e2b150196a737f  cantarell-fonts-0.0.25.tar.xz
 # locally computed
 sha256  79a9d6198c0d9192c1b0bf55bcbc404a39390bd0d8c650cf20d652c2eaa284d8  COPYING
diff --git a/package/cantarell/cantarell.mk b/package/cantarell/cantarell.mk
index 2769b35c1f..59e65b25c1 100644
--- a/package/cantarell/cantarell.mk
+++ b/package/cantarell/cantarell.mk
@@ -6,7 +6,7 @@
 
 CANTARELL_VERSION_MAJOR = 0.0
 CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).25
-CANTARELL_SITE = http://ftp.gnome.org/pub/gnome/sources/cantarell-fonts/$(CANTARELL_VERSION_MAJOR)
+CANTARELL_SITE = https://download.gnome.org/sources/cantarell-fonts/$(CANTARELL_VERSION_MAJOR)
 CANTARELL_SOURCE = cantarell-fonts-$(CANTARELL_VERSION).tar.xz
 CANTARELL_DEPENDENCIES = host-pkgconf
 CANTARELL_LICENSE = OFL-1.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
