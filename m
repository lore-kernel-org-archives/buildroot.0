Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063A8C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D5F6431E6;
	Wed,  1 Nov 2023 16:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D5F6431E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NyogxnKnaxcv; Wed,  1 Nov 2023 16:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67E71431C7;
	Wed,  1 Nov 2023 16:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67E71431C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37F831BF966
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10F6E80DC7
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F6E80DC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w-B1DRqQWyfi for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:24:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DF0980893
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DF0980893
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B06486369; Wed,  1 Nov 2023 16:24:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 17:01:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b8b5442cb94b0386021e85432ad22f1955f3b57
X-Git-Newrev: 96b8eac679138e7eab022770d71a42368f2d6f58
X-Patchwork-Hint: ignore
Message-Id: <20231101162447.5B06486369@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yaml-cpp: bump to version 0.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=96b8eac679138e7eab022770d71a42368f2d6f58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/jbeder/yaml-cpp/releases/tag/0.8.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/yaml-cpp/yaml-cpp.hash | 2 +-
 package/yaml-cpp/yaml-cpp.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
index 9ad9041439..92bf65d2f7 100644
--- a/package/yaml-cpp/yaml-cpp.hash
+++ b/package/yaml-cpp/yaml-cpp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  43e6a9fcb146ad871515f0d0873947e5d497a1c9c60c58cb102a97b47208b7c3  yaml-cpp-0.7.0.tar.gz
+sha256  fbe74bbdcee21d656715688706da3c8becfd946d92cd44705cc6098bb23b3a16  yaml-cpp-0.8.0.tar.gz
 sha256  aa6fcc27be034e41e21dd832f9175bfe694a48491d9e14ff0fa278e19ad14f1b  LICENSE
diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index 367df27ff1..1f87956589 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-YAML_CPP_VERSION = 0.7.0
-YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,yaml-cpp-$(YAML_CPP_VERSION))
+YAML_CPP_VERSION = 0.8.0
+YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,$(YAML_CPP_VERSION))
 YAML_CPP_INSTALL_STAGING = YES
 YAML_CPP_LICENSE = MIT
 YAML_CPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
