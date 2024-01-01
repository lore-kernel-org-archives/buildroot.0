Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAB0C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56AB0409F8;
	Mon,  1 Jan 2024 21:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56AB0409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V8J3ox9eR-O0; Mon,  1 Jan 2024 21:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43F2940A9B;
	Mon,  1 Jan 2024 21:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43F2940A9B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 250881BF37C
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B95340A4B
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B95340A4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oc9wq_zm21D5 for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:14:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C95C3435C6
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C95C3435C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3FE683B53; Mon,  1 Jan 2024 21:14:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 22:08:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b2e01cc492b05383ce4be12240e47ab3e9009d4
X-Git-Newrev: 2e26e9e5aa7604aafbe0197c91b7e3f59a2585c2
X-Patchwork-Hint: ignore
Message-Id: <20240101211459.A3FE683B53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/logrotate: bump to version 3.21.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2e26e9e5aa7604aafbe0197c91b7e3f59a2585c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/logrotate/logrotate/releases/tag/3.21.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 9c8e73f738..cc466a6f4e 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  742f6d6e18eceffa49a4bacd933686d3e42931cfccfb694d7f6369b704e5d094  logrotate-3.20.1.tar.xz
+sha256  8fa12015e3b8415c121fc9c0ca53aa872f7b0702f543afda7e32b6c4900f6516  logrotate-3.21.0.tar.xz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 453dbe477a..37c48121f1 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.20.1
+LOGROTATE_VERSION = 3.21.0
 LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.xz
 LOGROTATE_SITE = https://github.com/logrotate/logrotate/releases/download/$(LOGROTATE_VERSION)
 LOGROTATE_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
