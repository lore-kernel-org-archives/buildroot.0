Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76456C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0195E60D4B;
	Sun, 23 Jan 2022 19:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jr1aB1oLZ2bb; Sun, 23 Jan 2022 19:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3719C60C2A;
	Sun, 23 Jan 2022 19:11:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EB031BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 390B540106
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0O74aplawuId for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:10:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C512405CC
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:10:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 866D982B2E; Sun, 23 Jan 2022 19:04:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 20:08:51 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d7836d25c38fc0566dde7547bc1efd70b012413a
X-Git-Newrev: ea7ed63f1d151c584888529bf9a3a2f5bacf929a
X-Patchwork-Hint: ignore
Message-Id: <20220123190401.866D982B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mbedtls: security
 bump to version 2.16.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea7ed63f1d151c584888529bf9a3a2f5bacf929a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2021-12
https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit da5c80f6750899578882688e68c128d8a21032c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index b93da164f9..8247748afd 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.11:
-sha256  c18e7e9abf95e69e425260493720470021384a1728417042060a35d0b7b18b41  mbedtls-2.16.11.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.12:
+sha256  294871ab1864a65d0b74325e9219d5bcd6e91c34a3c59270c357bb9ae4d5c393  mbedtls-2.16.12.tar.gz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 9207daf186..93ac1bb163 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.16.11
+MBEDTLS_VERSION = 2.16.12
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
