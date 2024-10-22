Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4818BCDD0D8
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C8A640511;
	Tue, 22 Oct 2024 19:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBorghglzNpk; Tue, 22 Oct 2024 19:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6A2240448
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6A2240448;
	Tue, 22 Oct 2024 19:17:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7A84963
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7374E403A5
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U76szrsEfgnF for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D2B840219
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D2B840219
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B3AA81249; Tue, 22 Oct 2024 19:16:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 21:11:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21efb612a6970a1d861df5a8a95d1071ecabc396
X-Git-Newrev: 5ea294513b592c171b60d8bb688fa368d04d52f8
X-Patchwork-Hint: ignore
Message-Id: <20241022191654.0B3AA81249@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-simple-websocket: bump to
 version 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ea294513b592c171b60d8bb688fa368d04d52f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-simple-websocket/python-simple-websocket.hash | 4 ++--
 package/python-simple-websocket/python-simple-websocket.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-simple-websocket/python-simple-websocket.hash b/package/python-simple-websocket/python-simple-websocket.hash
index f6cf8457dc..2350f4d2c3 100644
--- a/package/python-simple-websocket/python-simple-websocket.hash
+++ b/package/python-simple-websocket/python-simple-websocket.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simple-websocket/json
-md5  e1dd8c3da6994555289611586c326dfe  simple-websocket-1.0.0.tar.gz
-sha256  17d2c72f4a2bd85174a97e3e4c88b01c40c3f81b7b648b0cc3ce1305968928c8  simple-websocket-1.0.0.tar.gz
+md5  2c5f6f6bad380676db0eb7e2c4070454  simple_websocket-1.1.0.tar.gz
+sha256  7939234e7aa067c534abdab3a9ed933ec9ce4691b0713c78acb195560aa52ae4  simple_websocket-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4b8abadcc5e3dd29c71905b84952945699f0a7ba41e6af99eaba46faabe95bb7  LICENSE
diff --git a/package/python-simple-websocket/python-simple-websocket.mk b/package/python-simple-websocket/python-simple-websocket.mk
index 1fdf7f8763..a77d9a66f6 100644
--- a/package/python-simple-websocket/python-simple-websocket.mk
+++ b/package/python-simple-websocket/python-simple-websocket.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLE_WEBSOCKET_VERSION = 1.0.0
-PYTHON_SIMPLE_WEBSOCKET_SOURCE = simple-websocket-$(PYTHON_SIMPLE_WEBSOCKET_VERSION).tar.gz
-PYTHON_SIMPLE_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/d3/82/3cf87d317911864a2f2a8daf1779fc7f82d5d55e6a8aaa0315f8209047a7
+PYTHON_SIMPLE_WEBSOCKET_VERSION = 1.1.0
+PYTHON_SIMPLE_WEBSOCKET_SOURCE = simple_websocket-$(PYTHON_SIMPLE_WEBSOCKET_VERSION).tar.gz
+PYTHON_SIMPLE_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/b0/d4/bfa032f961103eba93de583b161f0e6a5b63cebb8f2c7d0c6e6efe1e3d2e
 PYTHON_SIMPLE_WEBSOCKET_SETUP_TYPE = setuptools
 PYTHON_SIMPLE_WEBSOCKET_LICENSE = MIT
 PYTHON_SIMPLE_WEBSOCKET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
