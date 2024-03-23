Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4331ACD11BF
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 13:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09C4B418AB;
	Sat, 23 Mar 2024 13:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWtXDl3uO5o8; Sat, 23 Mar 2024 13:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 234434193F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 234434193F;
	Sat, 23 Mar 2024 13:50:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D23F91BF584
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A82A38235B
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0PMP2vUG8ce for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 13:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBCDB828DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBCDB828DD
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7106825E3; Sat, 23 Mar 2024 13:49:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 14:36:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39b5a8afb02e85fc31e4378b3284029a15b42180
X-Git-Newrev: c2ca1249e1d227c55c4044c4ef6aca2bc09c99ba
X-Patchwork-Hint: ignore
Message-Id: <20240323134947.E7106825E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencl-clhpp: bump to version
 2023.12.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2ca1249e1d227c55c4044c4ef6aca2bc09c99ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change log:
https://github.com/KhronosGroup/OpenCL-CLHPP/releases/tag/v2023.12.14

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencl-clhpp/opencl-clhpp.hash | 2 +-
 package/opencl-clhpp/opencl-clhpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencl-clhpp/opencl-clhpp.hash b/package/opencl-clhpp/opencl-clhpp.hash
index 27b27cd80c..3f038d6340 100644
--- a/package/opencl-clhpp/opencl-clhpp.hash
+++ b/package/opencl-clhpp/opencl-clhpp.hash
@@ -1,3 +1,3 @@
 # Locally Computed
-sha256  869456032e60787eed9fceaeaf6c6cb4452bc0ff97e0f5a271510145a1c8f4d4  opencl-clhpp-2.0.16.tar.gz
+sha256  9106700634e79cfa0935ebd67197f64689ced24c42da702acf18fa8435bd8a82  opencl-clhpp-2023.12.14.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/opencl-clhpp/opencl-clhpp.mk b/package/opencl-clhpp/opencl-clhpp.mk
index 933b40e3fe..93c25d0d66 100644
--- a/package/opencl-clhpp/opencl-clhpp.mk
+++ b/package/opencl-clhpp/opencl-clhpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCL_CLHPP_VERSION = 2.0.16
+OPENCL_CLHPP_VERSION = 2023.12.14
 OPENCL_CLHPP_SITE = $(call github,KhronosGroup,OpenCL-CLHPP,v$(OPENCL_CLHPP_VERSION))
 OPENCL_CLHPP_LICENSE = Apache-2.0
 OPENCL_CLHPP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
