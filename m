Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00ADC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:03:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CDDC60F24
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CDDC60F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3658D40328;
	Sun, 26 Sep 2021 21:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8YG20ZVT6mT; Sun, 26 Sep 2021 21:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8048A40314;
	Sun, 26 Sep 2021 21:03:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93A8C1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D97FF402F6
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GmwDx9ztOYZC for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:00:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64F8540327
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D4A218D2AF; Sun, 26 Sep 2021 20:57:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 22:17:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47ef8ab6cea619060d07c8618f6777dd23db0728
X-Git-Newrev: 6531350607e139fbb95f1710423b6d187ea89093
X-Patchwork-Hint: ignore
Message-Id: <20210926205756.D4A218D2AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hyperlink: bump to version
 21.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6531350607e139fbb95f1710423b6d187ea89093
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash change due to name being added:
https://github.com/python-hyper/hyperlink/commit/c7509785af58fa4d065faed2557e57943e31f53d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-hyperlink/python-hyperlink.hash | 6 +++---
 package/python-hyperlink/python-hyperlink.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-hyperlink/python-hyperlink.hash b/package/python-hyperlink/python-hyperlink.hash
index 94535002e6..c7621a96ac 100644
--- a/package/python-hyperlink/python-hyperlink.hash
+++ b/package/python-hyperlink/python-hyperlink.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hyperlink/json
-md5	4772fb4d87c26a1ab22a6161424e3cba  hyperlink-19.0.0.tar.gz
-sha256	4288e34705da077fada1111a24a0aa08bb1e76699c9ce49876af722441845654  hyperlink-19.0.0.tar.gz
+md5  6285ac13e7d6be4157698ad7960ed490  hyperlink-21.0.0.tar.gz
+sha256  427af957daa58bc909471c6c40f74c5450fa123dd093fc53efd2e91d2705a56b  hyperlink-21.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	9577b66fb599aa5700b4981078ab0a319416a086beee646cd282aa9f33c8c74c  LICENSE
+sha256  7468ded55310f64fbf085b8e892df81d1bcc49263bf535d3c2c58b014cfae214  LICENSE
diff --git a/package/python-hyperlink/python-hyperlink.mk b/package/python-hyperlink/python-hyperlink.mk
index deff4feac3..a80c555450 100644
--- a/package/python-hyperlink/python-hyperlink.mk
+++ b/package/python-hyperlink/python-hyperlink.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HYPERLINK_VERSION = 19.0.0
+PYTHON_HYPERLINK_VERSION = 21.0.0
 PYTHON_HYPERLINK_SOURCE = hyperlink-$(PYTHON_HYPERLINK_VERSION).tar.gz
-PYTHON_HYPERLINK_SITE = https://files.pythonhosted.org/packages/e0/46/1451027b513a75edf676d25a47f601ca00b06a6a7a109e5644d921e7462d
+PYTHON_HYPERLINK_SITE = https://files.pythonhosted.org/packages/3a/51/1947bd81d75af87e3bb9e34593a4cf118115a8feb451ce7a69044ef1412e
 PYTHON_HYPERLINK_SETUP_TYPE = setuptools
 PYTHON_HYPERLINK_LICENSE = MIT
 PYTHON_HYPERLINK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
