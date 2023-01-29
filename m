Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C55C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 10:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F04A860709;
	Sun,  5 Feb 2023 10:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F04A860709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nrx6McCc-ADe; Sun,  5 Feb 2023 10:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 307726072A;
	Sun,  5 Feb 2023 10:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 307726072A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08F301BF869
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 10:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3B34417B9
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 10:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3B34417B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bio4zeGXaFFF for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 10:51:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE889417B8
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 10:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE889417B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C94B283733; Sun,  5 Feb 2023 10:51:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 22:50:56 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 00fbc1c7db58c44474c1d4afa5e528606ff93b36
X-Git-Newrev: 5f496bb8b96938c7c103e52e68bc81425d37f2f1
X-Patchwork-Hint: ignore
Message-Id: <20230205105119.C94B283733@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/wpewebkit:
 security bump to version 2.38.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f496bb8b96938c7c103e52e68bc81425d37f2f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Bugfix release, with security fixes for CVE-2022-42852, CVE-2022-42856,
CVE-2022-42867, CVE-2022-46691, CVE-2022-46692, CVE-2022-46698,
CVE-2022-46699, CVE-2022-46700, CVE-2022-42823, and CVE-2022-42799.

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.38.3.html
  https://wpewebkit.org/release/wpewebkit-2.38.2.html
  https://wpewebkit.org/release/wpewebkit-2.38.1.html

Accompanying security advisories:

  https://wpewebkit.org/security/WSA-2022-0011.html
  https://wpewebkit.org/security/WSA-2022-0010.html

Additionally, the update brings in important bug fixes for the
Bubblewrap sandbox support, scrolling in certain web sites, multimedia
playback, and build fixes.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d8bbc215f5b6c978e9506927675181bbda06567f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 5dd64b34b7..ccd928b3df 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.38.0.tar.xz.sums
-md5  e0e6b98c86351c39e41da475afc50780  wpewebkit-2.38.0.tar.xz
-sha1  66e6dd1c285a21ce50370fb4d60332838d801663  wpewebkit-2.38.0.tar.xz
-sha256  e653e12eca63e6371c06d4cd9efcd5492db67f7d9ef324fd5d8668b1151e72b2  wpewebkit-2.38.0.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.38.3.tar.xz.sums
+md5  60f79ff8dc68280f756963af23b67d6d  wpewebkit-2.38.3.tar.xz
+sha1  de15119a0dc29776d3a11fca1df4238b471f960f  wpewebkit-2.38.3.tar.xz
+sha256  1dd9075eec7253a1b0d038a73f92ddbb9174394e6a7527ec07b4464fa6290498  wpewebkit-2.38.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 001c701ee9..b2bbc0301b 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.38.0
+WPEWEBKIT_VERSION = 2.38.3
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
