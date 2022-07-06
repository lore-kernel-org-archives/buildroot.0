Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4947C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A6783134;
	Wed,  6 Jul 2022 21:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32A6783134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5MzYMtt78-W5; Wed,  6 Jul 2022 21:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3505982EAD;
	Wed,  6 Jul 2022 21:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3505982EAD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 90B0B1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BF6D4195C
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BF6D4195C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PznnlhmCQgLB for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:20:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72C5B4161B
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72C5B4161B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9407182ACC; Wed,  6 Jul 2022 21:07:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:20:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4ca769ad44658a9d58998d00839966a5e941d4f
X-Git-Newrev: 2d972d4f0391a896d3dc4744698431049b6120ce
X-Patchwork-Hint: ignore
Message-Id: <20220706210757.9407182ACC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xcb-proto: bump version to
 1.15.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2d972d4f0391a896d3dc4744698431049b6120ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-June/003169.html
https://lists.x.org/archives/xorg-announce/2022-June/003170.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xcb-proto/xcb-proto.hash | 6 +++---
 package/x11r7/xcb-proto/xcb-proto.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.hash b/package/x11r7/xcb-proto/xcb-proto.hash
index 7007ff14de..1a49710d7a 100644
--- a/package/x11r7/xcb-proto/xcb-proto.hash
+++ b/package/x11r7/xcb-proto/xcb-proto.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-May/003163.html
-sha256  d34c3b264e8365d16fa9db49179cfa3e9952baaf9275badda0f413966b65955f  xcb-proto-1.15.tar.xz
-sha512  a333ac7c39f17ff2567419d09a9a77210c943a4e88d79eb152d416ae26bf6fb14e2446f9817abc806edd7aa3733bd4de5852b5ae90a25cbcc9d40e59c211aa36  xcb-proto-1.15.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-June/003170.html
+sha256  7072beb1f680a2fe3f9e535b797c146d22528990c72f63ddb49d2f350a3653ed  xcb-proto-1.15.2.tar.xz
+sha512  9d0b2f0a4dbbf2d64e32ff4658d1663e13d7e5f1bffc1e8d45be7b9dd5bab46e29fc1c2f6e66a7a569e374ba6756faf3c39b0b5e5560df6d7f8b68beec97659d  xcb-proto-1.15.2.tar.xz
 # Locally computed
 sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 1e25d43593..324b29427d 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_PROTO_VERSION = 1.15
+XCB_PROTO_VERSION = 1.15.2
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.xz
 XCB_PROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XCB_PROTO_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
