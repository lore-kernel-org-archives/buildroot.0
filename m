Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0999C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BB2182591;
	Mon,  4 Apr 2022 18:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iO0P9DMHLocX; Mon,  4 Apr 2022 18:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CBB982512;
	Mon,  4 Apr 2022 18:49:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 804771BF294
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63E5B81D47
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mONhpWTtgKJP for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:49:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5B1A81D11
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:49:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 16DCE818AF; Mon,  4 Apr 2022 18:39:37 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 20:41:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdc2a52a0fd619ee9762656c2ff8f84418a85ea1
X-Git-Newrev: 6a11646968011c7209cfadb17d0714949e174f21
X-Patchwork-Hint: ignore
Message-Id: <20220404183937.16DCE818AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipmiutil: bump to version 3.1.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a11646968011c7209cfadb17d0714949e174f21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop IPMIUTIL_TOUCH_CONFIG_H_IN as aclocal.m4 is not newer than
config.h.in anymore

https://sourceforge.net/p/ipmiutil/news/2021/11/ipmiutil-318-is-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ipmiutil/ipmiutil.hash | 6 +++---
 package/ipmiutil/ipmiutil.mk   | 8 +-------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.hash b/package/ipmiutil/ipmiutil.hash
index f87c2762de..c1a813ad1f 100644
--- a/package/ipmiutil/ipmiutil.hash
+++ b/package/ipmiutil/ipmiutil.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ipmiutil/files/
-md5  fab260bc834a0f3f9324a6365fc26eca  ipmiutil-3.1.7.tar.gz
-sha1  a0cd29820b15166120eb4a51e6239bfa6f9c65dd  ipmiutil-3.1.7.tar.gz
+md5  b38ef567b6bb8a24418e448f23115190  ipmiutil-3.1.8.tar.gz
+sha1  0697fc2342c55ba4374e31dcd38e58a00d1287e8  ipmiutil-3.1.8.tar.gz
 # Locally computed
-sha256  911fd6f8b33651b98863d57e678d2fc593bc43fcd2a21f5dc7d5db8f92128a9a  ipmiutil-3.1.7.tar.gz
+sha256  b14357b9723e38a19c24df2771cff63d5f15f8682cd8a5b47235044b767b1888  ipmiutil-3.1.8.tar.gz
 sha256  7e0ec8238aa1431e95a4950032a4483fe33fec3fac348eaade5856cdc5ae3e39  COPYING
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 97a644e314..ad9fbfc24c 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -4,19 +4,13 @@
 #
 ################################################################################
 
-IPMIUTIL_VERSION = 3.1.7
+IPMIUTIL_VERSION = 3.1.8
 IPMIUTIL_SITE = https://sourceforge.net/projects/ipmiutil/files
 IPMIUTIL_LICENSE = BSD-3-Clause
 IPMIUTIL_LICENSE_FILES = COPYING
 
 IPMIUTIL_MAKE = $(MAKE1)
 
-# aclocal.m4 is newer than config.h.in. Touch the latter to avoid autoreconf
-define IPMIUTIL_TOUCH_CONFIG_H_IN
-	touch $(@D)/config.h.in
-endef
-IPMIUTIL_PRE_CONFIGURE_HOOKS += IPMIUTIL_TOUCH_CONFIG_H_IN
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # tests against distro libcrypto so it might get a false positive when
 # the openssl version is old, so force it off
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
