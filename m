Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EF7C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2C3642F17;
	Fri, 28 Feb 2025 16:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRejgVN04_JZ; Fri, 28 Feb 2025 16:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A8A84F8B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A8A84F8B8;
	Fri, 28 Feb 2025 16:42:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 050B61DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79A4842928
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7A5eWvCBbS0 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE75A424F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE75A424F4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3FF785E20; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Dec 2024 21:28:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d21fdce7715878f2d1b2a44e450328f50c9862cb
X-Git-Newrev: f38d7b4bb5a8c0c151bb3fe7322a8cc256ee6e7b
X-Patchwork-Hint: ignore
Message-Id: <20250228162943.E3FF785E20@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pymodbus: bump
 to version 3.8.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f38d7b4bb5a8c0c151bb3fe7322a8cc256ee6e7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 7e3cadce70..1c51c5b2ab 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  0371a857e08b555cabf3935044675f39  pymodbus-3.7.4.tar.gz
-sha256  573c370aea04523403eea1e159616a583cd7b93cfc5c81b07340d3cccd52c99f  pymodbus-3.7.4.tar.gz
+md5  7fca9b2c51dce7e1d8585bb1d96dd7d1  pymodbus-3.8.1.tar.gz
+sha256  543e3fabb10e9012801d235108ec81c8db15cc8f8e2c398861d0dc5acf9c623e  pymodbus-3.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 0bd99cc3da..fe74e3d211 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.7.4
+PYTHON_PYMODBUS_VERSION = 3.8.1
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/0b/bc/f98789706351e778676a3e84ed6203160c4f581092e298eb075bc9e08230
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/ff/81/7a7bae73b54d3545a1da420886abea0641273bbd87956dc7217b54ef524f
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
