Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEE8EC8733
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 14:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE27482095;
	Thu,  7 Sep 2023 14:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE27482095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xGa-Bbnyp8D; Thu,  7 Sep 2023 14:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBDEF82314;
	Thu,  7 Sep 2023 14:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBDEF82314
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 247F51BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB8DC41DA6
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB8DC41DA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 91nzBXGDvWCt for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94F2641D74
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94F2641D74
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F30A86A1F; Thu,  7 Sep 2023 14:51:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 13:55:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05adefbafd532d901f8476e9dc59eb416108c4d4
X-Git-Newrev: 6a3166cc2931178602810e241c21c67ac885ab87
X-Patchwork-Hint: ignore
Message-Id: <20230907145125.7F30A86A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dominate: bump version to
 2.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a3166cc2931178602810e241c21c67ac885ab87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/Knio/dominate/releases/tag/2.8.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dominate/python-dominate.hash | 4 ++--
 package/python-dominate/python-dominate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dominate/python-dominate.hash b/package/python-dominate/python-dominate.hash
index 89293baec6..9993dbe95f 100644
--- a/package/python-dominate/python-dominate.hash
+++ b/package/python-dominate/python-dominate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dominate/json
-md5  77bba29beaaac4dfb657092cd89db033  dominate-2.7.0.tar.gz
-sha256  520101360892ebf9d0553f67d37e359ff92403d8a1e33814030503088a05da49  dominate-2.7.0.tar.gz
+md5  df2d30e7c2e7f1e5b085a58820e4cc94  dominate-2.8.0.tar.gz
+sha256  4c90c3befaf88e612b71f4b39af7bcbef8977acfa855cec957225a8fbf504007  dominate-2.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  LICENSE.txt
diff --git a/package/python-dominate/python-dominate.mk b/package/python-dominate/python-dominate.mk
index 0f3687de5f..39e2edb82e 100644
--- a/package/python-dominate/python-dominate.mk
+++ b/package/python-dominate/python-dominate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOMINATE_VERSION = 2.7.0
+PYTHON_DOMINATE_VERSION = 2.8.0
 PYTHON_DOMINATE_SOURCE = dominate-$(PYTHON_DOMINATE_VERSION).tar.gz
-PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/12/d7/5e5f50f5d5bdd4282d2a70b9479c1d91d6628bebd4829e455cdf7366a92e
+PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/13/3d/8d22916c12184f0c4930b9cdfb136a130e8d8eacf5942fc9883f2a189f6a
 PYTHON_DOMINATE_SETUP_TYPE = setuptools
 PYTHON_DOMINATE_LICENSE = LGPL-3.0+
 PYTHON_DOMINATE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
