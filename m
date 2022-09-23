Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EB0C6FA82
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 12:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECDEA41849;
	Fri, 23 Sep 2022 12:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECDEA41849
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43ld2WnBzhqd; Fri, 23 Sep 2022 12:19:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA9941845;
	Fri, 23 Sep 2022 12:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AA9941845
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 933311C2744
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 573B3405A9
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 573B3405A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSVxrJZtF2BO for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 12:17:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF399404A0
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 12:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF399404A0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCA3485ED2; Fri, 23 Sep 2022 12:17:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 14:16:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 757942d345af8321115cdc6f9be05e0243eca45e
X-Git-Newrev: 50d02dc0a44cee9373645f0b8e1d2f620ba558e4
X-Patchwork-Hint: ignore
Message-Id: <20220923121734.CCA3485ED2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cssselect2: bump to version
 0.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=50d02dc0a44cee9373645f0b8e1d2f620ba558e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cssselect2/python-cssselect2.hash | 4 ++--
 package/python-cssselect2/python-cssselect2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect2/python-cssselect2.hash b/package/python-cssselect2/python-cssselect2.hash
index ffbafdfd40..13bdca9a39 100644
--- a/package/python-cssselect2/python-cssselect2.hash
+++ b/package/python-cssselect2/python-cssselect2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect2/json
-md5  cb5630e049172f431aeb82a3d504664a  cssselect2-0.6.0.tar.gz
-sha256  5b5d6dea81a5eb0c9ca39f116c8578dd413778060c94c1f51196371618909325  cssselect2-0.6.0.tar.gz
+md5  594ebe75a12dfd6cc288858faeb77415  cssselect2-0.7.0.tar.gz
+sha256  1ccd984dab89fc68955043aca4e1b03e0cf29cad9880f6e28e3ba7a74b14aa5a  cssselect2-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd97229a1d1b0f6a8b41e109f413426dbc0874b1e03746d66cc33282601c2c2  LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
index 0e34059e75..67907f9bcd 100644
--- a/package/python-cssselect2/python-cssselect2.mk
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT2_VERSION = 0.6.0
+PYTHON_CSSSELECT2_VERSION = 0.7.0
 PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
-PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/68/62/b6a16d0c32bb088079f344202e3cd0936380a4d8cb23ef9b1f8079ff8612
+PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/e7/fc/326cb6f988905998f09bb54a3f5d98d4462ba119363c0dfad29750d48c09
 PYTHON_CSSSELECT2_SETUP_TYPE = flit
 PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
