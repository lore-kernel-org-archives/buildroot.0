Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B9FC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1768640C13;
	Thu,  3 Nov 2022 21:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1768640C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQiuzSCaDo9X; Thu,  3 Nov 2022 21:11:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8209140C19;
	Thu,  3 Nov 2022 21:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8209140C19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 812D11BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78ADF40BFC
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78ADF40BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xrNQLb8S3DAm for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6418240BDD
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6418240BDD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 626F187BCA; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ea11973ab14a4a1210382691d0dc42da9439bf7c
X-Git-Newrev: 3586430c167583b42794b5db37067c99d989a878
X-Patchwork-Hint: ignore
Message-Id: <20221103205513.626F187BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pyelftools:
 bump to version 0.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=3586430c167583b42794b5db37067c99d989a878
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyelftools/python-pyelftools.hash | 4 ++--
 package/python-pyelftools/python-pyelftools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyelftools/python-pyelftools.hash b/package/python-pyelftools/python-pyelftools.hash
index a309b90e15..7cffe2d646 100644
--- a/package/python-pyelftools/python-pyelftools.hash
+++ b/package/python-pyelftools/python-pyelftools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyelftools/json
-md5  061d67c669a9b1f8d07f28c47fb6a65f  pyelftools-0.27.tar.gz
-sha256  cde854e662774c5457d688ca41615f6594187ba7067af101232df889a6b7a66b  pyelftools-0.27.tar.gz
+md5  2afc97cd239c0dea0cca97d00d3dcb42  pyelftools-0.29.tar.gz
+sha256  ec761596aafa16e282a31de188737e5485552469ac63b60cfcccf22263fd24ff  pyelftools-0.29.tar.gz
 # Locally computed sha256 checksums
 sha256  ae18bf4cb82f92af7547259177bc28bc48e4fc732518bcedfe690226288d3445  LICENSE
diff --git a/package/python-pyelftools/python-pyelftools.mk b/package/python-pyelftools/python-pyelftools.mk
index 5bfdcd33ae..7566f24895 100644
--- a/package/python-pyelftools/python-pyelftools.mk
+++ b/package/python-pyelftools/python-pyelftools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYELFTOOLS_VERSION = 0.27
+PYTHON_PYELFTOOLS_VERSION = 0.29
 PYTHON_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
-PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/6b/b5/f7022f2d950327ba970ec85fb8f85c79244031092c129b6f34ab17514ae0
+PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/0e/35/e76da824595452a5ad07f289ea1737ca0971fc6cc7b6ee9464279be06b5e
 PYTHON_PYELFTOOLS_LICENSE = Public domain
 PYTHON_PYELFTOOLS_LICENSE_FILES = LICENSE
 PYTHON_PYELFTOOLS_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
