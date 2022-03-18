Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35125C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE4560AC1;
	Fri, 18 Mar 2022 22:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hxcmv3cyr5OM; Fri, 18 Mar 2022 22:45:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2959260B1D;
	Fri, 18 Mar 2022 22:45:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE7FF1BF853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D89AE60B1D
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id McRnwrCyDsX4 for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:45:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AD7360AC1
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:45:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6B55C83E7E; Fri, 18 Mar 2022 22:36:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 23:44:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6631e1f70897c4e83feeeb33396034f0daadba86
X-Git-Newrev: 91f8e51217d295d6249d8a3945406ea5546129e7
X-Patchwork-Hint: ignore
Message-Id: <20220318223653.6B55C83E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: bump to version
 3.16.0
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
Content-Type: multipart/mixed; boundary="===============8651167295579203275=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8651167295579203275==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=91f8e51217d295d6249d8a3945406ea5546129e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE Client package version to OP-TEE release 3.16.0.

Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/optee-client/optee-client.hash | 6 +++---
 package/optee-client/optee-client.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 3ae06f2afb..ff90f6d2a8 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.15.0/optee-client-3.15.0.tar.gz
-sha256 e1ea6c953e3584248d7a62050813e5ac0f0112933447954c44236a233a4cbba5  optee-client-3.15.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.16.0/optee-client-3.16.0.tar.gz
+sha256  cba92bedc9f8c39c19e50a22259066eaad5ceb248308edee27e221f11f5d8064  optee-client-3.16.0.tar.gz
 # Locally computed
-sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
+sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index dda9a2855d..2cadc564f0 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.15.0
+OPTEE_CLIENT_VERSION = 3.16.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE

--===============8651167295579203275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8651167295579203275==--
