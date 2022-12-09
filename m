Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A45BC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 18:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EDA240CE2;
	Fri,  9 Dec 2022 18:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EDA240CE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VgU_ZlbYMKWP; Fri,  9 Dec 2022 18:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 794E940492;
	Fri,  9 Dec 2022 18:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 794E940492
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CEBFA1BF5DD
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 18:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA3A340BF3
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 18:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA3A340BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8nGj0mkHfga for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 18:03:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D209B40012
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 18:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D209B40012
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C09CB85EC6; Fri,  9 Dec 2022 18:03:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 19:02:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f276188ef7967ce8332fb38fdecd98b080b7e3db
X-Git-Newrev: c29929c123a2e84e358a08916168d8010fbb3e9d
X-Patchwork-Hint: ignore
Message-Id: <20221209180306.C09CB85EC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: bump to version 2.88
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

commit: https://git.buildroot.net/buildroot/commit/?id=c29929c123a2e84e358a08916168d8010fbb3e9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2022q4/016767.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 78127ca714..fd015d38ac 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.87.tar.xz.asc
-sha256  0228c0364a7f2356fd7e7f1549937cbf3099a78d3b2eb1ba5bb0c31e2b89de7a  dnsmasq-2.87.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.88.tar.xz.asc
+sha256  23544deda10340c053bea6f15a93fed6ea7f5aaa85316bfc671ffa6d22fbc1b3  dnsmasq-2.88.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 46a40c4bbb..3945e4256a 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.87
+DNSMASQ_VERSION = 2.88
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
