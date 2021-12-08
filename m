Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4F8C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 08:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F71C80B6E;
	Wed,  8 Dec 2021 08:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_tEQKZ1D9Xm; Wed,  8 Dec 2021 08:42:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62D2F84C11;
	Wed,  8 Dec 2021 08:42:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 488891BF365
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A01FE400EB
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k6NqMwWsWW6G for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 08:39:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53FB14016F
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 08:39:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 34ECD81839; Wed,  8 Dec 2021 08:34:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Dec 2021 09:35:40 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 1cc84a71cc00331708fd6fc11694f2b64d955345
X-Git-Newrev: 7271242a5e4eb83efa7fef242d48d787816448a3
X-Patchwork-Hint: ignore
Message-Id: <20211208083455.34ECD81839@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/hackrf: replace
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

commit: https://git.buildroot.net/buildroot/commit/?id=7271242a5e4eb83efa7fef242d48d787816448a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
