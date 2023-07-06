Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B598EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5879414E9;
	Thu,  6 Jul 2023 11:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5879414E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id masyRR23RXuE; Thu,  6 Jul 2023 11:50:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E6A040139;
	Thu,  6 Jul 2023 11:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E6A040139
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC1EC1BF97D
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A346960B9A
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A346960B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 79KoXFxgiBRe for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:50:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD03A60B45
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD03A60B45
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA5A1868C9; Thu,  6 Jul 2023 11:50:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:46:48 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: dd653e4e6af1de9c47e711637e2f22ef01daf928
X-Git-Newrev: 94a381ed47fd536a3b383bd8433d16766c2b3195
X-Patchwork-Hint: ignore
Message-Id: <20230706115036.BA5A1868C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/fftw: bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=94a381ed47fd536a3b383bd8433d16766c2b3195
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
