Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647D3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 290238133A;
	Thu, 12 May 2022 19:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GguN0HFHGDkZ; Thu, 12 May 2022 19:57:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51D0481312;
	Thu, 12 May 2022 19:57:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 116AC1BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B0D940242
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6L-gt-6piBnv for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35F8440339
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7AE5485C90; Thu, 12 May 2022 19:41:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:50:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b3c8b620e22929dd194f0b1baa60bb87919fadc
X-Git-Newrev: 79b3c44bfa4a2b03dbe82eaed59cd4afa0733252
X-Patchwork-Hint: ignore
Message-Id: <20220512194101.7AE5485C90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xcb-proto: bump version to
 1.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=79b3c44bfa4a2b03dbe82eaed59cd4afa0733252
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-May/003163.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xcb-proto/xcb-proto.hash | 6 +++---
 package/x11r7/xcb-proto/xcb-proto.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.hash b/package/x11r7/xcb-proto/xcb-proto.hash
index e6bc2379bf..7007ff14de 100644
--- a/package/x11r7/xcb-proto/xcb-proto.hash
+++ b/package/x11r7/xcb-proto/xcb-proto.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-October/003061.html
-sha256  f04add9a972ac334ea11d9d7eb4fc7f8883835da3e4859c9afa971efdf57fcc3  xcb-proto-1.14.1.tar.xz
-sha512  140fbf48483bacc7f6b70fdcf76f9e4ff0e87df9cb3a071cea47d8fe4574407cdefcfbd674099014d297e5fc010748e71d8609fca4cc32e8b25c634f928b727d  xcb-proto-1.14.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-May/003163.html
+sha256  d34c3b264e8365d16fa9db49179cfa3e9952baaf9275badda0f413966b65955f  xcb-proto-1.15.tar.xz
+sha512  a333ac7c39f17ff2567419d09a9a77210c943a4e88d79eb152d416ae26bf6fb14e2446f9817abc806edd7aa3733bd4de5852b5ae90a25cbcc9d40e59c211aa36  xcb-proto-1.15.tar.xz
 # Locally computed
 sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 64190c817f..1e25d43593 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_PROTO_VERSION = 1.14.1
+XCB_PROTO_VERSION = 1.15
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.xz
 XCB_PROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XCB_PROTO_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
