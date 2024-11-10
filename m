Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DEDD12D4B
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 16:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05B4760639;
	Sun, 10 Nov 2024 16:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ce1Y_8-IGR_Z; Sun, 10 Nov 2024 16:46:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 009AA6064D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 009AA6064D;
	Sun, 10 Nov 2024 16:46:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F8AEE0A
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E557160655
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKaQMe-IcrL2 for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 16:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B16960639
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B16960639
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:46:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83A4285F7B; Sun, 10 Nov 2024 16:46:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Nov 2024 17:43:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1b6cb619216897a6819d9743d231bac4a46e39e
X-Git-Newrev: b1becf0cc4bcbae4c847c2b276b4feb163bab8bc
X-Patchwork-Hint: ignore
Message-Id: <20241110164617.83A4285F7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-blinker: bump to version
 1.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1becf0cc4bcbae4c847c2b276b4feb163bab8bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-blinker/python-blinker.hash | 4 ++--
 package/python-blinker/python-blinker.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-blinker/python-blinker.hash b/package/python-blinker/python-blinker.hash
index d9f1052254..7039c1a3bc 100644
--- a/package/python-blinker/python-blinker.hash
+++ b/package/python-blinker/python-blinker.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/blinker/json
-md5  ce2f9fb3bc0c0000db11f012f5f5afda  blinker-1.8.2.tar.gz
-sha256  8f77b09d3bf7c795e969e9486f39c2c5e9c39d4ee07424be2bc594ece9642d83  blinker-1.8.2.tar.gz
+md5  1ffce54aca3d568ab18ee921d479274f  blinker-1.9.0.tar.gz
+sha256  b4ce2265a7abece45e7cc896e98dbebe6cead56bcf805a3d23136d145f5445bf  blinker-1.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9eb73a1f38597a4aa17025d2ae1be3839624c795e985d4f0e9769ce29faca467  LICENSE.txt
diff --git a/package/python-blinker/python-blinker.mk b/package/python-blinker/python-blinker.mk
index 7ce06c2177..a5949e117b 100644
--- a/package/python-blinker/python-blinker.mk
+++ b/package/python-blinker/python-blinker.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLINKER_VERSION = 1.8.2
+PYTHON_BLINKER_VERSION = 1.9.0
 PYTHON_BLINKER_SOURCE = blinker-$(PYTHON_BLINKER_VERSION).tar.gz
-PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/1e/57/a6a1721eff09598fb01f3c7cda070c1b6a0f12d63c83236edf79a440abcc
+PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/21/28/9b3f50ce0e048515135495f198351908d99540d69bfdc8c1d15b73dc55ce
 PYTHON_BLINKER_SETUP_TYPE = flit
 PYTHON_BLINKER_LICENSE = MIT
 PYTHON_BLINKER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
