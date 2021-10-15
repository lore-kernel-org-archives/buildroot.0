Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED97AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:16:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66EF611CE
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B66EF611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85C8760EF1;
	Fri, 15 Oct 2021 21:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qaavjebro_5B; Fri, 15 Oct 2021 21:16:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D989160661;
	Fri, 15 Oct 2021 21:16:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EAA01BF417
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B28640801
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fq1WEKyYnnje for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 21:16:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEF45407FC
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 21:16:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7805595C36; Fri, 15 Oct 2021 21:13:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 22:50:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e62e9b14b2656f813c20ec6aaee99e3a85601c7
X-Git-Newrev: 197be270008945a7fb644bb3d1398468095475b9
X-Patchwork-Hint: ignore
Message-Id: <20211015211349.7805595C36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyjwt: bump to version 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=197be270008945a7fb644bb3d1398468095475b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pyjwt/python-pyjwt.hash | 4 ++--
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index f3bc5d4814..6bfbe05bf9 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5  34c235e02746683bfc81a61f9ec4dc85  PyJWT-2.1.0.tar.gz
-sha256  fba44e7898bbca160a2b2b501f492824fc8382485d3a6f11ba5d0c1937ce6130  PyJWT-2.1.0.tar.gz
+md5  c7c5b05a1dcee1fac0dc13fea892ed86  PyJWT-2.2.0.tar.gz
+sha256  a0b9a3b4e5ca5517cac9f1a6e9cd30bf1aa80be74fcdf4e28eded582ecfcfbae  PyJWT-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ec82af815b5f9da8685afb300cc5beb7949e1c22b79b6c1c054796cefdf6cac6  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 5600459c65..123f12ef69 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.1.0
+PYTHON_PYJWT_VERSION = 2.2.0
 PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/0c/c6/3cdc7cb1289b35186fd7fd61836b6d83632ca0f7eee552516777361667b1
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/b9/6d/e5ac4eb80724cb4201de6dcbc1e8a9f5cb65a0424b30c4c69e49bc1363d1
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
