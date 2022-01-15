Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455B0C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDB9F60BE9;
	Sat, 15 Jan 2022 10:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3vRxjUOqu97; Sat, 15 Jan 2022 10:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BA6460AC1;
	Sat, 15 Jan 2022 10:24:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C85D31BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B655E60AC1
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pcKgXDFEi6Ir for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:23:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1650360AC0
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:23:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3885682684; Sat, 15 Jan 2022 10:17:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:22:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f6b346a34bdb344c4a001d8bd66f5e973013c17
X-Git-Newrev: e61c7eef35ba2c962cac23a2e59ec9920f301348
X-Patchwork-Hint: ignore
Message-Id: <20220115101718.3885682684@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-configshell-fb: bump to
 version 1.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=e61c7eef35ba2c962cac23a2e59ec9920f301348
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-configshell-fb/python-configshell-fb.hash | 2 +-
 package/python-configshell-fb/python-configshell-fb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-configshell-fb/python-configshell-fb.hash b/package/python-configshell-fb/python-configshell-fb.hash
index 0903e284aa..8fc38f61a6 100644
--- a/package/python-configshell-fb/python-configshell-fb.hash
+++ b/package/python-configshell-fb/python-configshell-fb.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  3685446d6ee02881930bb2fdc5fdd254938da66ce9843a5b3676c4246b058e4b  python-configshell-fb-1.1.fb18.tar.gz
+sha256  24b47284b463dcfb9ee0c1558827e13442127e62fa279b6e0253f136cf49058c  python-configshell-fb-1.1.29.tar.gz
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/python-configshell-fb/python-configshell-fb.mk b/package/python-configshell-fb/python-configshell-fb.mk
index 94b6fed5ab..d0dd421e8d 100644
--- a/package/python-configshell-fb/python-configshell-fb.mk
+++ b/package/python-configshell-fb/python-configshell-fb.mk
@@ -6,7 +6,7 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and targetcli-fb at the same time.
-PYTHON_CONFIGSHELL_FB_VERSION = 1.1.fb18
+PYTHON_CONFIGSHELL_FB_VERSION = 1.1.29
 PYTHON_CONFIGSHELL_FB_SITE = $(call github,open-iscsi,configshell-fb,v$(PYTHON_CONFIGSHELL_FB_VERSION))
 PYTHON_CONFIGSHELL_FB_LICENSE = Apache-2.0
 PYTHON_CONFIGSHELL_FB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
