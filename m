Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25702C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:00:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1B8460F39
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1B8460F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7533640305;
	Sun, 26 Sep 2021 21:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvzVOdEmHYq4; Sun, 26 Sep 2021 21:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD2F7402F2;
	Sun, 26 Sep 2021 21:00:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3054F1BF95D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F2684038C
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xLDP92BGOdPo for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 302C1401AE
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9E5018D2AD; Sun, 26 Sep 2021 20:57:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 22:16:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1677b8e96337d66f63cb77bcfbc7c5824a67bd6
X-Git-Newrev: 85fb0f304fe816ad389a90a925950cbe629d5745
X-Patchwork-Hint: ignore
Message-Id: <20210926205756.9E5018D2AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-argon2-cffi: bump to
 version 21.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=85fb0f304fe816ad389a90a925950cbe629d5745
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-argon2-cffi/python-argon2-cffi.hash | 6 +++---
 package/python-argon2-cffi/python-argon2-cffi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-argon2-cffi/python-argon2-cffi.hash b/package/python-argon2-cffi/python-argon2-cffi.hash
index 730a9b6c44..6c416ffd88 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.hash
+++ b/package/python-argon2-cffi/python-argon2-cffi.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/argon2_cffi/json
-md5  e49ccb29351387fd853f31bf19b67f59  argon2-cffi-20.1.0.tar.gz
-sha256  d8029b2d3e4b4cea770e9e5a0104dd8fa185c1724a0f01528ae4826a6d25f97d  argon2-cffi-20.1.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/argon2-cffi/json
+md5  f33bc18f2c2438f685ba1f0bbd2b86a4  argon2-cffi-21.1.0.tar.gz
+sha256  f710b61103d1a1f692ca3ecbd1373e28aa5e545ac625ba067ff2feca1b2bb870  argon2-cffi-21.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
index 674e089eb7..f01c940589 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.mk
+++ b/package/python-argon2-cffi/python-argon2-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGON2_CFFI_VERSION = 20.1.0
+PYTHON_ARGON2_CFFI_VERSION = 21.1.0
 PYTHON_ARGON2_CFFI_SOURCE = argon2-cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
-PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/74/fd/d78e003a79c453e8454197092fce9d1c6099445b7e7da0b04eb4fe1dbab7
+PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/7b/39/a26aaef5c3f0c6cfd67c80599b5b40a794fdab46f4ee3be925d71e2f9596
 PYTHON_ARGON2_CFFI_SETUP_TYPE = setuptools
 PYTHON_ARGON2_CFFI_LICENSE = MIT
 PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
