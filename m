Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC08CC4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7D8360F58;
	Sat, 13 Jan 2024 21:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7D8360F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doVvPovPrvGt; Sat, 13 Jan 2024 21:18:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F21A560F44;
	Sat, 13 Jan 2024 21:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F21A560F44
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BE491BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFDB660D64
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFDB660D64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVAZNWzkzRr8 for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C59A760EE5
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C59A760EE5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B29AB8605F; Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:44:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fba83e5f975c779c26cbb9cdd80e3790088da0d
X-Git-Newrev: 38e447edb9b6a893e45f0053bd49303bde52ef57
X-Patchwork-Hint: ignore
Message-Id: <20240113211501.B29AB8605F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.120
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

commit: https://git.buildroot.net/buildroot/commit/?id=38e447edb9b6a893e45f0053bd49303bde52ef57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2024-January/003441.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 219c2c0712..dd43a89d68 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-December/003438.html
-sha256  0a49f12f09b5b6e68eaaaff3f02ca7cff9aa926939b212d343161d3e8ac56291  libdrm-2.4.119.tar.xz
-sha512  c8dd7665e85c01a67fcce1c1c614bc05a3ec311f31cae7de5fb1cd27d0f11f1801be63de3fa3e33b2f505544fd4b1bc292965c5e8de46a3beaaedb10334945ca  libdrm-2.4.119.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-January/003441.html
+sha256  3bf55363f76c7250946441ab51d3a6cc0ae518055c0ff017324ab76cdefb327a  libdrm-2.4.120.tar.xz
+sha512  6dc16e5134a669eeb59debb1dc2d15b857483ab7476dc2b94bd05a32d8953f046f5656f6cf9e1a63e97e7156fb65ebb58b6a29fe45cb6326058baaf820626e70  libdrm-2.4.120.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index fd50f4f22e..61d1c24377 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.119
+LIBDRM_VERSION = 2.4.120
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
