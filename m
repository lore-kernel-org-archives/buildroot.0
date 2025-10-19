Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123B3CCD1A2
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 19:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D78284136D;
	Sun, 19 Oct 2025 19:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emGgZg7zDubE; Sun, 19 Oct 2025 19:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB4FE4136A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB4FE4136A;
	Sun, 19 Oct 2025 19:31:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C42F43F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A43C28402D
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-k1au5Jj-El for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 19:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBFFF8402F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBFFF8402F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:31:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C94E38182E; Sun, 19 Oct 2025 19:31:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 21:27:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 283821fc31c4890f141111cbc5994e36703c91eb
X-Git-Newrev: 52101ad09260c1874065b165167424794815ad14
X-Patchwork-Hint: ignore
Message-Id: <20251019193102.C94E38182E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jitterentropy-library: bump to
 version 3.6.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=52101ad09260c1874065b165167424794815ad14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/smuellerDD/jitterentropy-library/releases/tag/v3.6.2
https://github.com/smuellerDD/jitterentropy-library/releases/tag/v3.6.3

Update file hash due to update license dates:
https://github.com/smuellerDD/jitterentropy-library/commit/92d3c68cea4b82f229a2407cfe45303fcb62c05d

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jitterentropy-library/jitterentropy-library.hash | 4 ++--
 package/jitterentropy-library/jitterentropy-library.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jitterentropy-library/jitterentropy-library.hash b/package/jitterentropy-library/jitterentropy-library.hash
index feb15f0fca..91ce4d98fc 100644
--- a/package/jitterentropy-library/jitterentropy-library.hash
+++ b/package/jitterentropy-library/jitterentropy-library.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  ddd23429cb6bdabbfeafd2b6aaabfbf1959dd7288887334dfec5ff099a2e9f3e  jitterentropy-library-3.6.1.tar.xz
-sha256  adbfea86223ce2c1f410353054fbbe8d7936dd900ff0d373301c959300c2214c  LICENSE
+sha256  9dd50f94387efadd05a10f25f3224fb959b125cb8e9c188356a74944034f0ee5  jitterentropy-library-3.6.3.tar.xz
+sha256  088d208b9d22530691f1e9406a85dd7f6f5a42e3cf23d3d6df6582408e3840f7  LICENSE
 sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  LICENSE.bsd
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  LICENSE.gplv2
diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index 28a0f7da61..f1ef36d3b3 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JITTERENTROPY_LIBRARY_VERSION = 3.6.1
+JITTERENTROPY_LIBRARY_VERSION = 3.6.3
 JITTERENTROPY_LIBRARY_SOURCE = \
 	jitterentropy-library-$(JITTERENTROPY_LIBRARY_VERSION).tar.xz
 JITTERENTROPY_LIBRARY_SITE = http://www.chronox.de/jent/releases/$(JITTERENTROPY_LIBRARY_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
