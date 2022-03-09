Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4C5C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 21:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D23A8842F9;
	Wed,  9 Mar 2022 21:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2qypj806R8HJ; Wed,  9 Mar 2022 21:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A845842E7;
	Wed,  9 Mar 2022 21:04:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 261041BF303
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22FCC842E7
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3PcHADBJH0d for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 21:04:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AFF9842E5
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 21:04:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 281CF83A43; Wed,  9 Mar 2022 20:56:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 9 Mar 2022 22:04:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59ab0dff71c0da0dfa58369d81c41e9d2f3e470f
X-Git-Newrev: 7e8714f54fab704be63a8b7dc1d82afaf1e785a8
X-Patchwork-Hint: ignore
Message-Id: <20220309205614.281CF83A43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xdotool: bump to version
 3.20211022.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e8714f54fab704be63a8b7dc1d82afaf1e785a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Retrieve official tarball
- Update indentation in hash file (two spaces)

https://github.com/jordansissel/xdotool/blob/v3.20211022.1/CHANGELIST

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xdotool/xdotool.hash | 4 ++--
 package/xdotool/xdotool.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/xdotool/xdotool.hash b/package/xdotool/xdotool.hash
index b0d5a7582a..549e807ccc 100644
--- a/package/xdotool/xdotool.hash
+++ b/package/xdotool/xdotool.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 ddafca1239075c203769c17a5a184587731e56fbe0438c09d08f8af1704e117a  xdotool-3.20160805.1.tar.gz
-sha256 129d156c35b1cb19350f3716129173c8c89e019c0497d9df073db5b801becef2  COPYRIGHT
+sha256  96f0facfde6d78eacad35b91b0f46fecd0b35e474c03e00e30da3fdd345f9ada  xdotool-3.20211022.1.tar.gz
+sha256  129d156c35b1cb19350f3716129173c8c89e019c0497d9df073db5b801becef2  COPYRIGHT
diff --git a/package/xdotool/xdotool.mk b/package/xdotool/xdotool.mk
index 5c5603bd62..c430a49d06 100644
--- a/package/xdotool/xdotool.mk
+++ b/package/xdotool/xdotool.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XDOTOOL_VERSION = 3.20160805.1
-XDOTOOL_SITE = $(call github,jordansissel,xdotool,v$(XDOTOOL_VERSION))
+XDOTOOL_VERSION = 3.20211022.1
+XDOTOOL_SITE = https://github.com/jordansissel/xdotool/releases/download/v$(XDOTOOL_VERSION)
 XDOTOOL_LICENSE = BSD-3-Clause
 XDOTOOL_LICENSE_FILES = COPYRIGHT
 XDOTOOL_DEPENDENCIES = xlib_libXtst xlib_libXinerama libxkbcommon xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
