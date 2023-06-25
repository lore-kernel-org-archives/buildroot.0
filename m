Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E34EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 568C760BEC;
	Sun, 25 Jun 2023 19:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 568C760BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psIB8h1p5Pck; Sun, 25 Jun 2023 19:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 794F461195;
	Sun, 25 Jun 2023 19:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 794F461195
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F1FE1BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77E854091B
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77E854091B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v095BB8IfNrO for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:13:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65469408F1
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65469408F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 387B884BCE; Sun, 25 Jun 2023 19:13:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 21:11:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 774b8a78432ae84d167ff87567c7cf8699a4f288
X-Git-Newrev: 7b1d7f818bde9c2c967646e3a5713a6c2ede322f
X-Patchwork-Hint: ignore
Message-Id: <20230625191338.387B884BCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xmodem: bump to version
 0.4.7
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b1d7f818bde9c2c967646e3a5713a6c2ede322f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Right now there is a LICENSE file included in the package, so use it for
license validation.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-xmodem/python-xmodem.hash | 8 ++++----
 package/python-xmodem/python-xmodem.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-xmodem/python-xmodem.hash b/package/python-xmodem/python-xmodem.hash
index 33ddfeb595..65a9b6afda 100644
--- a/package/python-xmodem/python-xmodem.hash
+++ b/package/python-xmodem/python-xmodem.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xmodem/json
-md5  f876cb35caf276b61990377710a3b4c4  xmodem-0.4.6.tar.gz
-sha256  089737298f5738eabc43f2519efdc80b402693768f16383f7013b9e6f8f279d7  xmodem-0.4.6.tar.gz
-# locally calculated
-sha256  5ddb38acab95bb77e1e92e22830e358082d879d2dd59ba05577c47791edaa78e  PKG-INFO
+md5  0a21c269cb4d3995d13a2615c24fed0a  xmodem-0.4.7.tar.gz
+sha256  2f1068aa8676f0d1d112498b5786c4f8ea4f89d8f25d07d3a0f293cd21db1c35  xmodem-0.4.7.tar.gz
+# Locally computed sha256 checksums
+sha256  e317b0ce19724327a41e09def456579b80a7b82f9bceb2ba6933eba406f78d88  LICENSE
diff --git a/package/python-xmodem/python-xmodem.mk b/package/python-xmodem/python-xmodem.mk
index 739c6154d7..d7040f7245 100644
--- a/package/python-xmodem/python-xmodem.mk
+++ b/package/python-xmodem/python-xmodem.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_XMODEM_VERSION = 0.4.6
+PYTHON_XMODEM_VERSION = 0.4.7
 PYTHON_XMODEM_SOURCE = xmodem-$(PYTHON_XMODEM_VERSION).tar.gz
-PYTHON_XMODEM_SITE = https://files.pythonhosted.org/packages/29/5d/a20d7957f207fc4c4c143881ca7b9617ab7700c153012372ef0a934c7710
+PYTHON_XMODEM_SITE = https://files.pythonhosted.org/packages/3d/17/fd6668a09afdc46c22990172b6f65e07dfb5bcf38960d063a7a887ca926d
 PYTHON_XMODEM_SETUP_TYPE = setuptools
 PYTHON_XMODEM_LICENSE = MIT
-PYTHON_XMODEM_LICENSE_FILES = PKG-INFO
+PYTHON_XMODEM_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
