Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F259CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 08:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B930A60F2C;
	Wed,  8 Dec 2021 08:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RhLUv4EpKX0Y; Wed,  8 Dec 2021 08:40:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB1160F25;
	Wed,  8 Dec 2021 08:40:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9E2A1BF365
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8BA683F57
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PJd27iLL9vp for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 08:39:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD0B480C2A
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 08:39:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9715981D5C; Wed,  8 Dec 2021 08:34:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Dec 2021 09:35:32 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: fb5dd8b26d22834c50a3a374fbd3ec24b25763e9
X-Git-Newrev: 9c6ba5bd2198fd349d22eb23abe5409247d22f61
X-Patchwork-Hint: ignore
Message-Id: <20211208083448.9715981D5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/hackrf: replace
 BSD-3c by BSD-3-Clause
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c6ba5bd2198fd349d22eb23abe5409247d22f61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9f41dfe7877ce3d19cc848e5f4852f1acc2c0798)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hackrf/hackrf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index b83f6518e8..391bddcdb0 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -7,7 +7,7 @@
 HACKRF_VERSION = 2018.01.1
 HACKRF_SITE = https://github.com/mossmann/hackrf/releases/download/v$(HACKRF_VERSION)
 HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
-HACKRF_LICENSE = GPL-2.0+ BSD-3c
+HACKRF_LICENSE = GPL-2.0+ BSD-3-Clause
 HACKRF_LICENSE_FILES = COPYING
 HACKRF_DEPENDENCIES = fftw-single libusb
 HACKRF_SUBDIR = host
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
