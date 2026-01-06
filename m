Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16D1D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A4F982238;
	Wed,  7 Jan 2026 17:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E--fKiBHzM90; Wed,  7 Jan 2026 17:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA31080E59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808093;
	bh=CsjX6BLzczO0eBKlIqXvb4XRaoqhFXmkiqSOZp9OA1g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=piUy7HL7gr4HhIf5y8A06lfqq1WmozGQYBfcD0GcF2FxYS4S7kvxk0ssHg9zGxMo7
	 nw+UB6AUqRJHkvULk0wnn/hhmz2+RXStN3JODHfVmUnKD9SO/tMAmejCLSVnqRKCak
	 TWvlbPmLX5HoGUbfd7u4NU0lfaJxD+BmDlpbrOVk/ERWS49Dg6eUOTcmUG5W05dqEu
	 rkqCP2dfUR0xi5ME2T9xTctu/NyiwkRJdvRQSPsZiaZZzll4Clf5vyBWztFVG0PI+W
	 6CD3AAfSgi9+nJQGKVlzm42LPSXOTDJYg9MLEJUdSGX6cYRyo2S+dNPF9zKkNXS6LI
	 x0bDMMuF4kiUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA31080E59;
	Wed,  7 Jan 2026 17:48:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D84E25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACEB880BA4
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5E92xK0rXHE for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C613580C79
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C613580C79
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C50898225F; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: faa0b0d3883f4c9df69f4b3de50fb4a8568b477e
X-Git-Newrev: f805100bb4fc981282b9c94155e173a999110139
X-Patchwork-Hint: ignore
Message-Id: <20260107174643.C50898225F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pyinotify:
 update tarball URL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f805100bb4fc981282b9c94155e173a999110139
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d2fbbecf94d02a9ebb284b60bd243e0f9452c0e8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pyinotify/python-pyinotify.hash | 6 ++++--
 package/python-pyinotify/python-pyinotify.mk   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-pyinotify/python-pyinotify.hash b/package/python-pyinotify/python-pyinotify.hash
index 72095ff6e5..9eecfbf9be 100644
--- a/package/python-pyinotify/python-pyinotify.hash
+++ b/package/python-pyinotify/python-pyinotify.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256  7943f198c5cef2bdc121d847937fbe565daaa7d4daaf1b8de8ef5689812f481c  python-pyinotify-0.9.6.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyinotify/json
+md5  8e580fa1ff3971f94a6f81672b76c406  pyinotify-0.9.6.tar.gz
+sha256  9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4  pyinotify-0.9.6.tar.gz
+# Locally computed sha256 checksums
 sha256  97c96d577f761e23c7778bda2b163dba7b94e4defdd7873b7155bed252820608  COPYING
diff --git a/package/python-pyinotify/python-pyinotify.mk b/package/python-pyinotify/python-pyinotify.mk
index b4ea66299d..61666e8b49 100644
--- a/package/python-pyinotify/python-pyinotify.mk
+++ b/package/python-pyinotify/python-pyinotify.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_PYINOTIFY_VERSION = 0.9.6
-PYTHON_PYINOTIFY_SITE = $(call github,seb-m,pyinotify,$(PYTHON_PYINOTIFY_VERSION))
+PYTHON_PYINOTIFY_SOURCE = pyinotify-$(PYTHON_PYINOTIFY_VERSION).tar.gz
+PYTHON_PYINOTIFY_SITE = https://files.pythonhosted.org/packages/e3/c0/fd5b18dde17c1249658521f69598f3252f11d9d7a980c5be8619970646e1
 PYTHON_PYINOTIFY_SETUP_TYPE = setuptools
 PYTHON_PYINOTIFY_LICENSE = MIT
 PYTHON_PYINOTIFY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
