Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B64C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 20:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7506541798;
	Tue, 13 Dec 2022 20:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7506541798
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fvd5eZhpEcXv; Tue, 13 Dec 2022 20:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9099341781;
	Tue, 13 Dec 2022 20:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9099341781
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DE521BF909
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B527B417D2
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B527B417D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1Wmisa-D6h6 for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 20:22:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3649417CD
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 20:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3649417CD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8988A8663B; Tue, 13 Dec 2022 20:22:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 21:15:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e250593ceabbdbc19365e56c679948f80ed6b9c
X-Git-Newrev: acf4a7d1c72c468e269058ba52df40c9734c8801
X-Patchwork-Hint: ignore
Message-Id: <20221213202218.8988A8663B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglfw: bump version to 3.3.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=acf4a7d1c72c468e269058ba52df40c9734c8801
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.glfw.org/changelog.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglfw/libglfw.hash | 2 +-
 package/libglfw/libglfw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglfw/libglfw.hash b/package/libglfw/libglfw.hash
index 5bffc55d26..9d38946f3c 100644
--- a/package/libglfw/libglfw.hash
+++ b/package/libglfw/libglfw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ed07b90e334dcd39903e6288d90fa1ae0cf2d2119fec516cf743a0a404527c02  libglfw-3.3.6.tar.gz
+sha256  f30f42e05f11e5fc62483e513b0488d5bceeab7d9c5da0ffe2252ad81816c713  libglfw-3.3.8.tar.gz
 sha256  149704059b5d0bf551637e50042dd4de9c2cae921021f6636298911e3a5f9462  LICENSE.md
diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index 0a3986f662..eee8e7b298 100644
--- a/package/libglfw/libglfw.mk
+++ b/package/libglfw/libglfw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLFW_VERSION = 3.3.6
+LIBGLFW_VERSION = 3.3.8
 LIBGLFW_SITE = $(call github,glfw,glfw,$(LIBGLFW_VERSION))
 LIBGLFW_INSTALL_STAGING = YES
 LIBGLFW_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
