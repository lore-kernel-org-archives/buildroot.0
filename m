Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07851C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3FAB61058;
	Thu,  3 Nov 2022 21:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3FAB61058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kYNBD7w2KTtp; Thu,  3 Nov 2022 21:07:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C406E61051;
	Thu,  3 Nov 2022 21:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C406E61051
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A84BD1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E8B640BF1
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E8B640BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ft-NQ3VS9ic6 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 821E040BE0
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 821E040BE0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70CE387BC3; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c12a87f6ea28d94c7ff71b0f76838e1ac6a833f6
X-Git-Newrev: fb56dd4b94b08cf419f0d4adc23e19b9bee14f58
X-Patchwork-Hint: ignore
Message-Id: <20221103205511.70CE387BC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-dpkt: bump to
 version 1.9.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb56dd4b94b08cf419f0d4adc23e19b9bee14f58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dpkt/python-dpkt.hash | 4 ++--
 package/python-dpkt/python-dpkt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dpkt/python-dpkt.hash b/package/python-dpkt/python-dpkt.hash
index e5e986628c..7de0d748fc 100644
--- a/package/python-dpkt/python-dpkt.hash
+++ b/package/python-dpkt/python-dpkt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dpkt/json
-md5  ac3ace1c5ee12a74f12a863ac9082b59  dpkt-1.9.7.2.tar.gz
-sha256  80f977667ebbad2b5c4f7b7f45ee8bea6622fb71723f68a9a8fe6274520c853b  dpkt-1.9.7.2.tar.gz
+md5  0f16de3c0b8caa6ec2261210f08c7b8b  dpkt-1.9.8.tar.gz
+sha256  43f8686e455da5052835fd1eda2689d51de3670aac9799b1b00cfd203927ee45  dpkt-1.9.8.tar.gz
 # Locally computed sha256 checksums
 sha256  4c5ffde575425591cbd51410219a6b98bbbb717e0c5784187e356653da8e5095  LICENSE
diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index 87945d67c6..a99a1e8604 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DPKT_VERSION = 1.9.7.2
+PYTHON_DPKT_VERSION = 1.9.8
 PYTHON_DPKT_SOURCE = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
-PYTHON_DPKT_SITE = https://files.pythonhosted.org/packages/95/51/923b370880eff9b62fe4fe965a916da709022a02669c670731da69088e93
+PYTHON_DPKT_SITE = https://files.pythonhosted.org/packages/c9/7d/52f17a794db52a66e46ebb0c7549bf2f035ed61d5a920ba4aaa127dd038e
 PYTHON_DPKT_SETUP_TYPE = setuptools
 PYTHON_DPKT_LICENSE = BSD-3-Clause
 PYTHON_DPKT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
