Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8CDC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB01B8188A;
	Sat,  8 Jan 2022 10:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lUlyvnqkmPpg; Sat,  8 Jan 2022 10:03:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18E6F8186A;
	Sat,  8 Jan 2022 10:03:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 95E581BF343
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83B1960A9F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id coczQOf1HcG5 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:03:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C28F360810
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:03:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C1BEE82AD1; Sat,  8 Jan 2022 09:57:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 11:02:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21648affd254d1cfe9e10735d558832ecb576155
X-Git-Newrev: 5483ea9e972d8c18d63561cae5639b4510f2bb93
X-Patchwork-Hint: ignore
Message-Id: <20220108095719.C1BEE82AD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matchbox-fakekey: bump to version
 0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=5483ea9e972d8c18d63561cae5639b4510f2bb93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use src/libfakekey.c as the license file because there is no COPYING in
the git tarball

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox-fakekey/matchbox-fakekey.hash | 5 ++---
 package/matchbox-fakekey/matchbox-fakekey.mk   | 9 ++++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/matchbox-fakekey/matchbox-fakekey.hash b/package/matchbox-fakekey/matchbox-fakekey.hash
index 516e0b6362..3627b13913 100644
--- a/package/matchbox-fakekey/matchbox-fakekey.hash
+++ b/package/matchbox-fakekey/matchbox-fakekey.hash
@@ -1,4 +1,3 @@
-# From http://downloads.yoctoproject.org/releases/matchbox/libfakekey/0.1/libfakekey-0.1.tar.bz2.md5
-md5	83dbde4d77e8baf0176fe4291d8a2303	libfakekey-0.1.tar.bz2
 # Locally computed
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  4e2fdc9bc20df469d53885c40e104122140131e06d4c184902070ec0b0f2ca9f  libfakekey-0.3.tar.bz2
+sha256  3271662131760e9b30dd92495a0ea0b598fc457798cc67948947365299dd607d  src/libfakekey.c
diff --git a/package/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox-fakekey/matchbox-fakekey.mk
index e607c48c15..99921ef8e7 100644
--- a/package/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox-fakekey/matchbox-fakekey.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-MATCHBOX_FAKEKEY_VERSION = 0.1
+MATCHBOX_FAKEKEY_VERSION = 0.3
 MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
-MATCHBOX_FAKEKEY_SITE = http://downloads.yoctoproject.org/releases/matchbox/libfakekey/$(MATCHBOX_FAKEKEY_VERSION)
+MATCHBOX_FAKEKEY_SITE = \
+	http://git.yoctoproject.org/cgit/cgit.cgi/libfakekey/snapshot
 MATCHBOX_FAKEKEY_LICENSE = GPL-2.0+
-MATCHBOX_FAKEKEY_LICENSE_FILES = COPYING
+MATCHBOX_FAKEKEY_LICENSE_FILES = src/libfakekey.c
+# From git
+MATCHBOX_FAKEKEY_AUTORECONF = YES
 MATCHBOX_FAKEKEY_INSTALL_STAGING = YES
 MATCHBOX_FAKEKEY_DEPENDENCIES = matchbox-lib xlib_libXtst
 MATCHBOX_FAKEKEY_CONF_OPTS = --enable-expat
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
