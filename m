Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DEBC54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FE2841933;
	Thu, 29 Feb 2024 15:53:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nzg8-MdfIFOF; Thu, 29 Feb 2024 15:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0C7C41C01
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0C7C41C01;
	Thu, 29 Feb 2024 15:53:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A66E91BF25B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4426040205
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wmdgZPeyEVgK for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83F07405B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83F07405B0
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7142C87DAE; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:40:17 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 489015b033db39133a82610d723a1980ba6593af
X-Git-Newrev: 56a3517ba139380cd611c40ca1bd498dbae8f260
X-Patchwork-Hint: ignore
Message-Id: <20240229154802.7142C87DAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/wlroots: update
 patch with upstream status
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

commit: https://git.buildroot.net/buildroot/commit/?id=56a3517ba139380cd611c40ca1bd498dbae8f260
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch has been
rejected upstream, and the initial pull request was moved to the
freedesktop gitlab. Update the patch to reflect these changes.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 840849afff07f91668f88570c5055eaf6687deb2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                            | 1 -
 package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 94b24b2545..44ba7494d4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1440,7 +1440,6 @@ package/wilc-driver/0005-Fix-cast-warnings.patch Upstream
 package/wipe/0001-musl.patch Upstream
 package/wireless_tools/0001-remove-bzero.patch Upstream
 package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch Upstream
-package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch Upstream
 package/woff2/0001-CMake-Handle-multiple-libraries-being-returned-for-B.patch Upstream
 package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch Upstream
 package/wpa_supplicant/ifupdown.sh Shellcheck
diff --git a/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch b/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
index 0ba078708a..0e1ae9d87a 100644
--- a/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
+++ b/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
@@ -5,8 +5,10 @@ Subject: [PATCH] Add feature macros to more C files
 
 These source files use "struct timespec", which is POSIX 1993.09.
 
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+Upstream: Rejected (Upstream does not want these workarounds)
+see: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/2493
 
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
 [Retrieved from: https://github.com/swaywm/wlroots/pull/2493]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
