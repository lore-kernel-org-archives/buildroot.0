Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549EFC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 16:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F2F860EC6;
	Sat,  4 Nov 2023 16:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F2F860EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MSewtYNvivAN; Sat,  4 Nov 2023 16:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 079AD60AB3;
	Sat,  4 Nov 2023 16:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 079AD60AB3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85E711BF2C5
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DEEC400AF
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DEEC400AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTK3y2gpPJIW for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 16:48:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E588A40025
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 16:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E588A40025
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C763886679; Sat,  4 Nov 2023 16:48:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 17:46:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a000ac3c832e929a441f69c6e503ad8282ed4fb7
X-Git-Newrev: 200b264b7a12c582a5d200d02fec8d9babd79651
X-Patchwork-Hint: ignore
Message-Id: <20231104164829.C763886679@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgdiplus: add upstream link to
 patch
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=200b264b7a12c582a5d200d02fec8d9babd79651
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                                      | 1 -
 .../0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 52a6aaf797..9417bdb542 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -662,7 +662,6 @@ package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
 package/libfuse/0001-fix-aarch64-build.patch Upstream
 package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch Upstream
 package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch Upstream
-package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch Upstream
 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch Upstream
 package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch Upstream
 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch Upstream
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
