Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B501FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 21:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65A2D8203B;
	Wed,  8 Nov 2023 21:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65A2D8203B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GroO6b941nJ5; Wed,  8 Nov 2023 21:12:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8130A82030;
	Wed,  8 Nov 2023 21:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8130A82030
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E71BC1BF4DD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA7E04013B
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA7E04013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5nWUgez4gVDj for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 21:10:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DF8940280
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 21:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DF8940280
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C2C786D63; Wed,  8 Nov 2023 21:10:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 21:57:35 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 74ce71582954e8c384498ae0af177604e67020d1
X-Git-Newrev: 311ef9526fe7c8240b914cf922e4dfd990e49ab9
X-Patchwork-Hint: ignore
Message-Id: <20231108211053.7C2C786D63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libgdiplus: add
 upstream link to patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=311ef9526fe7c8240b914cf922e4dfd990e49ab9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 200b264b7a12c582a5d200d02fec8d9babd79651)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                                      | 1 -
 .../0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2038b2b3e9..4a183a445c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -690,7 +690,6 @@ package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
 package/libfuse/0001-fix-aarch64-build.patch Upstream
 package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch Upstream
 package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch Upstream
-package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch Upstream
 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch Upstream
 package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch Upstream
 package/libgpgme/0001-Fix-build-without-threads.patch Upstream
diff --git a/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch b/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
index 450286462e..33746872ac 100644
--- a/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
+++ b/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
@@ -10,6 +10,7 @@ So let's disable the build of unit tests by default and introduce
 --enable-unit-tests configure option to enable it.
 
 Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+Upstream: https://github.com/mono/libgdiplus/pull/701
 ---
  Makefile.am  | 8 ++++++--
  configure.ac | 4 ++++
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
