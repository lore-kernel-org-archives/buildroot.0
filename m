Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2965AC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB27440BED;
	Thu,  3 Nov 2022 21:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB27440BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7vYK0LHuN_h; Thu,  3 Nov 2022 21:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5C8140C09;
	Thu,  3 Nov 2022 21:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5C8140C09
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 77C521BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2959B40BF9
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2959B40BF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zo9AhW0lSgbY for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC30540BFF
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC30540BFF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD23C87BCE; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b10a60e0b67ab839926b12e1be05d281d9f6a9b4
X-Git-Newrev: 0e6461c51f07e04cd42708843cf45583108f37ac
X-Patchwork-Hint: ignore
Message-Id: <20221103205512.BD23C87BCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-networkmanager:
 bump to version 2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e6461c51f07e04cd42708843cf45583108f37ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to date update:
https://github.com/seveas/python-networkmanager/commit/9acb5c9d90154a68ffadd144e9d72f1b56038649

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-networkmanager/python-networkmanager.hash | 10 +++++-----
 package/python-networkmanager/python-networkmanager.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-networkmanager/python-networkmanager.hash b/package/python-networkmanager/python-networkmanager.hash
index 105949d50e..d4e21f1d82 100644
--- a/package/python-networkmanager/python-networkmanager.hash
+++ b/package/python-networkmanager/python-networkmanager.hash
@@ -1,5 +1,5 @@
-# md5 and sha256 from https://pypi.python.org/pypi/python-networkmanager/json
-md5  f638d854a3639fb37c0e06d1092a771e  python-networkmanager-2.1.tar.gz
-sha256  aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc  python-networkmanager-2.1.tar.gz
-# Locally computed
-sha256  be40f44d54bb5e0f0eee28e957ad020a00a6e3adb0290262e92129eba1c044cf  COPYING
+# md5, sha256 from https://pypi.org/pypi/python-networkmanager/json
+md5  7e05d3ca40a4fa50222ba93cda3d0d02  python-networkmanager-2.2.tar.gz
+sha256  de6eb921d94aba7549f428ed2b3aa482a5d543ecb6965cbaa0fbb555ab31b9d5  python-networkmanager-2.2.tar.gz
+# Locally computed sha256 checksums
+sha256  d12bbc105c723d4471b39fe8197d43df822e5b4bda822a8255719d039e701f49  COPYING
diff --git a/package/python-networkmanager/python-networkmanager.mk b/package/python-networkmanager/python-networkmanager.mk
index de893f757a..785d2c0d3e 100644
--- a/package/python-networkmanager/python-networkmanager.mk
+++ b/package/python-networkmanager/python-networkmanager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_NETWORKMANAGER_VERSION = 2.1
-PYTHON_NETWORKMANAGER_SITE = https://files.pythonhosted.org/packages/73/ec/2cc46290cedc99f59df3633d428dfa91d95946ca49af96fdb53514ee195f
+PYTHON_NETWORKMANAGER_VERSION = 2.2
+PYTHON_NETWORKMANAGER_SITE = https://files.pythonhosted.org/packages/f2/3d/0924d03117636b80a88af783f857fb101e4c47953a8bb0f733b964d50af4
 PYTHON_NETWORKMANAGER_SETUP_TYPE = setuptools
 PYTHON_NETWORKMANAGER_LICENSE = Zlib
 PYTHON_NETWORKMANAGER_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
