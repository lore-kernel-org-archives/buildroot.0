Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AC0C001DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2117741792;
	Thu, 13 Jul 2023 20:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2117741792
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pKJRSgwEY2xf; Thu, 13 Jul 2023 20:24:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DAAE417A0;
	Thu, 13 Jul 2023 20:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DAAE417A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 523811BF982
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3962482C8F
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3962482C8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w8aVjOXFOO_Q for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:24:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4389782B08
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4389782B08
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CDAD86FCA; Thu, 13 Jul 2023 20:24:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 22:10:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40f245152965c1f298ec76a1d8d24858daecc8f5
X-Git-Newrev: 66f91a79422dcdcaa8693bc3599d780f64f9e84d
X-Patchwork-Hint: ignore
Message-Id: <20230713202406.2CDAD86FCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-click: bump version to 8.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=66f91a79422dcdcaa8693bc3599d780f64f9e84d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index 81d19c419e..9b2f8ed833 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  a804b085de7a3ff96968e38e0f6f2e05  click-8.1.3.tar.gz
-sha256  7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e  click-8.1.3.tar.gz
+md5  d19686712c4a599bc8bf1f6f3ea7947d  click-8.1.4.tar.gz
+sha256  b97d0c74955da062a7d4ef92fadb583806a585b2ea81958a81bd72726cbb8e37  click-8.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.rst
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 6444d0148e..a6f2c3773c 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.1.3
+PYTHON_CLICK_VERSION = 8.1.4
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/77/88/b0cc5fe95c31c301e9823ea9b028f669c0dcfa205ff71111037a5ed4892c
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.rst
 PYTHON_CLICK_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
