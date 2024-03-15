Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EC5C54E60
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 20:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4625E60A3A;
	Sat, 16 Mar 2024 20:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZhVLi3caX09; Sat, 16 Mar 2024 20:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E83E608DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E83E608DD;
	Sat, 16 Mar 2024 20:47:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 192BA1BF391
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 20:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E45BD4098E
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 20:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vd54ZPEbj9-K for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 20:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 767BE4099B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 767BE4099B
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 20:47:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62F63882B8; Sat, 16 Mar 2024 20:47:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 21:25:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c27711002a82bbbb47363efceb526be7862bab3
X-Git-Newrev: 8a69af5fa4b545767ab292d1ad01266b87d45e92
X-Patchwork-Hint: ignore
Message-Id: <20240316204705.62F63882B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rtslib-fb: 2.1.76
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a69af5fa4b545767ab292d1ad01266b87d45e92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bump to latest version because previous version did not work with python 3.11

Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-rtslib-fb/python-rtslib-fb.hash | 2 +-
 package/python-rtslib-fb/python-rtslib-fb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-rtslib-fb/python-rtslib-fb.hash b/package/python-rtslib-fb/python-rtslib-fb.hash
index 3c2e39fffd..39c390edb2 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.hash
+++ b/package/python-rtslib-fb/python-rtslib-fb.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  9f581c4bcffebc60be236af8a6ebdeccdb66d0435eeb04ab1b743c170b95d046  python-rtslib-fb-2.1.74.tar.gz
+sha256  ac15c113d09209c7b0d14d94a12ed88205a7c2feadd1096f573049fd737f7e74  python-rtslib-fb-2.1.76.tar.gz
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
index 09bde874f0..6396d26a3f 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.mk
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -6,7 +6,7 @@
 
 # When upgrading the version, be sure to also upgrade
 # python-configshell-fb and targetcli-fb at the same time.
-PYTHON_RTSLIB_FB_VERSION = 2.1.74
+PYTHON_RTSLIB_FB_VERSION = 2.1.76
 # Do not switch site to PyPI: it does not contain the latest version.
 PYTHON_RTSLIB_FB_SITE = $(call github,open-iscsi,rtslib-fb,v$(PYTHON_RTSLIB_FB_VERSION))
 PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
