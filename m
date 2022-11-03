Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92941C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4307C61025;
	Thu,  3 Nov 2022 20:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4307C61025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-8W0D4O7Kq2; Thu,  3 Nov 2022 20:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6867060AAC;
	Thu,  3 Nov 2022 20:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6867060AAC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55E481BF96B
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DAFF61044
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DAFF61044
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KnJDS3ZYmGPS for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64A2861045
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64A2861045
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5284487BCE; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2814f4b0dfc6a69ccc90d058c405daf244af40bf
X-Git-Newrev: 430643f636b1b7678b024d220aef2e3f0ad42f0b
X-Patchwork-Hint: ignore
Message-Id: <20221103205510.5284487BCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-arrow: bump to
 version 1.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=430643f636b1b7678b024d220aef2e3f0ad42f0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-arrow/python-arrow.hash | 4 ++--
 package/python-arrow/python-arrow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
index 9216e1c26c..30fb88e8c0 100644
--- a/package/python-arrow/python-arrow.hash
+++ b/package/python-arrow/python-arrow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/arrow/json
-md5  608682052926c7e5636285af0618ef38  arrow-1.2.0.tar.gz
-sha256  16fc29bbd9e425e3eb0fef3018297910a0f4568f21116fc31771e2760a50e074  arrow-1.2.0.tar.gz
+md5  a964a7574e486b0642f3fbc02ef22773  arrow-1.2.3.tar.gz
+sha256  3934b30ca1b9f292376d9db15b19446088d12ec58629bc3f0da28fd55fb633a1  arrow-1.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  40d6e1255d7151f5f041a514725d3c94ffa8c1881e5a0c29b6bea93f03e2e3bb  LICENSE
diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
index a20ac8dbc7..1e34ef09c8 100644
--- a/package/python-arrow/python-arrow.mk
+++ b/package/python-arrow/python-arrow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARROW_VERSION = 1.2.0
+PYTHON_ARROW_VERSION = 1.2.3
 PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
-PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/dc/bd/2565b8533bb8cf66e10a9e68a1d489ad839799b2050f0635039e614e3b1a
+PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/7f/c0/c601ea7811f422700ef809f167683899cdfddec5aa3f83597edf97349962
 PYTHON_ARROW_SETUP_TYPE = setuptools
 PYTHON_ARROW_LICENSE = Apache-2.0
 PYTHON_ARROW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
