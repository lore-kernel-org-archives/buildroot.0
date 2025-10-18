Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08409CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 18:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B177F60D9B;
	Sat, 18 Oct 2025 18:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3Tzks2QWVP5; Sat, 18 Oct 2025 18:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C670560D9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C670560D9C;
	Sat, 18 Oct 2025 18:21:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 600C343F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46FB9409F3
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ujn69p6XhPfC for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 18:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CF7540904
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CF7540904
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:21:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B989874B9; Sat, 18 Oct 2025 18:21:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 18:41:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23db2ff030e165fb82c760c68e9a4055fa8438a6
X-Git-Newrev: c4bda5e952c4bb0ef56c59518cb82673a2e9acac
X-Patchwork-Hint: ignore
Message-Id: <20251018182103.3B989874B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/slirp: bump to version 4.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4bda5e952c4bb0ef56c59518cb82673a2e9acac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://gitlab.freedesktop.org/slirp/libslirp/-/releases/v4.9.0
https://gitlab.freedesktop.org/slirp/libslirp/-/releases/v4.9.1

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/slirp/slirp.hash | 2 +-
 package/slirp/slirp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slirp/slirp.hash b/package/slirp/slirp.hash
index 930e6aca58..bd07074bb4 100644
--- a/package/slirp/slirp.hash
+++ b/package/slirp/slirp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1c2e3d30e41a055ed41f9d0b3234d0d143bc28f5ad84bb101413f830844df757  libslirp-v4.8.0.tar.bz2
+sha256  3caff6e2de445f4995629d4929c55419f661b2b1d14f12481e155a71c1e8f811  libslirp-v4.9.1.tar.bz2
 sha256  b28aecf4796a6a22054167f0a976de13d9db335669d37afd2dc7ea4c335e1e13  COPYRIGHT
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 6d44df8d7e..950ad53ea8 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SLIRP_VERSION = 4.8.0
+SLIRP_VERSION = 4.9.1
 SLIRP_SOURCE = libslirp-v$(SLIRP_VERSION).tar.bz2
 SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$(SLIRP_VERSION)
 SLIRP_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
