Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37D3C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FBFF83AA3;
	Tue, 17 Jun 2025 19:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nR0Wrp4DxVF; Tue, 17 Jun 2025 19:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6AAF83A87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6AAF83A87;
	Tue, 17 Jun 2025 19:59:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E556CE2
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D721583A87
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O27hLM2MSES5 for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39FF3813C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39FF3813C6
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:59:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 265F983C77; Tue, 17 Jun 2025 19:59:38 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Jun 2025 21:51:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c2aa35fbef1d4f928433bf61323347d3c54c4e3
X-Git-Newrev: d3463f4129f90cd6eb12343ef0dfd89539806242
X-Patchwork-Hint: ignore
Message-Id: <20250617195938.265F983C77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dbus-fast: bump to 2.44.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3463f4129f90cd6eb12343ef0dfd89539806242
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See [1] for changelog.

[1] https://github.com/Bluetooth-Devices/dbus-fast/blob/v2.44.1/CHANGELOG.md

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 40b09eff0a..5f8b11c540 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  b8c9e11eb30efee1a5832bb606264e45  dbus_fast-2.34.0.tar.gz
-sha256  32aa03b4b102e7ad8caf39c708e3c263ef73121a4bb64f3f877c5cf0bad91e45  dbus_fast-2.34.0.tar.gz
+md5  45f1bccaa3e23304d8da1916b05dd646  dbus_fast-2.44.1.tar.gz
+sha256  b027e96c39ed5622bb54d811dcdbbe9d9d6edec3454808a85a1ceb1867d9e25c  dbus_fast-2.44.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index c2dccd073c..854ce2068b 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 2.34.0
+PYTHON_DBUS_FAST_VERSION = 2.44.1
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/0c/bc/a124a2bcd99063bd07e035b8d82437f152334a459c2497d06f77963f7b95
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/c2/a1/9693ec018feed2a7d3420eac6c807eabc6eb84227913104123c0d2ea5737
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
