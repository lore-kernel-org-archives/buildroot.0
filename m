Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A24C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82B9941720;
	Mon,  4 Dec 2023 20:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82B9941720
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jXw8cj-jkjyx; Mon,  4 Dec 2023 20:14:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A42384177A;
	Mon,  4 Dec 2023 20:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A42384177A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17F891BF977
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CE308216F
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CE308216F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EcUxvr6lBLw6 for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7E4C80BDE
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7E4C80BDE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5ED2879B9; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 16:06:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da909bf2383a9f47a181d41f285a2e73565cdfc5
X-Git-Newrev: b41d4494a64b538ca0df2b3f18d19ae0a2e8a46a
X-Patchwork-Hint: ignore
Message-Id: <20231204201327.C5ED2879B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-logbook: bump to version
 1.7.0.post0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b41d4494a64b538ca0df2b3f18d19ae0a2e8a46a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-logbook/python-logbook.hash | 4 ++--
 package/python-logbook/python-logbook.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index d77acad76e..8761945de6 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/logbook/json
-md5  719970ea22dd274797bb4328161d700f  Logbook-1.5.3.tar.gz
-sha256  66f454ada0f56eae43066f604a222b09893f98c1adc18df169710761b8f32fe8  Logbook-1.5.3.tar.gz
+md5  cbb7e5fb2d6325f42a323b0000127393  Logbook-1.7.0.post0.tar.gz
+sha256  a5e8016701ca3beea6a390b0ba1541037f663543ca508ccd36cfdc841639cdd7  Logbook-1.7.0.post0.tar.gz
 # Locally computed sha256 checksums
 sha256  2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index 8f02e9b945..e47e78d26e 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_LOGBOOK_VERSION = 1.5.3
+PYTHON_LOGBOOK_VERSION = 1.7.0.post0
 PYTHON_LOGBOOK_SOURCE = Logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
-PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/2f/d9/16ac346f7c0102835814cc9e5b684aaadea101560bb932a2403bd26b2320
+PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/cc/98/c1d93c1d7593f58515333a6217aa4ae647d9ee9c1aa2dfdf77b28b7bb7c7
 PYTHON_LOGBOOK_SETUP_TYPE = setuptools
 PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
 PYTHON_LOGBOOK_LICENSE_FILES = LICENSE
+PYTHON_LOGBOOK_DEPENDENCIES = host-python-cython
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
