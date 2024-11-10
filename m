Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8773ED12D4B
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 16:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 511A880F5C;
	Sun, 10 Nov 2024 16:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-Oo3eZmqKfR; Sun, 10 Nov 2024 16:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62B7680F69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62B7680F69;
	Sun, 10 Nov 2024 16:46:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91D34DAC
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66B8940131
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzJ-LNgfZ-84 for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 16:46:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C87C40284
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C87C40284
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:46:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09B1785F56; Sun, 10 Nov 2024 16:46:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Nov 2024 17:44:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9793094ff2a11b4dce430a6f59c0a1686fe518ea
X-Git-Newrev: 8f61db37b1d2d6aaa9b1d2b3bc926f2be74105bc
X-Patchwork-Hint: ignore
Message-Id: <20241110164618.09B1785F56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylibfdt: bump to version
 1.7.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f61db37b1d2d6aaa9b1d2b3bc926f2be74105bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pylibfdt/python-pylibfdt.hash | 4 ++--
 package/python-pylibfdt/python-pylibfdt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylibfdt/python-pylibfdt.hash b/package/python-pylibfdt/python-pylibfdt.hash
index 38a07742b6..456fe41005 100644
--- a/package/python-pylibfdt/python-pylibfdt.hash
+++ b/package/python-pylibfdt/python-pylibfdt.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pylibfdt/json
-md5  8b137ca636ab30a8fa10c35c419bf3ec  pylibfdt-1.7.1.tar.gz
-sha256  254224035abd85d1409bfa59967ed249103e7bcf0d3a638aea64454e2f776e97  pylibfdt-1.7.1.tar.gz
+md5  78859f23154da8c951770f2c5287804e  pylibfdt-1.7.2.tar.gz
+sha256  b18c6c40400ed4374d0a142dcdb07e5402574ff1304454019a1fd92735b54756  pylibfdt-1.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index 494d030288..7d7398a995 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFDT_VERSION = 1.7.1
+PYTHON_PYLIBFDT_VERSION = 1.7.2
 PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
-PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/1f/99/26fa7008cc0020da5c6407c48b34de21b3613232bd8875814016aec3ead5
+PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/b1/cc/54fc80135b3eb7fcbfded65eee7c71b2b970b5124e3066a158421222f191
 PYTHON_PYLIBFDT_SETUP_TYPE = pep517
 PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
