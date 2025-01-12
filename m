Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD476C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F83984E5F;
	Fri, 28 Feb 2025 16:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MiMSleCZ2Q3O; Fri, 28 Feb 2025 16:56:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C37884E62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C37884E62;
	Fri, 28 Feb 2025 16:56:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 132D468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9D2E46804
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I765nKMmEXz1 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD80B42DA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD80B42DA8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C73D187C52; Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jan 2025 12:22:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 157f7688fe040f0e54e4c8d37ace3d42f16d8847
X-Git-Newrev: 0ab41ed0f1f289a96a5900b9e075599aa73b0e96
X-Patchwork-Hint: ignore
Message-Id: <20250228163007.C73D187C52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/python-trove-classifiers: bump to version 2025.1.10.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ab41ed0f1f289a96a5900b9e075599aa73b0e96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-trove-classifiers/python-trove-classifiers.hash | 4 ++--
 package/python-trove-classifiers/python-trove-classifiers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index 02ea021527..bb58e4930b 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  c2820cfbb09e91d84ade85e0e65d87ae  trove_classifiers-2024.10.21.16.tar.gz
-sha256  17cbd055d67d5e9d9de63293a8732943fabc21574e4c7b74edf112b4928cf5f3  trove_classifiers-2024.10.21.16.tar.gz
+md5  b8c01a04127e7929f588fabbd0352ecb  trove_classifiers-2025.1.10.15.tar.gz
+sha256  be2c7d25e46cd39d5c7151acd389584df3919f61890f5f163c8ee2090ff71e7f  trove_classifiers-2025.1.10.15.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index ab2421cbe5..98ebcc4d1b 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2024.10.21.16
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.1.10.15
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/99/85/92c2667cf221b37648041ce9319427f92fa76cbec634aad844e67e284706
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/db/1b/7bb619b31396d550022965673a0c284c914a0a4c68480f78097401e1b3e5
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
