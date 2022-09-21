Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093B8ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 19:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 916C0416DB;
	Wed, 21 Sep 2022 19:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 916C0416DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4I_ndaSfTBOZ; Wed, 21 Sep 2022 19:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F3AE4170E;
	Wed, 21 Sep 2022 19:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F3AE4170E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8700F1C1190
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F525416BC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F525416BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BtSZ4YQ1BctD for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C241416BA
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C241416BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4ADE985D02; Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 21:24:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bfc2afd6f00299781240db877aac8ff6e47148d
X-Git-Newrev: 25b396bfbfc349912a77c09da2f4fb2c119d51d7
X-Patchwork-Hint: ignore
Message-Id: <20220921193119.4ADE985D02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-protocols: bump to version
 1.26
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

commit: https://git.buildroot.net/buildroot/commit/?id=25b396bfbfc349912a77c09da2f4fb2c119d51d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wayland-protocols/wayland-protocols.hash | 8 ++++----
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 1262f0f9d7..2d98c47c6f 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-January/042102.html
-md5  0c192bf32de09ec30de4a82d1c65329c  wayland-protocols-1.25.tar.xz
-sha1  275298332d124e40e345aa82bc8f48ef8cad3480  wayland-protocols-1.25.tar.xz
-sha256  f1ff0f7199d0a0da337217dd8c99979967808dc37731a1e759e822b75b571460  wayland-protocols-1.25.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-July/042270.html
+md5  0c6b3e037f3881650d9a53610dd235c7  wayland-protocols-1.26.tar.xz
+sha1  8aeb1a629d847ec26e26d5a59c150add41e482bd  wayland-protocols-1.26.tar.xz
+sha256  c553384c1c68afd762fa537a2569cc9074fe7600da12d3472761e77a2ba56f13  wayland-protocols-1.26.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 746d82e308..8e6d72480f 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.25
+WAYLAND_PROTOCOLS_VERSION = 1.26
 WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
