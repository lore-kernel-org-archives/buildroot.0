Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8CAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BB9760EC4;
	Sat, 15 Jan 2022 10:24:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99yfx6vARhUu; Sat, 15 Jan 2022 10:24:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A02460BFA;
	Sat, 15 Jan 2022 10:24:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D356E1BF95E
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB49081D16
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRSSwYxoOhEL for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:23:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C26081D11
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:23:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4110182962; Sat, 15 Jan 2022 10:17:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:23:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e61c7eef35ba2c962cac23a2e59ec9920f301348
X-Git-Newrev: dcba4ae9444ec606bc7a48cbd04d9b55b87ba7fb
X-Patchwork-Hint: ignore
Message-Id: <20220115101718.4110182962@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rtslib-fb: bump to version
 2.1.74
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

commit: https://git.buildroot.net/buildroot/commit/?id=dcba4ae9444ec606bc7a48cbd04d9b55b87ba7fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-rtslib-fb/python-rtslib-fb.hash | 2 +-
 package/python-rtslib-fb/python-rtslib-fb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-rtslib-fb/python-rtslib-fb.hash b/package/python-rtslib-fb/python-rtslib-fb.hash
index f67231d398..3c2e39fffd 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.hash
+++ b/package/python-rtslib-fb/python-rtslib-fb.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  d5d81a78046b4c228d29ba88d9950e0f63858e5fcf601e3d0f8bf107fbaadc03  python-rtslib-fb-2.1.fb57.tar.gz
+sha256  9f581c4bcffebc60be236af8a6ebdeccdb66d0435eeb04ab1b743c170b95d046  python-rtslib-fb-2.1.74.tar.gz
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
index 421fbed0ae..09bde874f0 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.mk
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -6,7 +6,7 @@
 
 # When upgrading the version, be sure to also upgrade
 # python-configshell-fb and targetcli-fb at the same time.
-PYTHON_RTSLIB_FB_VERSION = 2.1.fb57
+PYTHON_RTSLIB_FB_VERSION = 2.1.74
 # Do not switch site to PyPI: it does not contain the latest version.
 PYTHON_RTSLIB_FB_SITE = $(call github,open-iscsi,rtslib-fb,v$(PYTHON_RTSLIB_FB_VERSION))
 PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
