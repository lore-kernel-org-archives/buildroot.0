Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA74ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C294D84276;
	Sun, 11 Sep 2022 09:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C294D84276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bYx6G7Y8X9mC; Sun, 11 Sep 2022 09:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D2F8429F;
	Sun, 11 Sep 2022 09:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D2F8429F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 377931BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0AB46FB1C
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0AB46FB1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s7jUNE-sbdZO for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC3E16103F
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC3E16103F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 966BD83621; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 21:29:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 590bc8efb6c54539471826974b4e457dd1e99034
X-Git-Newrev: 9bbcc554dd12acdbdd1484f17e72423658982025
X-Patchwork-Hint: ignore
Message-Id: <20220911084825.966BD83621@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fonttools: bump to version
 4.36.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9bbcc554dd12acdbdd1484f17e72423658982025
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 469fea9c19..4f6536dbfb 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  197ad603c91d4c2909acf9e54c26e85f  fonttools-4.34.4.zip
-sha256  9a1c52488045cd6c6491fd07711a380f932466e317cb8e016fc4e99dc7eac2f0  fonttools-4.34.4.zip
+md5  5eb0df388216de4bfd058153d16c75bf  fonttools-4.36.0.zip
+sha256  e637d2fe06bddabbfc488e02ef32d04d561e3c71e9ba11abc7782ea753ceb218  fonttools-4.36.0.zip
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index c35c538cb6..6281359e86 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.34.4
+PYTHON_FONTTOOLS_VERSION = 4.36.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/5a/a4/a97cff4c4af6764a04cc202299e5205b2e101cb1543bcaf9737be29f78ab
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/df/4b/ca51dbaf267decfcc7ca9300cdc703206c1c05f3e2beb5140a71817c2d7e
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
