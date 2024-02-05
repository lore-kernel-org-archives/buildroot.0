Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A4FC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA165419BD;
	Mon,  5 Feb 2024 11:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA165419BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YGQkqh1dvYa8; Mon,  5 Feb 2024 11:37:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AEA941768;
	Mon,  5 Feb 2024 11:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AEA941768
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25B061BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A4C241766
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A4C241766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j343iQUO2Aqs for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:37:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D138C4175C
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D138C4175C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBE6F86C04; Mon,  5 Feb 2024 11:37:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:36:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fd6473a2b8c4ca274bd8a3b53e55d6af5242f9a
X-Git-Newrev: ac774255e87a934f43f8048f7dd9a9d82de79cd0
X-Patchwork-Hint: ignore
Message-Id: <20240205113720.BBE6F86C04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scipy: bump to version
 1.11.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac774255e87a934f43f8048f7dd9a9d82de79cd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-scipy/python-scipy.hash | 6 ++++--
 package/python-scipy/python-scipy.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 9634771139..bee5d698a0 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,5 +1,7 @@
-# Locally generated
-sha256  f9b0248cb9d08eead44cde47cbf6339f1e9aa0dfde28f5fb27950743e317bd5d  scipy-1.11.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/scipy/json
+md5  0e8eea0f7c4fe7d8102366230c96d66d  scipy-1.11.4.tar.gz
+sha256  90a2b78e7f5733b9de748f589f09225013685f9b218275257f8a8168ededaeaa  scipy-1.11.4.tar.gz
+# Locally computed sha256 checksums
 sha256  5517022426a56179540ee6eace15fd723ef8fdb83b2900fed2152dd2e2f972a2  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
 sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index 3010cfbd54..6626826e33 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.11.0
+PYTHON_SCIPY_VERSION = 1.11.4
 PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
-PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/fa/d0/724c8204f87b6f807e3e67de32b8b4922d579154a448ce94e89129064bf1
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/6e/1f/91144ba78dccea567a6466262922786ffc97be1e9b06ed9574ef0edc11e1
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
