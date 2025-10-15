Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5F4CCD190
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 07:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E6641403;
	Wed, 15 Oct 2025 07:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9T8-TvgZeY2; Wed, 15 Oct 2025 07:17:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F266415FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F266415FE;
	Wed, 15 Oct 2025 07:17:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2D9D1BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D489F41452
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMLHsW5hBkvf for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 07:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB05D40856
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB05D40856
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:16:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB5D4870FF; Wed, 15 Oct 2025 07:16:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 08:12:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8cc0d0927778851c84ed59ee4a56355d39b0c31
X-Git-Newrev: eaba33f749022af41cd5d74bf0e00f116675251d
X-Patchwork-Hint: ignore
Message-Id: <20251015071659.BB5D4870FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-websocket-client: bump
 version to 1.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=eaba33f749022af41cd5d74bf0e00f116675251d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to copyright year bump:
https://github.com/websocket-client/websocket-client/commit/e46a8fe2dbc74f88a2cfa749f2499f7cc6f31409

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-websocket-client/python-websocket-client.hash | 6 +++---
 package/python-websocket-client/python-websocket-client.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-websocket-client/python-websocket-client.hash b/package/python-websocket-client/python-websocket-client.hash
index 373906c3dc..a966a7e441 100644
--- a/package/python-websocket-client/python-websocket-client.hash
+++ b/package/python-websocket-client/python-websocket-client.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websocket-client/json
-md5  9cffbda9eefb0a17e9c4cda3b7884493  websocket_client-1.8.0.tar.gz
-sha256  3239df9f44da632f96012472805d40a23281a991027ce11d2f45a6f24ac4c3da  websocket_client-1.8.0.tar.gz
+md5  3e6fd932858e9123d6ef5161e9ce7c46  websocket_client-1.9.0.tar.gz
+sha256  9e813624b6eb619999a97dc7958469217c3176312b3a16a4bd1bc7e08a46ec98  websocket_client-1.9.0.tar.gz
 # Locally computed sha256 checksums
-sha256  453e6a69427ed9ff92a03ef2d7b21ef1db41fdf56d62307a49ba85059f7a0c62  LICENSE
+sha256  d7ad8d0966aa363d45c7b16b0838cadcd51676acdf215ad967307d581b47872c  LICENSE
diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
index ce582e89b7..f735782cf8 100644
--- a/package/python-websocket-client/python-websocket-client.mk
+++ b/package/python-websocket-client/python-websocket-client.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKET_CLIENT_VERSION = 1.8.0
+PYTHON_WEBSOCKET_CLIENT_VERSION = 1.9.0
 PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket_client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
-PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/e6/30/fba0d96b4b5fbf5948ed3f4681f7da2f9f64512e1d303f94b4cc174c24a5
+PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/2c/41/aa4bf9664e4cda14c3b39865b12251e8e7d239f4cd0e3cc1b6c2ccde25c1
 PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKET_CLIENT_LICENSE = Apache-2.0
 PYTHON_WEBSOCKET_CLIENT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
