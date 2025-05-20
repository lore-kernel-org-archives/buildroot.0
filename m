Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C60C71143
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DF49820CC;
	Thu, 12 Jun 2025 08:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8rpnvfgGStQv; Thu, 12 Jun 2025 08:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D52820CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D52820CF;
	Thu, 12 Jun 2025 08:39:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DC121E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 605C941FE9
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01s6PVxBl_NI for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9705F405A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9705F405A6
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9386882DFB; Thu, 12 Jun 2025 08:38:27 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 19:12:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 510481455470dce634594e0bb3b768c02b7506dd
X-Git-Newrev: 8a26e9e0404e96ba4ffe958311e6fdb3d1b7dc79
X-Patchwork-Hint: ignore
Message-Id: <20250612083827.9386882DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lshw: bump version to B.02.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a26e9e0404e96ba4ffe958311e6fdb3d1b7dc79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/lyonel/lshw/compare/d76afbaaf40e953243da921844cddff8185324f3...B.02.20

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lshw/lshw.hash | 2 +-
 package/lshw/lshw.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lshw/lshw.hash b/package/lshw/lshw.hash
index 5626d7131e..40f150778c 100644
--- a/package/lshw/lshw.hash
+++ b/package/lshw/lshw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c62c89d4b3305d897bd644524bbc816c1793c41c9fea10381b75f9d5b074e056  lshw-d76afbaaf40e953243da921844cddff8185324f3.tar.gz
+sha256  6b8346a89fb0f0f1798e66f6a707a881d38b9b3a67256b30fc4628dac09f291a  lshw-02.20.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 86c8f356cc..70fa2aef27 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LSHW_VERSION = d76afbaaf40e953243da921844cddff8185324f3
-LSHW_SITE = $(call github,lyonel,lshw,$(LSHW_VERSION))
+LSHW_VERSION = 02.20
+LSHW_SITE = $(call github,lyonel,lshw,B.$(LSHW_VERSION))
 LSHW_LICENSE = GPL-2.0
 LSHW_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
