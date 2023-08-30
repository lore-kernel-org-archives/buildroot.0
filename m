Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094AAC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B352041838;
	Wed, 30 Aug 2023 21:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B352041838
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0H8qQQSYhM3K; Wed, 30 Aug 2023 21:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7F1841831;
	Wed, 30 Aug 2023 21:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7F1841831
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E7841BF405
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CD7F41C55
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CD7F41C55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZjULBSkRVBK1 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:54:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69B6341C24
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69B6341C24
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 510998669C; Wed, 30 Aug 2023 21:54:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 23:48:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 06b2e496a0c47b1fef55b0daccac1e62b41d7aac
X-Git-Newrev: 16da1e0b047688831e6653b01194807af0a9df41
X-Patchwork-Hint: ignore
Message-Id: <20230830215441.510998669C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libdrm: bump version
 to 2.4.116
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

commit: https://git.buildroot.net/buildroot/commit/?id=16da1e0b047688831e6653b01194807af0a9df41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.x.org/archives/xorg-announce/2023-August/003416.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 87cc170617..32b39d6a1b 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003323.html
-sha256  554cfbfe0542bddb391b4e3e05bfbbfc3e282b955bd56218d21c0616481f65eb  libdrm-2.4.115.tar.xz
-sha512  0c38d3cfd76f627b899f052527c2939d5fc87a417422dceb0761839ba21e69736703a87ba170b5ba7a4aca2506a240760c8c97ca1781a7fb78468225295293bd  libdrm-2.4.115.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-August/003416.html
+sha256  46c53f40735ea3d26d614297f155f6131a510624a24274f654f6469ca905339a  libdrm-2.4.116.tar.xz
+sha512  1287d1896deeb8cfb4532c6750eb43493dcefbfaaa598a73bbb682aa749594eaad3ed1fa2fe73d06280350f365a92a0c20cad8be76f3da2ed59b04aa008de911  libdrm-2.4.116.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 52ac13b7d0..70f449037d 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.115
+LIBDRM_VERSION = 2.4.116
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
