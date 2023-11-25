Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E63C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FE85417B7;
	Mon,  4 Dec 2023 20:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FE85417B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E1w3CP3V4f8A; Mon,  4 Dec 2023 20:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A8EA41772;
	Mon,  4 Dec 2023 20:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A8EA41772
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C1821BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B5FC8216F
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B5FC8216F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gavjG__lUYXj for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1C8E82163
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1C8E82163
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFA7D879B9; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 12:26:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdbaab97701af41f58454800de848c7e70e396b8
X-Git-Newrev: ecc9da527794cf6a1b09e132412350376349d2d5
X-Patchwork-Hint: ignore
Message-Id: <20231204201328.AFA7D879B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycrate: bump to version
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

commit: https://git.buildroot.net/buildroot/commit/?id=ecc9da527794cf6a1b09e132412350376349d2d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pycrate/python-pycrate.hash | 4 ++--
 package/python-pycrate/python-pycrate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
index fd41274369..94ec99b738 100644
--- a/package/python-pycrate/python-pycrate.hash
+++ b/package/python-pycrate/python-pycrate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycrate/json
-md5  d51fd27d99481990ff85a1e418b1c938  pycrate-0.6.0.tar.gz
-sha256  b49738c02a3f93ba9f76c0dac82b689a5341882814b36c714e9600e9f560daf7  pycrate-0.6.0.tar.gz
+md5  bd21fa697ecff7ad93bec4943230d281  pycrate-0.7.0.tar.gz
+sha256  c83232f522b5bbc3b3eeaca2cf38ee63cd3c25d0c15f3ba221e6dafa89b9a763  pycrate-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
index 2f947ab807..1645eaf52c 100644
--- a/package/python-pycrate/python-pycrate.mk
+++ b/package/python-pycrate/python-pycrate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRATE_VERSION = 0.6.0
+PYTHON_PYCRATE_VERSION = 0.7.0
 PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
-PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/fb/7f/5f354100270a5d41350e9806dc9950a33e00a30eb3a7ab5fc9db86326856
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/a6/a5/aab94e6bb8b3281cc450dde3961b417bd56abde2401955a9a4904df44c68
 PYTHON_PYCRATE_SETUP_TYPE = setuptools
 PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/$(PYTHON_PYCRATE_VERSION)/license.txt
 PYTHON_PYCRATE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
