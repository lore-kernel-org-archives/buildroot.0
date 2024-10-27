Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B5AD13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 963D380CB4;
	Sun, 27 Oct 2024 18:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2k2wJYHn4Jk; Sun, 27 Oct 2024 18:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9287080CE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9287080CE7;
	Sun, 27 Oct 2024 18:42:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17C095123
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 838B260796
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1R2-iDFMKoAB for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD63B60777
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD63B60777
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D78A6813EA; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:14:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8deb19711c72034f9f8a1844fd4e4ff71005643
X-Git-Newrev: a9808a57aa29341c2f0a852ca60b87ebe382d923
X-Patchwork-Hint: ignore
Message-Id: <20241027184108.D78A6813EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyftpdlib: bump to version
 2.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9808a57aa29341c2f0a852ca60b87ebe382d923
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyftpdlib/python-pyftpdlib.hash | 4 ++--
 package/python-pyftpdlib/python-pyftpdlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
index 32f662ff91..a463e98d7f 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.hash
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyftpdlib/json
-md5  36d7328c7dde493816bc3677b3c71287  pyftpdlib-2.0.0.tar.gz
-sha256  1aded131fc7d41b0fa734c7879a96a6251366b141e8886782bcb1de616ffc791  pyftpdlib-2.0.0.tar.gz
+md5  16bbc0f0e06964a7da16e88de5f38e20  pyftpdlib-2.0.1.tar.gz
+sha256  ef0d172a82bfae10e2dec222e87533514609d41bf4b0fd0f07e29d4380fb96bf  pyftpdlib-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  67a832551570a5ac5f7901eaa5ece4b9491fda7f2d8c93957c3bbc68a5a76d88  LICENSE
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index 55de21f8f6..85be95da57 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYFTPDLIB_VERSION = 2.0.0
+PYTHON_PYFTPDLIB_VERSION = 2.0.1
 PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
-PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/f1/69/a524dcb5a9be722273a74d71c509f3d875238c54fd7426fab6fd05ca8521
+PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/b4/0c/32bf0a7c88efe147bc3bc6586216d92269d196c59f149b05efa973834946
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
