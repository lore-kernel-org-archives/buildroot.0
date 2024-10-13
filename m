Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E983CF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4566D409ED;
	Sun, 13 Oct 2024 10:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mmgSwwHZyxw; Sun, 13 Oct 2024 10:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9283409D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9283409D9;
	Sun, 13 Oct 2024 10:46:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0591BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D06060759
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCPK9dv1kBqW for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:46:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21ADA60841
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21ADA60841
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:46:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C96E85F84; Sun, 13 Oct 2024 10:46:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 12:40:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e6c6c01d9c72bcd789d5251e41435b6c461796b
X-Git-Newrev: 7bf8be92edeb5415062de619dec1f4744a041130
X-Patchwork-Hint: ignore
Message-Id: <20241013104625.1C96E85F84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wsaccel: bump to version
 0.6.7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7bf8be92edeb5415062de619dec1f4744a041130
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-wsaccel/python-wsaccel.hash | 4 ++--
 package/python-wsaccel/python-wsaccel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wsaccel/python-wsaccel.hash b/package/python-wsaccel/python-wsaccel.hash
index 9991f8f454..5aaf95c957 100644
--- a/package/python-wsaccel/python-wsaccel.hash
+++ b/package/python-wsaccel/python-wsaccel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wsaccel/json
-md5  b05eecfac9cb19326bfc3b538de495ac  wsaccel-0.6.6.tar.gz
-sha256  18efec0a7182587ba97102b4cd8df7b4f665f45d7ca36f19783f5f081ea114ea  wsaccel-0.6.6.tar.gz
+md5  e710fa8736ce37e4269e711d0aeec4a7  wsaccel-0.6.7.tar.gz
+sha256  aea79ba46b1a3792dbd1fe364aeb8a10128659c67057770c5c320d1f58588a8c  wsaccel-0.6.7.tar.gz
 # Locally computed sha256 checksums
 sha256  b6982974cb838b985b54b663d1780d280735086249c2e28015f25dd455df25da  LICENSE
diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
index 7ccb033256..0f942bb5e4 100644
--- a/package/python-wsaccel/python-wsaccel.mk
+++ b/package/python-wsaccel/python-wsaccel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WSACCEL_VERSION = 0.6.6
+PYTHON_WSACCEL_VERSION = 0.6.7
 PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
-PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/94/28/41c0e711b538f6031a247ab4ec5352267f12ed416e3a638b8d55fc33f609
+PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/8b/06/e8f0450952ed1fb4aa2033a30ae5afb59632f5a35d441bcc6801a3aaca47
 PYTHON_WSACCEL_LICENSE = Apache-2.0
 PYTHON_WSACCEL_LICENSE_FILES = LICENSE
 PYTHON_WSACCEL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
