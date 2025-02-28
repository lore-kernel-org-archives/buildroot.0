Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE12C282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 22:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AD0870976;
	Fri, 28 Feb 2025 22:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yo5rEXWeb6oW; Fri, 28 Feb 2025 22:10:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A66AB70775
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A66AB70775;
	Fri, 28 Feb 2025 22:06:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1488868
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2BE0829EE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTT8hTVTdnlq for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 22:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8079986965
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8079986965
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 21:47:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C83E87C35; Fri, 28 Feb 2025 21:47:13 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 22:34:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ec2735686a24bb6806a028bc2177000e389cd782
X-Git-Newrev: 35b50e9b03377e9400d750bd0489bc980c495eba
X-Patchwork-Hint: ignore
Message-Id: <20250228214713.6C83E87C35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/osm2pgsql: bump
 version to 2.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=35b50e9b03377e9400d750bd0489bc980c495eba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release-notes: https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.0.1

Change URL to osm2pgsql-dev.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index cc0d91f98f..9f119d9c7d 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  05c2355b4a59d03a0f9855b4234a3bdc717b078faee625e73357947d1a82fe89  osm2pgsql-2.0.0.tar.gz
+sha256  b9d5c95ccc928aafc3c6caccb8b5bc19c4d48a5d1640cada07388d0dbf171ecc  osm2pgsql-2.0.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index 7b54e4c0d2..f968a159d2 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 2.0.0
-OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
+OSM2PGSQL_VERSION = 2.0.1
+OSM2PGSQL_SITE = $(call github,osm2pgsql-dev,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
 OSM2PGSQL_SUPPORTS_IN_SOURCE_BUILD = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
