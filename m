Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AB3C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7039847A6;
	Fri, 28 Feb 2025 16:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99YPsIpaTePW; Fri, 28 Feb 2025 16:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8A9584D41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8A9584D41;
	Fri, 28 Feb 2025 16:53:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BE63711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 427BE42FD7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cX30CZiQv5CH for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6D4342D0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6D4342D0B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C29D184C4E; Fri, 28 Feb 2025 16:30:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 15:53:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dafa36a5225fde63b35ef68427a017a234238f4e
X-Git-Newrev: 830f9f5d81751c57471f4ebfbd9eb2034db6a46f
X-Patchwork-Hint: ignore
Message-Id: <20250228163001.C29D184C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-ml-dtypes: bump
 to version 0.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=830f9f5d81751c57471f4ebfbd9eb2034db6a46f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-ml-dtypes/python-ml-dtypes.hash | 4 ++--
 package/python-ml-dtypes/python-ml-dtypes.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ml-dtypes/python-ml-dtypes.hash b/package/python-ml-dtypes/python-ml-dtypes.hash
index e11ae88abf..9f81056cd0 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.hash
+++ b/package/python-ml-dtypes/python-ml-dtypes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ml_dtypes/json
-md5  0d4d585a69dc36ce685c487c99fcc59a  ml_dtypes-0.5.0.tar.gz
-sha256  3e7d3a380fe73a63c884f06136f8baa7a5249cc8e9fdec677997dd78549f8128  ml_dtypes-0.5.0.tar.gz
+md5  410474c03a1754e6b5197a24040e3f3c  ml_dtypes-0.5.1.tar.gz
+sha256  ac5b58559bb84a95848ed6984eb8013249f90b6bab62aa5acbad876e256002c9  ml_dtypes-0.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk b/package/python-ml-dtypes/python-ml-dtypes.mk
index 060fe555c5..ab50069696 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.mk
+++ b/package/python-ml-dtypes/python-ml-dtypes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ML_DTYPES_VERSION = 0.5.0
+PYTHON_ML_DTYPES_VERSION = 0.5.1
 PYTHON_ML_DTYPES_SOURCE = ml_dtypes-$(PYTHON_ML_DTYPES_VERSION).tar.gz
-PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/ab/79/717c5e22ad25d63ce3acdfe8ff8d64bdedec18914256c59b838218708b16
+PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/32/49/6e67c334872d2c114df3020e579f3718c333198f8312290e09ec0216703a
 PYTHON_ML_DTYPES_LICENSE = Apache-2.0
 PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
 PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
