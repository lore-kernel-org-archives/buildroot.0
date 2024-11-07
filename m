Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3636D5AE70
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 08:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89F394094B;
	Thu,  7 Nov 2024 08:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-JBxqZqcjbF; Thu,  7 Nov 2024 08:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4738C40B26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4738C40B26;
	Thu,  7 Nov 2024 08:02:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13B76C1
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39F88820CF
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFaRWgJ8Dy7m for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D9ED820C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D9ED820C3
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A19685C5B; Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Nov 2024 08:56:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8b61bc2bbf23398dd9352490ce5e21f0763575d
X-Git-Newrev: 7ec8f8919593dd68a48d3c39472eb1bffb7b4b43
X-Patchwork-Hint: ignore
Message-Id: <20241107080153.9A19685C5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flit-core: bump to version
 3.10.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7ec8f8919593dd68a48d3c39472eb1bffb7b4b43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flit-core/python-flit-core.hash | 6 +++---
 package/python-flit-core/python-flit-core.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
index 2cc8032194..f8e71bf398 100644
--- a/package/python-flit-core/python-flit-core.hash
+++ b/package/python-flit-core/python-flit-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flit_core/json
-md5  38fd365dc980d99107dfccadc96d0c4f  flit_core-3.10.0.tar.gz
-sha256  6d904233178b3c924f665947ac7d286f2ac799fb69087e39e56ceb4084724a97  flit_core-3.10.0.tar.gz
-# Locally computed
+md5  a3381dd58e23e9826c5199b1f70318b0  flit_core-3.10.1.tar.gz
+sha256  66e5b87874a0d6e39691f0e22f09306736b633548670ad3c09ec9db03c5662f7  flit_core-3.10.1.tar.gz
+# Locally computed sha256 checksums
 sha256  35b4f1dec512e617077fd6980dbb43ef8c2887adc5d0185edb4c04da175dd816  LICENSE
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index 855bb99a93..bfa80af3e3 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLIT_CORE_VERSION = 3.10.0
+PYTHON_FLIT_CORE_VERSION = 3.10.1
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
-PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/52/92/89cceb9c49f3e6c72091304636c5ebc2fc48c546742bbf8a6a474e48e666
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/d5/ae/09427bea9227a33ec834ed5461432752fd5d02b14f93dd68406c91684622
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
 PYTHON_FLIT_CORE_LICENSE_FILES = LICENSE
 PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
