Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7A2D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C509541576;
	Wed,  7 Jan 2026 18:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MeP6YhunKm2m; Wed,  7 Jan 2026 18:03:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB1C541588
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808986;
	bh=EeyS9Dlzf3qnCGmw9nHTB0eZQ7zE9tfCYoKs5ecPQFI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R4hg+K/aCVDxDF27kBTnMKG4IZal2SUvIT/VLDrCDUzlcFGDJZLVEoQ76cEvBoZV3
	 U3OCrtjorhK6ywiW/xxPIGUAEEGu7OiWu/g1VYti23hJfYgwQmzpqose7zKjSTCWI4
	 EpW2nbaYpm/mZunwb1SybfKJIhFbnWzgrAICVIUEI9Avn3e9knAq3ThxwQLOvl0rMe
	 MScCSJfMKbpe2GKkEXrlLv2vDL3YwPSmNJ+eC1P1EEVKCrItKzcbJ26l0LYObsLr+L
	 BCrlxRop/BIeZkpMWIlIhzfxtEPuzzihC/928wNCPPzAEr/TYpFFezxnWq1a0iwZay
	 RpjFNmf1ZCbSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB1C541588;
	Wed,  7 Jan 2026 18:03:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CA90A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D816840B4B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxrQOgCO6pkY for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AECD140B84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AECD140B84
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADD89811C5; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:59:57 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 562e7fb5d27be538405db90e6be02698a62e2927
X-Git-Newrev: 027b6edc67d10cd501cb7b5b04e0813780b836e4
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.ADD89811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-libconf:
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

commit: https://git.buildroot.net/buildroot/commit/?id=027b6edc67d10cd501cb7b5b04e0813780b836e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5d76be1c041938acee9650cbb777f3880865f629)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-libconf/python-libconf.hash | 5 +++--
 package/python-libconf/python-libconf.mk   | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-libconf/python-libconf.hash b/package/python-libconf/python-libconf.hash
index d05efd37fd..40dfeadac6 100644
--- a/package/python-libconf/python-libconf.hash
+++ b/package/python-libconf/python-libconf.hash
@@ -1,4 +1,5 @@
-# Locally calculated
-sha256  66897870fcafce05624eafcc99e2dc8e150124e91019d9c29cc4f3bef64311dd  python-libconf-2.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/libconf/json
+md5  e212611cbf6a696e05742a983b3a0c57  libconf-2.0.1.tar.gz
+sha256  2f907258953ba60a95a82d5633726b47c81f2d5cf8d8801b092579016d757f4a  libconf-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3c2afc8c9f7a12032f225e6fa870e85af14d1b71236afe28d94a4b67e5e8c873  LICENSE
diff --git a/package/python-libconf/python-libconf.mk b/package/python-libconf/python-libconf.mk
index 65bdee8619..5bea1b2cc6 100644
--- a/package/python-libconf/python-libconf.mk
+++ b/package/python-libconf/python-libconf.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_LIBCONF_VERSION = 2.0.1
-PYTHON_LIBCONF_SITE = $(call github,ChrisAichinger,python-libconf,$(PYTHON_LIBCONF_VERSION))
+PYTHON_LIBCONF_SOURCE = libconf-$(PYTHON_LIBCONF_VERSION).tar.gz
+PYTHON_LIBCONF_SITE = https://files.pythonhosted.org/packages/c8/41/592c24b42ec6e349629f2b6310ff31255b213bc696c0e4ad2ee1d2bbb68e
 PYTHON_LIBCONF_SETUP_TYPE = setuptools
 PYTHON_LIBCONF_LICENSE = MIT
 PYTHON_LIBCONF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
