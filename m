Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D6CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:31:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8E661245
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F8E661245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B2B3404EB;
	Sat, 16 Oct 2021 08:31:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WVNQP-iLUIwb; Sat, 16 Oct 2021 08:30:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BACA2404B5;
	Sat, 16 Oct 2021 08:30:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9F861BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAAB7404B7
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fdVxuzbMpvYM for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:29:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 032E8404B2
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:29:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6C5E495C59; Sat, 16 Oct 2021 08:26:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 10:26:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e403cef49778717d168026d9f5a4ae0dce09a08
X-Git-Newrev: e9e02ab755e1906f7bdd379ccaa357b0d6359861
X-Patchwork-Hint: ignore
Message-Id: <20211016082647.6C5E495C59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dante: bump to version 1.4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9e02ab755e1906f7bdd379ccaa357b0d6359861
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update indentation in hash file (two spaces)
- Update hash of license file (update in year and authors)

https://www.inet.no/dante/announce-1.4.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dante/dante.hash | 4 ++--
 package/dante/dante.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dante/dante.hash b/package/dante/dante.hash
index cb87cdc04a..a76018fdb6 100644
--- a/package/dante/dante.hash
+++ b/package/dante/dante.hash
@@ -1,5 +1,5 @@
 # From https://www.inet.no/dante/download.html
-sha256	4c97cff23e5c9b00ca1ec8a95ab22972813921d7fbf60fc453e3e06382fc38a7	dante-1.4.2.tar.gz
+sha256  418a065fe1a4b8ace8fbf77c2da269a98f376e7115902e76cda7e741e4846a5d  dante-1.4.3.tar.gz
 
 # Hash for license file
-sha256	954ab6dbcf994711e28e603d8657d6eceef333cd6f9ca6705f0e9d118ab7d69a	LICENSE
+sha256  05e2db26147a8575005f090aada119ea6cb40a4382164929d647f00abef3bdfd  LICENSE
diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index 2c6ddad7ad..ae60252bed 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DANTE_VERSION = 1.4.2
+DANTE_VERSION = 1.4.3
 DANTE_SITE = http://www.inet.no/dante/files
 DANTE_LICENSE = BSD-3-Clause
 DANTE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
