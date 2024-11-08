Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447C9D64074
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 18:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4F04846F2;
	Fri,  8 Nov 2024 18:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4wObO_WaWkRw; Fri,  8 Nov 2024 18:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2EDE846EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2EDE846EF;
	Fri,  8 Nov 2024 18:21:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36239C2
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 18:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2382C4321B
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 18:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5Od-iKONCEl for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 18:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11DB043211
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11DB043211
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 18:21:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAE1085D63; Fri,  8 Nov 2024 18:21:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 8 Nov 2024 19:19:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47fc9e5509837260310cd7e41335fade29b587b1
X-Git-Newrev: d242ab6b8e2805ee173de54bec47dbbcbcecc939
X-Patchwork-Hint: ignore
Message-Id: <20241108182152.EAE1085D63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgis: bump to version 3.5.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d242ab6b8e2805ee173de54bec47dbbcbcecc939
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/postgis/postgis/blob/3.5.0/NEWS

Licenses updates:
- extensions/address_goecoder is released under MIT License
 https://github.com/postgis/postgis/commit/12b699aebaa4cb817adacfba8ea48dba2d5204f5

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[Julien: fixed Changelog link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/postgis/postgis.hash | 4 ++--
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 7e62e8e168..9e283f5ac7 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c8c874c00ba4a984a87030af6bf9544821502060ad473d5c96f1d4d0835c5892  postgis-3.4.2.tar.gz
-sha256  2a3bde0a77224496ea6d8efa686da7e29ab0dd6b1a8f90ba12beaf7ae28e878a  LICENSE.TXT
+sha256  ca698a22cc2b2b3467ac4e063b43a28413f3004ddd505bdccdd74c56a647f510  postgis-3.5.0.tar.gz
+sha256  81749eea887e78402c9b85896cd629b155bc29256927f818f01001f038146391  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 867aa4caea..a2b121e6f5 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.4.2
+POSTGIS_VERSION = 3.5.0
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
