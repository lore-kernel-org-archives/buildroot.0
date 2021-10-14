Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC81C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:42:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FF4E6105A
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FF4E6105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 216E940371;
	Thu, 14 Oct 2021 21:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Dic7OyZv_Tm; Thu, 14 Oct 2021 21:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5468A4012D;
	Thu, 14 Oct 2021 21:42:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9D271BF9B9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3CAF83231
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnkqflizUb5x for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A1A181AEF
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C812994EB7; Thu, 14 Oct 2021 21:39:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:12:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33ece2446e25e20929d1c7eefa9f3244a3b79a92
X-Git-Newrev: 16bae982b0bedf776d9f5b7b47469eac1ec039bf
X-Patchwork-Hint: ignore
Message-Id: <20211014213946.C812994EB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-git: bump to version 3.1.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=16bae982b0bedf776d9f5b7b47469eac1ec039bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-git/python-git.hash | 2 +-
 package/python-git/python-git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-git/python-git.hash b/package/python-git/python-git.hash
index db3d743857..0c8c764bf3 100644
--- a/package/python-git/python-git.hash
+++ b/package/python-git/python-git.hash
@@ -1,3 +1,3 @@
 # locally computed hashes
-sha256  78baf9fc223536e38a6e0d9241536fedaecf79bc000b3a05962257d83571fc5d  python-git-3.1.20.tar.gz
+sha256  8282d0d1169a3a98546979bfae1524608670fadc4ca7636517aadd428e0cfbeb  python-git-3.1.24.tar.gz
 sha256  fd657ffc2cef63d25c78cab7808d414dd03a282e63893491fd11c32f98be67fb  LICENSE
diff --git a/package/python-git/python-git.mk b/package/python-git/python-git.mk
index 0e158434fd..9b2771ca07 100644
--- a/package/python-git/python-git.mk
+++ b/package/python-git/python-git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_GIT_VERSION = 3.1.20
+PYTHON_GIT_VERSION = 3.1.24
 PYTHON_GIT_SITE = $(call github,gitpython-developers,GitPython,$(PYTHON_GIT_VERSION))
 PYTHON_GIT_LICENSE = BSD-3-Clause
 PYTHON_GIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
