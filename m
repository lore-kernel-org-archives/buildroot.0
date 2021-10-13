Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C07FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:01:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A7761165
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65A7761165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41D3740849;
	Wed, 13 Oct 2021 20:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H4w9vkPdyras; Wed, 13 Oct 2021 20:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 863044086C;
	Wed, 13 Oct 2021 20:01:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17C131BF9C2
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 187B440219
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOT1wSdC0EZG for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 20:00:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CACE4053F
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 20:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B3AAE95BC6; Wed, 13 Oct 2021 19:57:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 21:54:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb5031cee6041d0e19da93500608c1f3caa6871c
X-Git-Newrev: 05e963d777eff36e8225a6b357c660370c73c418
X-Patchwork-Hint: ignore
Message-Id: <20211013195727.B3AAE95BC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-serial-asyncio: bump to
 version 0.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=05e963d777eff36e8225a6b357c660370c73c418
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash change due to date update:
https://github.com/pyserial/pyserial-asyncio/commit/0fbea23c7b445e6bbb7491511b3064fd5793ca0a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-serial-asyncio/python-serial-asyncio.hash | 6 +++---
 package/python-serial-asyncio/python-serial-asyncio.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-serial-asyncio/python-serial-asyncio.hash b/package/python-serial-asyncio/python-serial-asyncio.hash
index f5d1d9e485..ccbdda89be 100644
--- a/package/python-serial-asyncio/python-serial-asyncio.hash
+++ b/package/python-serial-asyncio/python-serial-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyserial-asyncio/json
-md5  64d15bfb20982b2129b02070321f49f3  pyserial-asyncio-0.5.tar.gz
-sha256  1641e5433a866eeaf6464b3ab88b741e7a89dd8cd0f851b3343b15f425138d33  pyserial-asyncio-0.5.tar.gz
+md5  409f32a35a3b530e6b2224e2a5b367da  pyserial-asyncio-0.6.tar.gz
+sha256  b6032923e05e9d75ec17a5af9a98429c46d2839adfaf80604d52e0faacd7a32f  pyserial-asyncio-0.6.tar.gz
 # Locally computed sha256 checksums
-sha256  ebc84abdbdec7f9fa6962612c110123897db47b79529d5ae41191ef584b88f2c  LICENSE.txt
+sha256  64f3e548f0300d43c5af90b667150a9c57a4307c0f75fe741f76d0419905224a  LICENSE.txt
diff --git a/package/python-serial-asyncio/python-serial-asyncio.mk b/package/python-serial-asyncio/python-serial-asyncio.mk
index bc95f2c44a..6ee215a81c 100644
--- a/package/python-serial-asyncio/python-serial-asyncio.mk
+++ b/package/python-serial-asyncio/python-serial-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERIAL_ASYNCIO_VERSION = 0.5
+PYTHON_SERIAL_ASYNCIO_VERSION = 0.6
 PYTHON_SERIAL_ASYNCIO_SOURCE = pyserial-asyncio-$(PYTHON_SERIAL_ASYNCIO_VERSION).tar.gz
-PYTHON_SERIAL_ASYNCIO_SITE = https://files.pythonhosted.org/packages/e1/97/8dd1bf656796668ed4bd86058c815b130303a00a7b70cf79758e4918814a
+PYTHON_SERIAL_ASYNCIO_SITE = https://files.pythonhosted.org/packages/4a/9a/8477699dcbc1882ea51dcff4d3c25aa3f2063ed8f7d7a849fd8f610506b6
 PYTHON_SERIAL_ASYNCIO_LICENSE = BSD-3-Clause
 PYTHON_SERIAL_ASYNCIO_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_ASYNCIO_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
