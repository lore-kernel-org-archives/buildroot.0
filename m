Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEA9C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 10:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BDA341499;
	Fri,  5 Jan 2024 10:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BDA341499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnkJG2-VjNAv; Fri,  5 Jan 2024 10:59:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96927414A2;
	Fri,  5 Jan 2024 10:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96927414A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB5751BF990
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 970E34364E
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 970E34364E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BxV0cpvZJAYI for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 10:56:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6463743678
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 10:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6463743678
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 533D0843FE; Fri,  5 Jan 2024 10:56:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 11:50:58 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f0c16f87df5759b761f31996102356b49a6f23a6
X-Git-Newrev: a0c23cdfdf4635eab903fa5ac2b0679e4f9d4910
X-Patchwork-Hint: ignore
Message-Id: <20240105105642.533D0843FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/x11r7/xwayland:
 bump version to 23.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0c23cdfdf4635eab903fa5ac2b0679e4f9d4910
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 233ff41fdb4867638237a6626dd320d46e57f051)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 0c476f3183..b62f404d40 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003322.html
-sha256  d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73  xwayland-22.1.8.tar.xz
-sha512  f52c6f99d8ef7605bc1c651d5ee5e306c12af30649a2d712b1c4c3cf4c7c80246ae24bd9ac39461d47aafc78f5d659446a459cd6259e05ef3128b204981d114a  xwayland-22.1.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-March/003376.html
+sha256  fb9461f5cb9fea5e07e91882311b0c88b43e8843b017ebac05eb5af69aa34c15  xwayland-23.1.1.tar.xz
+sha512  21c386847135c5cb4ac884926b0fbeb6ad21c9ee54752e0cdc8418e31a72872d81032159c1d91b8afb915aaaf65e80454342461d676996b2f3c535a37b0147f0  xwayland-23.1.1.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 7aef1156d3..1b626327ad 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 22.1.8
+XWAYLAND_VERSION = 23.1.1
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
