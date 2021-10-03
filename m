Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70554C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:24:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3752361B40
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3752361B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 035D6426CD;
	Sun,  3 Oct 2021 08:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgIrOqm7boTt; Sun,  3 Oct 2021 08:24:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 580EF40703;
	Sun,  3 Oct 2021 08:24:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 647A61BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A633E400F3
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a2ZWe3yvAorK for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE96F404EC
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 48BDB8DB40; Sun,  3 Oct 2021 08:20:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 10:22:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5744715b61322468b7ebfd59ff0850c9c4b5fee
X-Git-Newrev: aae5d6fda52eb74f57fd1529f0fc183f97ceba53
X-Patchwork-Hint: ignore
Message-Id: <20211003082055.48BDB8DB40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sortedcontainers: bump to
 version 2.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=aae5d6fda52eb74f57fd1529f0fc183f97ceba53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-sortedcontainers/python-sortedcontainers.hash | 4 ++--
 package/python-sortedcontainers/python-sortedcontainers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sortedcontainers/python-sortedcontainers.hash b/package/python-sortedcontainers/python-sortedcontainers.hash
index d97687dd19..31463f5e4b 100644
--- a/package/python-sortedcontainers/python-sortedcontainers.hash
+++ b/package/python-sortedcontainers/python-sortedcontainers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sortedcontainers/json
-md5  660260df593a3769c7b5854f13d574c0  sortedcontainers-2.3.0.tar.gz
-sha256  59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1  sortedcontainers-2.3.0.tar.gz
+md5  50eeb6cb739568b590b28f9a3f445c78  sortedcontainers-2.4.0.tar.gz
+sha256  25caa5a06cc30b6b83d11423433f65d1f9d76c4c6a0c90e3379eaa43b9bfdb88  sortedcontainers-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1db7cae7fce6452e2e608e401a0f953e0133e4c2d75db69fb8ae851d2086f5b6  LICENSE
diff --git a/package/python-sortedcontainers/python-sortedcontainers.mk b/package/python-sortedcontainers/python-sortedcontainers.mk
index 31cab76fd7..51df517264 100644
--- a/package/python-sortedcontainers/python-sortedcontainers.mk
+++ b/package/python-sortedcontainers/python-sortedcontainers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SORTEDCONTAINERS_VERSION = 2.3.0
+PYTHON_SORTEDCONTAINERS_VERSION = 2.4.0
 PYTHON_SORTEDCONTAINERS_SOURCE = sortedcontainers-$(PYTHON_SORTEDCONTAINERS_VERSION).tar.gz
-PYTHON_SORTEDCONTAINERS_SITE = https://files.pythonhosted.org/packages/14/10/6a9481890bae97da9edd6e737c9c3dec6aea3fc2fa53b0934037b35c89ea
+PYTHON_SORTEDCONTAINERS_SITE = https://files.pythonhosted.org/packages/e8/c4/ba2f8066cceb6f23394729afe52f3bf7adec04bf9ed2c820b39e19299111
 PYTHON_SORTEDCONTAINERS_SETUP_TYPE = setuptools
 PYTHON_SORTEDCONTAINERS_LICENSE = Apache-2.0
 PYTHON_SORTEDCONTAINERS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
