Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098F0C46467
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97D7281EEF;
	Sun, 15 Jan 2023 11:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97D7281EEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUkQlpAYkCY7; Sun, 15 Jan 2023 11:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E343081ED0;
	Sun, 15 Jan 2023 11:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E343081ED0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F1101BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B22D40297
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B22D40297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xLME61hjiozE for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:06:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9167400F1
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9167400F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8544870E7; Sun, 15 Jan 2023 11:06:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:00:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1db8f1edf859a501fb8444e90a2af7916f48de42
X-Git-Newrev: 63f59977dd884c36fe9a4fe4a51e3bd5d183705a
X-Patchwork-Hint: ignore
Message-Id: <20230115110627.B8544870E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump to version
 1.26.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=63f59977dd884c36fe9a4fe4a51e3bd5d183705a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 60fd07681c..eecc87ab2d 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  9d5447419233a259b3ade6fb86d86cb6  boto3-1.26.27.tar.gz
-sha256  255a7565226c21c5d500f69aabb977e1ac07dbaf576f4428d00558e8e508a23b  boto3-1.26.27.tar.gz
+md5  e3777333a201a2511dd7c814782fe9f0  boto3-1.26.45.tar.gz
+sha256  cc7f652df93e1ce818413fd82ffd645d4f92a64fec67c72946212d3750eaa80f  boto3-1.26.45.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index e40ac92f09..4d8fe58701 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.26.27
+PYTHON_BOTO3_VERSION = 1.26.45
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/62/7b/7cdcb980d9d90c910a6abec2cdee0ff6aa7a3d8afea4044ffd968d5c107c
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/f5/5d/62bfcda02d90699d41d5ff2573f88b5555354fb87308e8a3427fef3956c5
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
