Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C2CC43334
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 07:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6A0F411AA;
	Fri,  8 Jul 2022 07:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6A0F411AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Roanf8r1swTA; Fri,  8 Jul 2022 07:36:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D423A4158D;
	Fri,  8 Jul 2022 07:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D423A4158D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22A581BF403
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 07:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA9A941BBE
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 07:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA9A941BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xXfyvR8yE4UE for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 07:36:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCB2441BD8
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 07:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCB2441BD8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C313C83233; Fri,  8 Jul 2022 07:23:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Jul 2022 09:35:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70532a8e09ee369e4a589089b0f09b2cc648099a
X-Git-Newrev: 227b162728782ff501085984afe6be9ec69d013c
X-Patchwork-Hint: ignore
Message-Id: <20220708072313.C313C83233@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dtv-scan-tables: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=227b162728782ff501085984afe6be9ec69d013c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dtv-scan-tables/dtv-scan-tables.hash | 2 +-
 package/dtv-scan-tables/dtv-scan-tables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
index 8d4290fc53..e53a168832 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  186a6fe1755d83d583590de3f83013c2e4df47b258c88180dffd1afb0d36d4d6  dtv-scan-tables-25ee9e0ce4bbacdb278d4cff306ceb6528c4f548-br1.tar.gz
+sha256  b77c6bcbbc20f6b6bdbf735fb75cf9bec8634e1e6d3a32e6db2573deeb7a2212  dtv-scan-tables-57ed2982275045ea5e92ef2a40b9fa58255852e5-br1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 4150abd1a0..45264a41c5 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTV_SCAN_TABLES_VERSION = 25ee9e0ce4bbacdb278d4cff306ceb6528c4f548
+DTV_SCAN_TABLES_VERSION = 57ed2982275045ea5e92ef2a40b9fa58255852e5
 DTV_SCAN_TABLES_SITE = https://git.linuxtv.org/dtv-scan-tables.git
 DTV_SCAN_TABLES_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
