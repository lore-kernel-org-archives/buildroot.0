Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3CEC7619A
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 11:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AA8140592;
	Sat, 15 Apr 2023 11:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA8140592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xNQn2ZXD6RXL; Sat, 15 Apr 2023 11:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98ACE40A2E;
	Sat, 15 Apr 2023 11:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98ACE40A2E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3008C1C4000
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 11:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 179178458E
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 11:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 179178458E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YReJzft1En54 for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 11:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 425358458A
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 11:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 425358458A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30DBB84092; Sat, 15 Apr 2023 11:52:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Apr 2023 13:50:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b4eaa635f32ae6b2f1e1090372844c8c9001bde
X-Git-Newrev: b0236f934663a5f46d84ddba101a52cf2e04f429
X-Patchwork-Hint: ignore
Message-Id: <20230415115232.30DBB84092@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx: bump version to 1.24.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0236f934663a5f46d84ddba101a52cf2e04f429
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://nginx.org/en/CHANGES-1.24

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 06454c5e32..24bc588d85 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  9ebb333a9e82b952acd3e2b4aeb1d4ff6406f72491bab6cd9fe69f0dea737f31  nginx-1.22.1.tar.gz
+sha256  77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d  nginx-1.24.0.tar.gz
 # License files, locally calculated
 sha256  ececed0b0e7243a4766cbc62b26df4bd3513b41de3a07425da1679c836d06320  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 185bcd576f..7bd2173b48 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.22.1
+NGINX_VERSION = 1.24.0
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
