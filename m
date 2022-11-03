Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155D3C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B312341868;
	Thu,  3 Nov 2022 21:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B312341868
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iKM_yVZYz9gu; Thu,  3 Nov 2022 21:01:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96FFC417BE;
	Thu,  3 Nov 2022 21:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96FFC417BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A2551BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C56BB40C15
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C56BB40C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_0txBOzswez for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E1F540BE4
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E1F540BE4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6741287BCA; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8d6ae5dae91367b3bfd6e1ed441eb954966684f4
X-Git-Newrev: c12a87f6ea28d94c7ff71b0f76838e1ac6a833f6
X-Patchwork-Hint: ignore
Message-Id: <20221103205511.6741287BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-dominate: bump
 to version 2.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c12a87f6ea28d94c7ff71b0f76838e1ac6a833f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dominate/python-dominate.hash | 4 ++--
 package/python-dominate/python-dominate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dominate/python-dominate.hash b/package/python-dominate/python-dominate.hash
index 2e77d72a2e..89293baec6 100644
--- a/package/python-dominate/python-dominate.hash
+++ b/package/python-dominate/python-dominate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dominate/json
-md5  9f714324ca99eee98bb3c3cdbe838de6  dominate-2.6.0.tar.gz
-sha256  76ec2cde23700a6fc4fee098168b9dee43b99c2f1dd0ca6a711f683e8eb7e1e4  dominate-2.6.0.tar.gz
+md5  77bba29beaaac4dfb657092cd89db033  dominate-2.7.0.tar.gz
+sha256  520101360892ebf9d0553f67d37e359ff92403d8a1e33814030503088a05da49  dominate-2.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  LICENSE.txt
diff --git a/package/python-dominate/python-dominate.mk b/package/python-dominate/python-dominate.mk
index 79fc058737..0f3687de5f 100644
--- a/package/python-dominate/python-dominate.mk
+++ b/package/python-dominate/python-dominate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOMINATE_VERSION = 2.6.0
+PYTHON_DOMINATE_VERSION = 2.7.0
 PYTHON_DOMINATE_SOURCE = dominate-$(PYTHON_DOMINATE_VERSION).tar.gz
-PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/29/23/edf8e470f1053245c1aa99d92c8a3da9e83f6c7d3eb39205486965425be5
+PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/12/d7/5e5f50f5d5bdd4282d2a70b9479c1d91d6628bebd4829e455cdf7366a92e
 PYTHON_DOMINATE_SETUP_TYPE = setuptools
 PYTHON_DOMINATE_LICENSE = LGPL-3.0+
 PYTHON_DOMINATE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
