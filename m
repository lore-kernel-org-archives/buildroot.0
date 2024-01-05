Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07F8C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76D2C436E9;
	Fri,  5 Jan 2024 12:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76D2C436E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GR_DXI2H9fwS; Fri,  5 Jan 2024 12:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C616436F1;
	Fri,  5 Jan 2024 12:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C616436F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 099061BF997
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D609A421A1
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D609A421A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBgZFiPO8tSO for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E488342078
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E488342078
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF90C844C8; Fri,  5 Jan 2024 12:52:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 13:48:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e272456d6d5a6196eab7a6a4a858b956ecefd0e
X-Git-Newrev: 639d8d4979d075cda3de9e663f5aecd9ead56c42
X-Patchwork-Hint: ignore
Message-Id: <20240105125237.CF90C844C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.119
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

commit: https://git.buildroot.net/buildroot/commit/?id=639d8d4979d075cda3de9e663f5aecd9ead56c42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-December/003438.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index bcbcdccf30..219c2c0712 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-November/003433.html
-sha256  a777bd85f2b5fc9c57f886c82058300578317cafdbc77d0a769d7e9a9567ab88  libdrm-2.4.118.tar.xz
-sha512  2740ec10dfe96b520345c3f6f0d99a30aac95b1f96656bd9cd11269c2a83a9dac423da29d74a3deb55360e3ae2ca4a1de283e1e443667bedd22673f6629c9920  libdrm-2.4.118.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-December/003438.html
+sha256  0a49f12f09b5b6e68eaaaff3f02ca7cff9aa926939b212d343161d3e8ac56291  libdrm-2.4.119.tar.xz
+sha512  c8dd7665e85c01a67fcce1c1c614bc05a3ec311f31cae7de5fb1cd27d0f11f1801be63de3fa3e33b2f505544fd4b1bc292965c5e8de46a3beaaedb10334945ca  libdrm-2.4.119.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 0db0c51284..fd50f4f22e 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.118
+LIBDRM_VERSION = 2.4.119
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
