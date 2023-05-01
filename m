Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C59C77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 07:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33EC782117;
	Mon,  1 May 2023 07:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33EC782117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UlPd8g7-q7Bu; Mon,  1 May 2023 07:37:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A5B08210E;
	Mon,  1 May 2023 07:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A5B08210E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66D601BF859
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4145560ACE
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4145560ACE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BAoV4yFWEWho for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 07:36:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61B9D606F2
 for <buildroot@buildroot.org>; Mon,  1 May 2023 07:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61B9D606F2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 507EA84707; Mon,  1 May 2023 07:36:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 09:33:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9c6684fa37f20d48645868a1e15bb831ca1ba85
X-Git-Newrev: d6b871e137f758466b0c24d1551144e8a4ef8822
X-Patchwork-Hint: ignore
Message-Id: <20230501073635.507EA84707@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: security bump to
 version 2.38.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6b871e137f758466b0c24d1551144e8a4ef8822
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release with many security fixes, including (but not limited to)
patches for CVE-2023-25358, CVE-2022-0108, CVE-2022-32885,
CVE-2023-27932, CVE-2023-27954, and CVE-2023-28205.

Release notes:

  https://webkitgtk.org/2023/04/20/webkitgtk2.38.6-released.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2023-0003.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index c771297b5a..3bc521e445 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.38.5.tar.xz.sums
-md5  de05d314a3ecb5fb3835e4d84f8f466d  webkitgtk-2.38.5.tar.xz
-sha1  1774390c628bb3a524d4ed76f11de4a878078db6  webkitgtk-2.38.5.tar.xz
-sha256  40c20c43022274df5893f22b1054fa894c3eea057389bb08aee08c5b0bb0c1a7  webkitgtk-2.38.5.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.38.6.tar.xz.sums
+md5  a50290fdc80842b1ae8be1e1147b5679  webkitgtk-2.38.6.tar.xz
+sha1  4dfb3d96f621fc633ff347e083e429893551fb26  webkitgtk-2.38.6.tar.xz
+sha256  1c614c9589389db1a79ea9ba4293bbe8ac3ab0a2234cac700935fae0724ad48b  webkitgtk-2.38.6.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 3263f7fea0..dd17b46e67 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.38.5
+WEBKITGTK_VERSION = 2.38.6
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
