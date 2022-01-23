Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B50FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2778580C30;
	Sun, 23 Jan 2022 19:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_g-g9poECxx; Sun, 23 Jan 2022 19:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ADE883F6E;
	Sun, 23 Jan 2022 19:13:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A61691BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 726A283F63
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgnpCU5UyNXZ for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:10:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B40B483F6C
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:10:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3A71382968; Sun, 23 Jan 2022 19:04:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 20:08:36 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: a5737ed3478278b66125b8bcf403a3cffa6488a4
X-Git-Newrev: 9319c37a6085ccc9daf389f40f6f0382f57c05f3
X-Patchwork-Hint: ignore
Message-Id: <20220123190408.3A71382968@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/mbedtls: security
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

commit: https://git.buildroot.net/buildroot/commit/?id=9319c37a6085ccc9daf389f40f6f0382f57c05f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
