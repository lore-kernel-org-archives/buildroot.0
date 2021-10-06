Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7519FC433FE
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 12:55:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC70610CE
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 12:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EC70610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10D004016B;
	Wed,  6 Oct 2021 12:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1ryXHaD9NAw; Wed,  6 Oct 2021 12:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E2F740100;
	Wed,  6 Oct 2021 12:55:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C11981BF42C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 12:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE7F682741
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 12:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9HFS1fgQ_6DB for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 12:54:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07F29823E8
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 12:54:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1C61E9210A; Wed,  6 Oct 2021 12:51:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 13:37:49 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: c7626b5c3504ef6fcc01c07a341c1042fcf55c4d
X-Git-Newrev: e47117bdf8b8821f5179efb1e190171ff6a679d8
X-Patchwork-Hint: ignore
Message-Id: <20211006125133.1C61E9210A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/python-cffi: bump
 to version 1.14.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=e47117bdf8b8821f5179efb1e190171ff6a679d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 790c10d9f39c0729862e014fce2fec35707c1ee4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 37676f2664..8ab672a56f 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cffi/json
-md5	3cc2f1daf62dd66eda79b4d6281cebfc  cffi-1.14.2.tar.gz
-sha256	ae8f34d50af2c2154035984b8b5fc5d9ed63f32fe615646ab435b05b132ca91b  cffi-1.14.2.tar.gz
+md5  5c118a18ea897df164dbff67a32876fc  cffi-1.14.6.tar.gz
+sha256  c9a875ce9d7fe32887784274dd533c57909b7b1dcadcc128a2ac21331a9765dd  cffi-1.14.6.tar.gz
 # Locally computed sha256 checksums
 sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index f0b5b4560f..2504cf18f4 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-cffi/python3-cffi.mk
-PYTHON_CFFI_VERSION = 1.14.2
+PYTHON_CFFI_VERSION = 1.14.6
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/f7/09/88bbe20b76ca76be052c366fe77aa5e3cd6e5f932766e5597fecdd95b2a8
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/2e/92/87bb61538d7e60da8a7ec247dc048f7671afe17016cd0008b3b710012804
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
