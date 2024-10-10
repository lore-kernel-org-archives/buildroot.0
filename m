Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AECD24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47DEB412E2;
	Thu, 10 Oct 2024 21:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUk_yrlvSGdF; Thu, 10 Oct 2024 21:30:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCB3B4130B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCB3B4130B;
	Thu, 10 Oct 2024 21:30:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7696C1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 625AD410A0
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5l4jMRPB47ev for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EF3D40574
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EF3D40574
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26B7A85C59; Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:17:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cb49e771270a0ecbe651e40adc4b9660ea8ae8b
X-Git-Newrev: 98c8eaada4debcadaa1b649a2cf22582d469b272
X-Patchwork-Hint: ignore
Message-Id: <20241010213042.26B7A85C59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohappyeyeballs: bump to
 version 2.4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=98c8eaada4debcadaa1b649a2cf22582d469b272
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash | 4 ++--
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
index c7b956238f..85938c1084 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohappyeyeballs/json
-md5  3c9a696b2d2808a3a633743965415d4d  aiohappyeyeballs-2.4.0.tar.gz
-sha256  55a1714f084e63d49639800f95716da97a1f173d46a16dfcfda0016abb93b6b2  aiohappyeyeballs-2.4.0.tar.gz
+md5  dcc0ba52e3c350f4edc8a8475d1892d6  aiohappyeyeballs-2.4.3.tar.gz
+sha256  75cf88a15106a5002a8eb1dab212525c00d1f4c0fa96e551c9fbe6f09a621586  aiohappyeyeballs-2.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
index 0d6abdf65e..a531c4585f 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.0
+PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.3
 PYTHON_AIOHAPPYEYEBALLS_SOURCE = aiohappyeyeballs-$(PYTHON_AIOHAPPYEYEBALLS_VERSION).tar.gz
-PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/2d/f7/22bba300a16fd1cad99da1a23793fe43963ee326d012fdf852d0b4035955
+PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/bc/69/2f6d5a019bd02e920a3417689a89887b39ad1e350b562f9955693d900c40
 PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = pep517
 PYTHON_AIOHAPPYEYEBALLS_LICENSE = PSF-2.0
 PYTHON_AIOHAPPYEYEBALLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
