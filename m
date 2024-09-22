Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C3BCF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7895481461;
	Sun, 22 Sep 2024 10:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpQ1GcDbIFNV; Sun, 22 Sep 2024 10:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2583081492
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2583081492;
	Sun, 22 Sep 2024 10:34:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80EFA1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 702C3606CA
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZB9oxoEFv8hM for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94A7B6061F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94A7B6061F
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0197F83981; Sun, 22 Sep 2024 10:34:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:31:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c33cceb24de60b807a9458034dd05102b77345c
X-Git-Newrev: a91a1b484d13db77e33e421b97d1d884cb761d9f
X-Patchwork-Hint: ignore
Message-Id: <20240922103438.0197F83981@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-scm: bump to
 version 8.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a91a1b484d13db77e33e421b97d1d884cb761d9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 1a884dbbbf..f2bdf8a208 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  a05e98ab9ae447e173f0c747e0d49e81  setuptools-scm-8.0.4.tar.gz
-sha256  b5f43ff6800669595193fd09891564ee9d1d7dcb196cab4b2506d53a2e1c95c7  setuptools-scm-8.0.4.tar.gz
+md5  d8046dce093a94dc382b68b45f6a6257  setuptools_scm-8.1.0.tar.gz
+sha256  42dea1b65771cba93b7a515d65a65d8246e560768a66b9106a592c8e7f26c8a7  setuptools_scm-8.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 4cbf914690..e646147785 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 8.0.4
-PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools-scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/eb/b1/0248705f10f6de5eefe7ff93e399f7192257b23df4d431d2f5680bb2778f
+PYTHON_SETUPTOOLS_SCM_VERSION = 8.1.0
+PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/4f/a4/00a9ac1b555294710d4a68d2ce8dfdf39d72aa4d769a7395d05218d88a42
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = pep517
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
