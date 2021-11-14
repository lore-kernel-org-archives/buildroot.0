Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0311C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EA73404A5;
	Mon,  6 Dec 2021 18:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6SJGb9B_tfI; Mon,  6 Dec 2021 18:16:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67725400CF;
	Mon,  6 Dec 2021 18:16:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AC011BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B183E84B8A
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dd3FCenXudD8 for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14D8D829EE
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A47F881503; Mon,  6 Dec 2021 18:07:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 14:36:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e68fba55fd80022c691e677b71462b60d1083838
X-Git-Newrev: f727b6da04c21732bbd07d8c70aa814bc56014a1
X-Patchwork-Hint: ignore
Message-Id: <20211206180737.A47F881503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memcached: bump to version 1.6.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=f727b6da04c21732bbd07d8c70aa814bc56014a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/memcached/memcached/wiki/ReleaseNotes1610
https://github.com/memcached/memcached/wiki/ReleaseNotes1611
https://github.com/memcached/memcached/wiki/ReleaseNotes1612

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index a86a6f9f73..22c794d07b 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.9.tar.gz.sha1
-sha1  42ae062094fdf083cfe7b21ff377c781011c2be1  memcached-1.6.9.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.12.tar.gz.sha1
+sha1  40d43e98f149e13e6c81eee813e6734f23413a01  memcached-1.6.12.tar.gz
 
 # Locally computed
-sha256  d5a62ce377314dbffdb37c4467e7763e3abae376a16171e613cbe69956f092d1  memcached-1.6.9.tar.gz
+sha256  f291a35f82ef9756ed1d952879ef5f4be870f932bdfcb2ab61356609abf82346  memcached-1.6.12.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index f233e11806..8f3506f9d4 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.9
+MEMCACHED_VERSION = 1.6.12
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
