Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AA0C36000
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 22:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA83983F8D;
	Thu, 20 Mar 2025 22:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVEf0k3XqmDE; Thu, 20 Mar 2025 22:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E979D83FBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E979D83FBB;
	Thu, 20 Mar 2025 22:16:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11C2212F
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D16EF4055E
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dM166ela-4G for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 22:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD1554054B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD1554054B
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:16:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C732588237; Thu, 20 Mar 2025 22:16:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 Mar 2025 23:02:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03cda9370fd356910af205a9c38dc53dcb99a7b1
X-Git-Newrev: c5659cebb7b54e2522601824a10c47c0ef73a09f
X-Patchwork-Hint: ignore
Message-Id: <20250320221637.C732588237@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flit-core: bump to version
 3.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5659cebb7b54e2522601824a10c47c0ef73a09f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-flit-core/python-flit-core.hash | 4 ++--
 package/python-flit-core/python-flit-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
index f8e71bf398..80f8d915fe 100644
--- a/package/python-flit-core/python-flit-core.hash
+++ b/package/python-flit-core/python-flit-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flit_core/json
-md5  a3381dd58e23e9826c5199b1f70318b0  flit_core-3.10.1.tar.gz
-sha256  66e5b87874a0d6e39691f0e22f09306736b633548670ad3c09ec9db03c5662f7  flit_core-3.10.1.tar.gz
+md5  6d677b1acef1769c4c7156c7508e0dbd  flit_core-3.11.0.tar.gz
+sha256  6ceeee3219e9d2ea282041f3e027c441597b450b33007cb81168e887b6113a8f  flit_core-3.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  35b4f1dec512e617077fd6980dbb43ef8c2887adc5d0185edb4c04da175dd816  LICENSE
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index bfa80af3e3..e46453443c 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLIT_CORE_VERSION = 3.10.1
+PYTHON_FLIT_CORE_VERSION = 3.11.0
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
-PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/d5/ae/09427bea9227a33ec834ed5461432752fd5d02b14f93dd68406c91684622
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/bc/18/b9b81cab2b8f63e6e7f72e1ba2766a0454fcd563e7a77b8299cb917ba805
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
 PYTHON_FLIT_CORE_LICENSE_FILES = LICENSE
 PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
