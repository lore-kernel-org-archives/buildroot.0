Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EAFC3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 19:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFD7360666;
	Fri,  2 Aug 2024 19:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFgwMjZf3WF3; Fri,  2 Aug 2024 19:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D047060744
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D047060744;
	Fri,  2 Aug 2024 19:24:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1E211BF487
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 19:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CC0984560
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 19:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWrhJzW2e4FD for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 19:24:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA385811E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA385811E0
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 19:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4F9583BA9; Fri,  2 Aug 2024 19:24:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 20:08:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4703a7ae9176b3a9d824880ef095b1b80c123df4
X-Git-Newrev: 905409a245a5adfbca4dcf934a52aaca992a5435
X-Patchwork-Hint: ignore
Message-Id: <20240802192426.C4F9583BA9@busybox.osuosl.org>
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=905409a245a5adfbca4dcf934a52aaca992a5435
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dtv-scan-tables/dtv-scan-tables.hash | 2 +-
 package/dtv-scan-tables/dtv-scan-tables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
index fd2edb13c8..f110bb6dee 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  6bf3e1839f3c4ab9c63994043c1a5dfd3e2b9a6f717fd1db3db0e7a53baf5518  dtv-scan-tables-57ed2982275045ea5e92ef2a40b9fa58255852e5-git4.tar.gz
+sha256  a6ffaeec227c35d8afe79b9d7b7a2dd9d3367c33dc1c3d5d5729cebd4973ef48  dtv-scan-tables-7098bdd27548eaf3e5d9485fc68575f88e362daf-git4.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 45264a41c5..d9e6910abd 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTV_SCAN_TABLES_VERSION = 57ed2982275045ea5e92ef2a40b9fa58255852e5
+DTV_SCAN_TABLES_VERSION = 7098bdd27548eaf3e5d9485fc68575f88e362daf
 DTV_SCAN_TABLES_SITE = https://git.linuxtv.org/dtv-scan-tables.git
 DTV_SCAN_TABLES_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
