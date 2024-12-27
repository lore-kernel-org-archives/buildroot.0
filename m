Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E050E77191
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E08D380413;
	Fri, 27 Dec 2024 14:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAfIYbvvL9Z0; Fri, 27 Dec 2024 14:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6CD180472
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6CD180472;
	Fri, 27 Dec 2024 14:32:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34B09F1C
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29825401C9
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utuPvCCsJlpv for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD08240332
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD08240332
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D927D87524; Fri, 27 Dec 2024 14:31:25 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 14:24:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72fb4e89a913d17754143132c24dd0859466fb97
X-Git-Newrev: 802a611fb6333755aec63df3d48210a2e16bb70a
X-Patchwork-Hint: ignore
Message-Id: <20241227143125.D927D87524@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-googleapis-common-protos:
 bump to version 1.66.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=802a611fb6333755aec63df3d48210a2e16bb70a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-googleapis-common-protos.hash                              | 4 ++--
 .../python-googleapis-common-protos.mk                                | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
index 408f07994d..ccea86c1a7 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
-md5  cdb94d19ca05b4f16da10bbf39da2347  googleapis_common_protos-1.65.0.tar.gz
-sha256  334a29d07cddc3aa01dee4988f9afd9b2916ee2ff49d6b757155dc0d197852c0  googleapis_common_protos-1.65.0.tar.gz
+md5  28ba393a6c206bbd55efba7b68f65622  googleapis_common_protos-1.66.0.tar.gz
+sha256  c3e7b33d15fdca5374cc0a7346dd92ffa847425cc4ea941d970f13680052ec8c  googleapis_common_protos-1.66.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
index 3f43f1516e..c1a1174e26 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.65.0
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.66.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis_common_protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/53/3b/1599ceafa875ffb951480c8c74f4b77646a6b80e80970698f2aa93c216ce
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/ff/a7/8e9cccdb1c49870de6faea2a2764fa23f627dd290633103540209f03524c
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
