Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F365AC3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7052884720;
	Sun, 15 Sep 2024 21:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDm2Y2t8nBtZ; Sun, 15 Sep 2024 21:42:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 231318497A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 231318497A;
	Sun, 15 Sep 2024 21:42:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F3C61BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82B2A60893
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nx5sgRfdQXYB for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E9D160A49
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E9D160A49
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BC208155E; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 11:59:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1b174ab327ddfa950670ca0a7e972e5e9257302
X-Git-Newrev: ae29a849a1e92b5520ea15f88ab01df8147ec9a0
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.3BC208155E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-context: bump to
 version 6.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae29a849a1e92b5520ea15f88ab01df8147ec9a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License has changed due to copyright notice cleanup:
https://github.com/jaraco/jaraco.context/commit/5957d58266e479f124b31f30e4322e798fdf386b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jaraco-context/python-jaraco-context.hash | 6 +++---
 package/python-jaraco-context/python-jaraco-context.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-jaraco-context/python-jaraco-context.hash b/package/python-jaraco-context/python-jaraco-context.hash
index f8daa91364..a6b32260b2 100644
--- a/package/python-jaraco-context/python-jaraco-context.hash
+++ b/package/python-jaraco-context/python-jaraco-context.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.context/json
-md5  b40aeeda6a07dd283f2a407f622cda5b  jaraco.context-4.3.0.tar.gz
-sha256  4dad2404540b936a20acedec53355bdaea223acb88fd329fa6de9261c941566e  jaraco.context-4.3.0.tar.gz
+md5  bb22ef027077b1fa8528ef1d9840b838  jaraco_context-6.0.1.tar.gz
+sha256  9bae4ea555cf0b14938dc0aee7c9f32ed303aa20a3b73e7dc80111628792d1b3  jaraco_context-6.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-context/python-jaraco-context.mk b/package/python-jaraco-context/python-jaraco-context.mk
index 668855c98a..d33521afdd 100644
--- a/package/python-jaraco-context/python-jaraco-context.mk
+++ b/package/python-jaraco-context/python-jaraco-context.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_CONTEXT_VERSION = 4.3.0
-PYTHON_JARACO_CONTEXT_SOURCE = jaraco.context-$(PYTHON_JARACO_CONTEXT_VERSION).tar.gz
-PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/7c/b4/fa71f82b83ebeed95fe45ce587d6cba85b7c09ef3d9f61602f92f45e90db
+PYTHON_JARACO_CONTEXT_VERSION = 6.0.1
+PYTHON_JARACO_CONTEXT_SOURCE = jaraco_context-$(PYTHON_JARACO_CONTEXT_VERSION).tar.gz
+PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/df/ad/f3777b81bf0b6e7bc7514a1656d3e637b2e8e15fab2ce3235730b3e7a4e6
 PYTHON_JARACO_CONTEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_CONTEXT_LICENSE = MIT
 PYTHON_JARACO_CONTEXT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
