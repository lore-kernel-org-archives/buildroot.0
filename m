Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4ADC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 20:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F7FF404CF;
	Sat, 22 Jan 2022 20:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDAIJTIfQdnM; Sat, 22 Jan 2022 20:03:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C784032E;
	Sat, 22 Jan 2022 20:03:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1E61BF574
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 20:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DC7C82B34
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 20:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HT0s-hyy6uSC for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 20:02:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF75082AA7
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 20:02:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 61939819BC; Sat, 22 Jan 2022 19:56:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 21:00:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca68aa7bc7c6a822676acb9ea1cb523341b3f51a
X-Git-Newrev: a394c17b79fbdd9d7f441e858e280c2cf225bfd0
X-Patchwork-Hint: ignore
Message-Id: <20220122195614.61939819BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdbus-cpp: bump to version 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a394c17b79fbdd9d7f441e858e280c2cf225bfd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdbus-cpp/sdbus-cpp.hash | 3 ++-
 package/sdbus-cpp/sdbus-cpp.mk   | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index 8b87653dfd..3a0e863a86 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,3 +1,4 @@
 # Locally computed:
-sha256  0fd575ae0f463773dd9141242d1133731e2b780fd6526650ce992ba711d88628  v0.8.3.tar.gz
+sha256  35e939fdd9c796522702c9c8762dd59b5c47f3440c01ba9feb9921c042780b55  v1.1.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
+sha256  be43debbf06a38325616054a39e44ed5afde4ed21b99de197488a4a306d47e39  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 24904ee26f..e0fbc5c856 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 0.8.3
+SDBUS_CPP_VERSION = 1.1.0
 SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
 SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
-SDBUS_CPP_LICENSE = LGPL-2.1+
-SDBUS_CPP_LICENSE_FILES = COPYING
+SDBUS_CPP_LICENSE = LGPL-2.1+ with exception (headers)
+SDBUS_CPP_LICENSE_FILES = COPYING COPYING-LGPL-Exception
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
