Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8416C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A3F660B42;
	Thu, 28 Apr 2022 21:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5UrX72obHfj; Thu, 28 Apr 2022 21:38:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 919C760BA9;
	Thu, 28 Apr 2022 21:38:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C97461C1189
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8B4383F25
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXcSf08-EYAD for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:38:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED62083EF0
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:38:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C8C16846EA; Thu, 28 Apr 2022 21:27:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 23:36:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cb49dee480f23cc2eb2169bcda62cb84b7673ab
X-Git-Newrev: 2b985fb8a0ddeb2e3c8351bd7c1a5a5326ac6dfd
X-Patchwork-Hint: ignore
Message-Id: <20220428212755.C8C16846EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autobahn: bump to version
 22.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b985fb8a0ddeb2e3c8351bd7c1a5a5326ac6dfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 7b963df635..cc68f822a3 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  9b0ae4ff164232c952ba01ab3516188e  autobahn-22.1.1.tar.gz
-sha256  17e1b58b6ae1a63ca7d926b1d71bb9e4fd6b9ac9a1a2277d8ee40e0b61f54746  autobahn-22.1.1.tar.gz
+md5  b0b5e10bfea95f32900708be705efcf0  autobahn-22.3.2.tar.gz
+sha256  58a887c7a196bb08d8b6624cb3695f493a9e5c9f00fd350d8d6f829b47ff9036  autobahn-22.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index df43e9cdf2..37256ec8f6 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 22.1.1
+PYTHON_AUTOBAHN_VERSION = 22.3.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/0e/2a/0b627ad4adf70437b5753462958b3ba5c6802d7664eb4a680e46423659ba
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/e9/a7/4dea20063b78eb50a54182494ae634cffc0ed6208bf775771f374a9fb8bc
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
