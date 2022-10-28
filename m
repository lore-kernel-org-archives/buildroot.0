Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC516FA3742
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AD91401B2;
	Fri, 28 Oct 2022 06:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AD91401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7EHnvYRSp-8; Fri, 28 Oct 2022 06:51:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 860264026E;
	Fri, 28 Oct 2022 06:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 860264026E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3C871BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A94F640186
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A94F640186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xOPpTb5pZ_in for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:51:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC7F8400D0
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC7F8400D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8CED873B9; Fri, 28 Oct 2022 06:51:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 08:49:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f03ae604510bab7f7f7e516db96a6f880dd86688
X-Git-Newrev: aff25f871ae4b55affa87540937e618568ea6fe0
X-Patchwork-Hint: ignore
Message-Id: <20221028065137.C8CED873B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bottle: bump to version
 0.12.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=aff25f871ae4b55affa87540937e618568ea6fe0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bottle/python-bottle.hash | 4 ++--
 package/python-bottle/python-bottle.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index b1cc2aac20..58bc52e3cb 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bottle/json
-md5  4934ad7347eef30db669ccd05283a5e0  bottle-0.12.21.tar.gz
-sha256  787c61b6cc02b9c229bf2663011fac53dd8fc197f7f8ad2eeede29d888d7887e  bottle-0.12.21.tar.gz
+md5  d07df795cd4baa596ee803e964ba77fd  bottle-0.12.23.tar.gz
+sha256  683de3aa399fb26e87b274dbcf70b1a651385d459131716387abdc3792e04167  bottle-0.12.23.tar.gz
 # Locally computed sha256 checksums
 sha256  d0e7211f1c3c1a1c56f39d18bcb07f27f480c8a9552617756dda3a335933b8a6  LICENSE
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index ffea59f38f..e1691972c3 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.12.21
+PYTHON_BOTTLE_VERSION = 0.12.23
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/95/e3/5749d7657b6fb38d65afb3c0b345514a783de7a9feb4fab594fa0bacc2a0
+PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/7c/58/75f3765b0a3f86ef0b6e0b23d0503920936752ca6e0fc27efce7403b01bd
 PYTHON_BOTTLE_LICENSE = MIT
 PYTHON_BOTTLE_LICENSE_FILES = LICENSE
 PYTHON_BOTTLE_CPE_ID_VENDOR = bottlepy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
