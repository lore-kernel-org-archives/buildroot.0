Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB29C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D41D703ED;
	Fri, 28 Feb 2025 16:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tHwQn-Q8cQb; Fri, 28 Feb 2025 16:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D4B4706C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D4B4706C4;
	Fri, 28 Feb 2025 16:57:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 127BE68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78D5642F60
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2skDjAW6k3oS for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE27B42D33
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE27B42D33
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B85C383ACF; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jan 2025 16:48:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7ad307aa1ca4deb6b73fb82637751ddcc1d2b3a0
X-Git-Newrev: 4ff3fcec5485646924bcf4d1abd3a42e35ee2c49
X-Patchwork-Hint: ignore
Message-Id: <20250228163008.B85C383ACF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-wheel: bump to
 version 0.45.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ff3fcec5485646924bcf4d1abd3a42e35ee2c49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-wheel/python-wheel.hash | 4 ++--
 package/python-wheel/python-wheel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
index 35bee60b72..40836a5d1c 100644
--- a/package/python-wheel/python-wheel.hash
+++ b/package/python-wheel/python-wheel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wheel/json
-md5  3d1f79ff04a1252fa709dec58aa7249b  wheel-0.45.0.tar.gz
-sha256  a57353941a3183b3d5365346b567a260a0602a0f8a635926a7dede41b94c674a  wheel-0.45.0.tar.gz
+md5  dddc505d0573d03576c7c6c5a4fe0641  wheel-0.45.1.tar.gz
+sha256  661e1abd9198507b1409a20c02106d9670b2576e916d58f520316666abca6729  wheel-0.45.1.tar.gz
 # Locally computed sha256 checksums
 sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index 21060cfc66..417db7c167 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WHEEL_VERSION = 0.45.0
+PYTHON_WHEEL_VERSION = 0.45.1
 PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
-PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/e7/52/fd4516fb8f7d11a08e3f9cd69eb1558f098ab67e79f32d920c4974ee550f
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/8a/98/2d9906746cdc6a6ef809ae6338005b3f21bb568bea3165cfc6a243fdc25c
 PYTHON_WHEEL_SETUP_TYPE = flit
 PYTHON_WHEEL_LICENSE = MIT
 PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
