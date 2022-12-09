Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865B8C04FDE
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 376A281341;
	Fri,  9 Dec 2022 17:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 376A281341
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lHz5iDqyoCPq; Fri,  9 Dec 2022 17:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C2880FB3;
	Fri,  9 Dec 2022 17:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86C2880FB3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 434941BF976
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCE2E40FF8
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCE2E40FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1WsknvAWaUK3 for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CBBB41024
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CBBB41024
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DAEC85C7A; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:34:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 228780fbde4c2b645ea52a870df5ec020912ddf8
X-Git-Newrev: 1261e78ee2a7994f0cf764c0a61d457984daf673
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.1DAEC85C7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_x11perf: bump version
 to 1.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=1261e78ee2a7994f0cf764c0a61d457984daf673
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-October/003242.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_x11perf/xapp_x11perf.hash | 8 +++-----
 package/x11r7/xapp_x11perf/xapp_x11perf.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.hash b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
index 673d3602ba..3370d7df53 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.hash
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002983.html
-md5  e96b56756990c56c24d2d02c2964456b  x11perf-1.6.1.tar.bz2
-sha1  c54ebef80b6cb565397fe2e3069e0d7470027e5a  x11perf-1.6.1.tar.bz2
-sha256  1c7e0b8ffc2794b4ccf11e04d551823abe0ea47b4f7db0637390db6fbe817c34  x11perf-1.6.1.tar.bz2
-sha512  b386151bfe3d7c04ab9953ae1882f3c5b627d6d1afb9a8cfe87c58236a88883fc11bbadb2226b9aa61df84b4fce625a1c9e3d146a124ac17e8d7d605b35d9c0b  x11perf-1.6.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003242.html
+sha256  5a0e7cea47716ad07ceca38bbd07ae06459ee4d837b9c9dfc21ccb94e3e24fcc  x11perf-1.6.2.tar.xz
+sha512  5be9e601071a42d103adbab5f30c1900a3779a5b2c06c709df99a85487c9790d36b835d43f5c6d74cc7d950cc3ad06927210d7b1f58939cfd0b4a6f3e5e32112  x11perf-1.6.2.tar.xz
 # Locally computed
 sha256  f467ff659142e2eb4cb7275c48c789d249af398b09a405d3e181dcc339b3b922  COPYING
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index ec10590b73..3a1d579939 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_X11PERF_VERSION = 1.6.1
-XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.bz2
-XAPP_X11PERF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_X11PERF_VERSION = 1.6.2
+XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.xz
+XAPP_X11PERF_SITE = https://xorg.freedesktop.org/archive/individual/test
 XAPP_X11PERF_LICENSE = MIT
 XAPP_X11PERF_LICENSE_FILES = COPYING
 XAPP_X11PERF_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXft
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
