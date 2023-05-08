Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A02C7EE24
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 19:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F40B40B94;
	Mon,  8 May 2023 19:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F40B40B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CkhMlL7InJte; Mon,  8 May 2023 19:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1398542A9A;
	Mon,  8 May 2023 19:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1398542A9A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 029431BF868
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF55A42A8E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF55A42A8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z96jEF7TEdLt for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 19:23:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 036C241D5F
 for <buildroot@buildroot.org>; Mon,  8 May 2023 19:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 036C241D5F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5C8786190; Mon,  8 May 2023 19:23:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 21:21:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: feb16bd9878bcde7d690a1887604ddc861f5f30d
X-Git-Newrev: 34e029eacf31be9c53c88d6ec16c13a239e2c43d
X-Patchwork-Hint: ignore
Message-Id: <20230508192310.E5C8786190@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus-cxx: bump version to 2.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=34e029eacf31be9c53c88d6ec16c13a239e2c43d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/dbus-cxx/dbus-cxx/releases/tag/2.4.0

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dbus-cxx/dbus-cxx.hash | 2 +-
 package/dbus-cxx/dbus-cxx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-cxx/dbus-cxx.hash b/package/dbus-cxx/dbus-cxx.hash
index 6a7a634ced..4ed9d73bac 100644
--- a/package/dbus-cxx/dbus-cxx.hash
+++ b/package/dbus-cxx/dbus-cxx.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  88d4bd1d9af8563bda03f24b26ffe4efbc555ca82ac664ced572b053928f739a  dbus-cxx-2.3.1.tar.gz
+sha256  c38456ed70023d93e6e689087e4bbe030f1650bbda9de7c035d6f4ebac788379  dbus-cxx-2.4.0.tar.gz
 sha256  99e5d0ad951d96567a6f9a17f3f17ac000c0582f53357c7f3601851c2dcbb786  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  cmake-modules/LICENSE_1_0.txt
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  tools/libcppgenerate/LICENSE
diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
index 554acaa67d..8e2b4f70fa 100644
--- a/package/dbus-cxx/dbus-cxx.mk
+++ b/package/dbus-cxx/dbus-cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_CXX_VERSION = 2.3.1
+DBUS_CXX_VERSION = 2.4.0
 DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
 DBUS_CXX_LICENSE = LGPL-3.0+ or BSD-3-Clause, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
 DBUS_CXX_LICENSE_FILES = COPYING cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
