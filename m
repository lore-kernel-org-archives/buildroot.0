Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6172BC48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 21:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0A834051C;
	Sun, 18 Feb 2024 21:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eh1b4t9kas4k; Sun, 18 Feb 2024 21:34:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 784D7404CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 784D7404CF;
	Sun, 18 Feb 2024 21:34:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 840611BF3BB
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 21:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DE2560652
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 21:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVuvS0ot9c5r for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 21:34:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F44260644
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F44260644
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 21:34:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE00A878EE; Sun, 18 Feb 2024 21:34:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 22:33:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b34b8ccfa5159d643ecbac12c42c638e3b27e5e
X-Git-Newrev: df5594644ff0fa2ed9128e2a9e9daefd305b795b
X-Patchwork-Hint: ignore
Message-Id: <20240218213412.EE00A878EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysstat: bump version to 12.7.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=df5594644ff0fa2ed9128e2a9e9daefd305b795b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://sysstat.github.io/2023/12/17/sysstat-12.7.5.html

./utils/test-pkg -c sysstat.config  -p sysstat
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysstat/sysstat.hash | 6 +++---
 package/sysstat/sysstat.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index b47f000e57..31821d9e3f 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,5 +1,5 @@
-# From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1  a730982e0c2d4964a0022c1509f3ea0a345402bc  sysstat-12.6.1.tar.xz
+# From: https://sysstat.github.io/2023/12/17/sysstat-12.7.5.html
+sha1  f329edff36f462385a7c20d2a136b667ab8db735  sysstat-12.7.5.tar.xz
 # Locally calculated
-sha256  18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9464a0342  sysstat-12.6.1.tar.xz
+sha256  57664040a549d33bb06a1121c7124d4cadd9b8b35f815856c194393047cd4d6b  sysstat-12.7.5.tar.xz
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index f77a60b1da..cfa97834c3 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 12.6.1
+SYSSTAT_VERSION = 12.7.5
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = https://sysstat.github.io/sysstat-packages
 SYSSTAT_CONF_OPTS = --disable-file-attr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
