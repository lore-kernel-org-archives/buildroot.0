Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70481CF58E0
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 20:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45FDA8121A;
	Wed, 19 Nov 2025 20:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79oR8cKBFIYy; Wed, 19 Nov 2025 20:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A31E813F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A31E813F9;
	Wed, 19 Nov 2025 20:38:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2CA72A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0276813F9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAHrdAOKFchm for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 20:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 213038121A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 213038121A
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F902855CF; Wed, 19 Nov 2025 20:38:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Nov 2025 21:37:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55d1f2825b2dfe73c954b998d980feed846f89c9
X-Git-Newrev: cc5a1d3daa8f270520dae454d2704f2b21b5c94a
X-Patchwork-Hint: ignore
Message-Id: <20251119203850.0F902855CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shapelib: bump to 1.6.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cc5a1d3daa8f270520dae454d2704f2b21b5c94a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
http://shapelib.maptools.org/release.html

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/shapelib/shapelib.hash | 2 +-
 package/shapelib/shapelib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash
index dfa7ef3a34..3759917148 100644
--- a/package/shapelib/shapelib.hash
+++ b/package/shapelib/shapelib.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  5da90a60e25440f108f4e8e95732bfa83ede13c8e0c2bcf80ae41006cc8ebc20  shapelib-1.6.1.tar.gz
+sha256  4b74a36ced94e9a7bea401157e664addcc5be251e7df7f88d4674361da012c21  shapelib-1.6.2.tar.gz
 sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  LICENSE-LGPL
 sha256  3f46082162242563bf4f43b091871cb19064bc5a398c6d2b024f6b64c6710516  LICENSE-MIT
 sha256  15e1205bb007d4d7821f7b1cc461ba8d051647e86dbc9baf1bb6f68b10588eeb  web/license.html
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index f7c3056844..08bf3c9f94 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAPELIB_VERSION = 1.6.1
+SHAPELIB_VERSION = 1.6.2
 SHAPELIB_SITE = http://download.osgeo.org/shapelib
 SHAPELIB_LICENSE = MIT or LGPL-2.0
 SHAPELIB_LICENSE_FILES = LICENSE-LGPL LICENSE-MIT web/license.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
