Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C3CD13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2016A6067D;
	Sun, 27 Oct 2024 18:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuHCcCKwgdci; Sun, 27 Oct 2024 18:41:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0037460793
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0037460793;
	Sun, 27 Oct 2024 18:41:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 194025123
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55C424012F
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nF8bVU6_l0jI for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5C75400E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5C75400E7
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E240281451; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:14:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9808a57aa29341c2f0a852ca60b87ebe382d923
X-Git-Newrev: a57d613fd3694ae9e6c7a10b2b88b7bb277128ed
X-Patchwork-Hint: ignore
Message-Id: <20241027184108.E240281451@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymodbus: bump to version
 3.7.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=a57d613fd3694ae9e6c7a10b2b88b7bb277128ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 72b5b82019..7e3cadce70 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  c7879e21035bb4fc5d22b473e097b353  pymodbus-3.7.3.tar.gz
-sha256  603490162382fe34258992e3b8fe8d2da573a08aa49257ee7ab7b5b1d1a6653c  pymodbus-3.7.3.tar.gz
+md5  0371a857e08b555cabf3935044675f39  pymodbus-3.7.4.tar.gz
+sha256  573c370aea04523403eea1e159616a583cd7b93cfc5c81b07340d3cccd52c99f  pymodbus-3.7.4.tar.gz
 # Locally computed sha256 checksums
 sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 6833e8d58b..0bd99cc3da 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.7.3
+PYTHON_PYMODBUS_VERSION = 3.7.4
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/af/33/3ccba09863981b2a3977933aa583b66ab65084bcb94aae4ec94ac23c9e39
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/0b/bc/f98789706351e778676a3e84ed6203160c4f581092e298eb075bc9e08230
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
