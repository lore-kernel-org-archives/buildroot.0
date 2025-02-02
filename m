Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05555C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFAC4847A6;
	Fri, 28 Feb 2025 17:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GM2yiLkt_HYX; Fri, 28 Feb 2025 17:08:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B83C085974
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B83C085974;
	Fri, 28 Feb 2025 17:08:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 215C2711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 795F242509
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVyMbYMdko6e for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDEEB42EFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDEEB42EFA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8461867B4; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 2 Feb 2025 12:35:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f64c27eb440e698534472608435709ed392d9571
X-Git-Newrev: e68eeacef9d3653bd374f48b08809c2239353a0d
X-Patchwork-Hint: ignore
Message-Id: <20250228163023.E8461867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libg7221: switch to
 github
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

commit: https://git.buildroot.net/buildroot/commit/?id=e68eeacef9d3653bd374f48b08809c2239353a0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Installation/Linux/Deprecated-Installation-Instructions/25460805/
"FreeSWITCH project has been moved to GitHub"

Updated hash due to switch to github.

Fixes:
https://autobuild.buildroot.org/results/a799442766f90607bb57cb2f767949e57ae7e1ff/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libg7221/libg7221.hash | 2 +-
 package/libg7221/libg7221.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libg7221/libg7221.hash b/package/libg7221/libg7221.hash
index c7a7755b4d..b467438bae 100644
--- a/package/libg7221/libg7221.hash
+++ b/package/libg7221/libg7221.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  65942f84219f6586abc448e387f8c904777de64b3695449ac23132e4e9bde1d5  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34-git4.tar.gz
+sha256  c0162993e0af557e05b9000e082f6a755e54a6c20a88e2ab725ed5068b4c4ff6  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34.tar.gz
 sha256  26cc5f718279b45dbe34e25a2d29b2c8ca487bd9ab11b2d68c9318ff59d5c645  COPYING
diff --git a/package/libg7221/libg7221.mk b/package/libg7221/libg7221.mk
index 813af11cee..b62a3b8b84 100644
--- a/package/libg7221/libg7221.mk
+++ b/package/libg7221/libg7221.mk
@@ -6,8 +6,7 @@
 
 LIBG7221_VERSION = dbfc29d4806ecdace50379a2f4d68a992a6fec34
 # we use the FreeSwitch fork because it contains pkgconf support
-LIBG7221_SITE = https://freeswitch.org/stash/scm/sd/libg7221.git
-LIBG7221_SITE_METHOD = git
+LIBG7221_SITE = $(call github,freeswitch,libg7221,$(LIBG7221_VERSION))
 LIBG7221_LICENSE = Polycom
 LIBG7221_LICENSE_FILES = COPYING
 LIBG7221_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
