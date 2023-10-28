Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF99C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D10EC42D9E;
	Sat, 28 Oct 2023 21:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D10EC42D9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7OhF6YWqwUXV; Sat, 28 Oct 2023 21:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1401D42860;
	Sat, 28 Oct 2023 21:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1401D42860
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0E4E1BF869
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA133613C1
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA133613C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p46tru9YwySH for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7AB0613AE
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7AB0613AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A694F85F52; Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:49:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 145f01ded5e340ec269d82d5d88cf61fc0b314a3
X-Git-Newrev: cf746901dd59e4de56114ea9e9250e155d11231b
X-Patchwork-Hint: ignore
Message-Id: <20231028210321.A694F85F52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/powerpc-utils: bump to version
 1.3.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf746901dd59e4de56114ea9e9250e155d11231b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/ibm-power-utilities/powerpc-utils/blob/v1.3.11/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/powerpc-utils/powerpc-utils.hash | 2 +-
 package/powerpc-utils/powerpc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index b3c77fb223..32387014cc 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d64d9016a3e63a1e44c6e0833742cf964ae6bb1c6a9c7f0c7c5748aa335dc3db  powerpc-utils-1.3.10.tar.gz
+sha256  6bb16078068d8b889afdd78927d2f061702ef155e57fc548ae573e2b0b90ca13  powerpc-utils-1.3.11.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index 19fa84946c..8d5491133b 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = 1.3.10
+POWERPC_UTILS_VERSION = 1.3.11
 POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,v$(POWERPC_UTILS_VERSION))
 POWERPC_UTILS_DEPENDENCIES = zlib numactl
 POWERPC_UTILS_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
