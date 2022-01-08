Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1063C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D56607F9;
	Sat,  8 Jan 2022 17:30:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wL_LFeecM-24; Sat,  8 Jan 2022 17:30:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC79E607A3;
	Sat,  8 Jan 2022 17:30:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DC1B1BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B91A60784
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UmxZPWlMzyK3 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:30:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61A5260692
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:30:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A830682AA2; Sat,  8 Jan 2022 17:24:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 18:29:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59bbe7cc7418d61a5d2963f1d30e558c3111a95e
X-Git-Newrev: 0f8aab08e762742d753d5920718f31c629d0f8d7
X-Patchwork-Hint: ignore
Message-Id: <20220108172418.A830682AA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbedtls: bump to version 2.28.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f8aab08e762742d753d5920718f31c629d0f8d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

2.16.12 was the last release of the 2.16 long-time support branch.
Users who want a long-time branch should move to mbedtls-2.28, which
is backward-compatible and will be supported for at least 3 years.

Use LICENSE file as apache-2.0.txt was dropped with
https://github.com/ARMmbed/mbedtls/commit/c76a54554ca8bffedf0e78a1cbdb64451e4ae957

https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 6 +++---
 package/mbedtls/mbedtls.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 8247748afd..80ae173aff 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.12:
-sha256  294871ab1864a65d0b74325e9219d5bcd6e91c34a3c59270c357bb9ae4d5c393  mbedtls-2.16.12.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.0:
+sha256  6519579b836ed78cc549375c7c18b111df5717e86ca0eeff4cb64b2674f424cc  mbedtls-2.28.0.tar.gz
 # Locally calculated
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache-2.0.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 93ac1bb163..c238d664f8 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.16.12
+MBEDTLS_VERSION = 2.28.0
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
 	-DENABLE_TESTING=OFF
 MBEDTLS_INSTALL_STAGING = YES
 MBEDTLS_LICENSE = Apache-2.0
-MBEDTLS_LICENSE_FILES = apache-2.0.txt
+MBEDTLS_LICENSE_FILES = LICENSE
 MBEDTLS_CPE_ID_VENDOR = arm
 MBEDTLS_CPE_ID_PRODUCT = mbed_tls
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
