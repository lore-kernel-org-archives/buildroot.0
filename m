Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E652C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 11:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFC9181B7B;
	Sun, 21 Aug 2022 11:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFC9181B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ph9wfWG-cmKJ; Sun, 21 Aug 2022 11:30:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0BBF81B52;
	Sun, 21 Aug 2022 11:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0BBF81B52
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7E1D1BF97A
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 11:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8199A400E2
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 11:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8199A400E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5maYJ_04S8b for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 11:29:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 799074000E
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 11:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 799074000E
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9E16087A01; Sun, 21 Aug 2022 11:15:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 13:29:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3b4d8daa6d30cb09ba9d57b15299a722d2f57a38
X-Git-Newrev: 638b1422c6bb99f99ee043b79edfd01cdfdf6c2b
X-Patchwork-Hint: ignore
Message-Id: <20220821111509.9E16087A01@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tzdata: bump to
 version 2022c
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

commit: https://git.buildroot.net/buildroot/commit/?id=638b1422c6bb99f99ee043b79edfd01cdfdf6c2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

update homepage with https

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tzdata/Config.in   | 2 +-
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tzdata/Config.in b/package/tzdata/Config.in
index 1e6cc0fc64..31071afb03 100644
--- a/package/tzdata/Config.in
+++ b/package/tzdata/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_TZDATA
 	help
 	  Time zone database
 
-	  http://www.iana.org/time-zones/repository/tz-link.html
+	  https://data.iana.org/time-zones/tz-link.html
diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 55346539ab..b203e5bf5b 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2021-October/000069.html
-sha512  c1e8d04e049157ed5d4af0868855bbd75517e3d7e1db9c41d5283ff260109de46b6fac6be94828201d093e163d868044ac2a9db2bf0aeab800e264d0c73a9119  tzdata2021e.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2022-August/000072.html
+sha512  e2ae92abac6d87ce4ab4ba9012e868e1791b842e083293489debc0c671b9cf135b5b70426dacb6dbebbf6eba24463205225ae45bb7df891a086b25475f85ee0b  tzdata2022c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 9cf8c2ea45..21ea94ecad 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2021e
+TZDATA_VERSION = 2022c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
