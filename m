Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5331EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7413C41572;
	Thu,  6 Jul 2023 11:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7413C41572
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N53-g6lZnEP5; Thu,  6 Jul 2023 11:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94DEE40472;
	Thu,  6 Jul 2023 11:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94DEE40472
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBB211BF97D
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A360B82093
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A360B82093
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBFIRJI9v7ML for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D79AF8136D
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D79AF8136D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3791868F2; Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:46:53 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 214a6454c61392fa533f12d7dae3096d2fd56508
X-Git-Newrev: a3726f9b5ef8738080f3ae08315bf8044065a71d
X-Patchwork-Hint: ignore
Message-Id: <20230706115153.C3791868F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/fftw: bump
 version to 3.3.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3726f9b5ef8738080f3ae08315bf8044065a71d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Release notes: http://fftw.org/release-notes.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d521d6b756864b926f5eb98c111a8989347ee0e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fftw/fftw.hash | 6 +++---
 package/fftw/fftw.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fftw/fftw.hash b/package/fftw/fftw.hash
index b07aad8f18..9e7364d76c 100644
--- a/package/fftw/fftw.hash
+++ b/package/fftw/fftw.hash
@@ -1,5 +1,5 @@
-# From http://www.fftw.org/fftw-3.3.8.tar.gz.md5sum
-md5  8aac833c943d8e90d51b697b27d4384d  fftw-3.3.8.tar.gz
+# From http://fftw.org/fftw-3.3.10.tar.gz.md5sum
+md5  8ccbf6a5ea78a16dbc3e1306e234cc5c  fftw-3.3.10.tar.gz
 # Locally computed
-sha256  6113262f6e92c5bd474f2875fa1b01054c4ad5040f6b0da7c03c98821d9ae303  fftw-3.3.7.tar.gz
+sha256  56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467  fftw-3.3.10.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 279244a5dc..1bb537aeb8 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFTW_VERSION = 3.3.8
+FFTW_VERSION = 3.3.10
 FFTW_SITE = http://www.fftw.org
 FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
