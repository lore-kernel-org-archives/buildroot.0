Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB19FC25B45
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 17:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A50E24226E;
	Mon, 23 Oct 2023 17:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A50E24226E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XuXGzinGiKg6; Mon, 23 Oct 2023 17:28:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D296D423DD;
	Mon, 23 Oct 2023 17:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D296D423DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 636B21BF955
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26210612B8
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26210612B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M1YF94Iu_H9P for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 012C4612B3
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 012C4612B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3ECF85E88; Mon, 23 Oct 2023 17:27:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 18:52:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7267eab9ae5743513fbb4c5222a593d9a50d81e
X-Git-Newrev: 4c761f459a693a312107eed81c29f10debe1c40b
X-Patchwork-Hint: ignore
Message-Id: <20231023172716.D3ECF85E88@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opkg: bump version to 0.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c761f459a693a312107eed81c29f10debe1c40b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested in Fedora 39 and Debian 11 with:
./support/testing/run-tests tests.package.test_opkg.TestOpkg.test_run

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/opkg/opkg.hash | 2 +-
 package/opkg/opkg.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
index b0c0ba6574..c6ecefba21 100644
--- a/package/opkg/opkg.hash
+++ b/package/opkg/opkg.hash
@@ -1,4 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/opkg/SHA256SUMS
-sha256  a1214a75fa34fb9228db8da47308e0e711b1c93fd8938cf164c10fd28eb50f1e  opkg-0.4.5.tar.gz
+sha256  ac73a90a2549cd04948e563d915912c78e1b8ba0f43af75c5a53fcca474adbd5  opkg-0.6.2.tar.gz
 # Locally calculated
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 501edcf8af..9b1ffb3c74 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-OPKG_VERSION = 0.4.5
+OPKG_VERSION = 0.6.2
 OPKG_SITE = https://downloads.yoctoproject.org/releases/opkg
 OPKG_DEPENDENCIES = host-pkgconf libarchive
 OPKG_LICENSE = GPL-2.0+
 OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
-OPKG_CONF_OPTS = --disable-curl
+OPKG_CONF_OPTS = --disable-curl --disable-zstd
 
 # Ensure directory for lockfile exists
 define OPKG_CREATE_LOCKDIR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
