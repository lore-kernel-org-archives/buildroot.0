Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF28C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:36:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ADB861130
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9ADB861130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7718A60E91;
	Wed,  6 Oct 2021 14:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxzpH0csN8oc; Wed,  6 Oct 2021 14:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1DB4606BB;
	Wed,  6 Oct 2021 14:36:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 265DC1BF36B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 381B683F1C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZeUkG3d7SRI for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:35:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84EDC83F95
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:35:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 70C669229B; Wed,  6 Oct 2021 14:32:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 16:30:24 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: e94767fe46366e67c4334704c0c4dbf4f8bb01e2
X-Git-Newrev: 4651e4dcd6874cb579f308bf6c40551c94464f63
X-Patchwork-Hint: ignore
Message-Id: <20211006143248.70C669229B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/python-texttable:
 bump to version 1.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4651e4dcd6874cb579f308bf6c40551c94464f63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
(cherry picked from commit 1c543c729ede329cf57c6a5a3afbc02a8297188f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-texttable/python-texttable.hash | 6 +++---
 package/python-texttable/python-texttable.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-texttable/python-texttable.hash b/package/python-texttable/python-texttable.hash
index a69e8ed465..a769e91772 100644
--- a/package/python-texttable/python-texttable.hash
+++ b/package/python-texttable/python-texttable.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/texttable/json
-md5  68e6b31d36f5c20221da7d5db3eca772  texttable-1.6.3.tar.gz
-sha256  ce0faf21aa77d806bbff22b107cc22cce68dc9438f97a2df32c93e9afa4ce436  texttable-1.6.3.tar.gz
+md5  15faadc07ba44d337cc1675ea6092a02  texttable-1.6.4.tar.gz
+sha256  42ee7b9e15f7b225747c3fa08f43c5d6c83bc899f80ff9bae9319334824076e9  texttable-1.6.4.tar.gz
 # Locally computed sha256 checksums
-sha256	4ba7bdab54504a3bc44eb33ecca873a26a63ab902822101a87bb46235da63594  LICENSE
+sha256  4ba7bdab54504a3bc44eb33ecca873a26a63ab902822101a87bb46235da63594  LICENSE
diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
index 6af23917b9..59df5f6ff5 100644
--- a/package/python-texttable/python-texttable.mk
+++ b/package/python-texttable/python-texttable.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTTABLE_VERSION = 1.6.3
+PYTHON_TEXTTABLE_VERSION = 1.6.4
 PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
-PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/f5/be/716342325d6d6e05608e3a10e15f192f3723e454a25ce14bc9b9d1332772
+PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/d5/78/dbc2a5eab57a01fedaf975f2c16f04e76f09336dbeadb9994258aa0a2b1a
 PYTHON_TEXTTABLE_SETUP_TYPE = setuptools
 PYTHON_TEXTTABLE_LICENSE = MIT
 PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
