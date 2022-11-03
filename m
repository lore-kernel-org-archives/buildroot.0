Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63032C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09E2E81E17;
	Mon,  5 Dec 2022 11:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E2E81E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLXMsyFPAvYb; Mon,  5 Dec 2022 11:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38FBC81E06;
	Mon,  5 Dec 2022 11:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38FBC81E06
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 357121BF955
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBA1C415DE
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA1C415DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eM0Yk8ggbw8A for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BECF2415EC
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BECF2415EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B849A85BA2; Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c12a87f6ea28d94c7ff71b0f76838e1ac6a833f6
X-Git-Newrev: fb56dd4b94b08cf419f0d4adc23e19b9bee14f58
X-Patchwork-Hint: ignore
Message-Id: <20221205112601.B849A85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dpkt: bump to version 1.9.8
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
