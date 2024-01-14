Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F599C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 22:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE886417E5;
	Sun, 14 Jan 2024 22:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE886417E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y5TDf9cIxPkW; Sun, 14 Jan 2024 22:10:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC0A0417D8;
	Sun, 14 Jan 2024 22:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC0A0417D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33CE71BF45A
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 22:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1891F40192
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 22:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1891F40192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cbv0aQDhWk8T for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 22:10:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C88744011F
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 22:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C88744011F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4C5686127; Sun, 14 Jan 2024 22:10:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 23:08:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30d5d1a2295dceacb9dd4db1b4c6aa5a7e11b9e3
X-Git-Newrev: b31b91296e7f985b909f104f06a098adddef1fea
X-Patchwork-Hint: ignore
Message-Id: <20240114221015.B4C5686127@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/attr: bump to version 2.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b31b91296e7f985b909f104f06a098adddef1fea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.nongnu.org/archive/html/acl-devel/2024-01/msg00011.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/attr/attr.hash | 2 +-
 package/attr/attr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/attr/attr.hash b/package/attr/attr.hash
index 334a438cae..f63c0e312a 100644
--- a/package/attr/attr.hash
+++ b/package/attr/attr.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  db448a626f9313a1a970d636767316a8da32aede70518b8050fa0de7947adc32  attr-2.5.1.tar.xz
+sha256  f2e97b0ab7ce293681ab701915766190d607a1dba7fae8a718138150b700a70b  attr-2.5.2.tar.xz
 
 # Locally calculated
 sha256  98f318493be6b08bff3cd295791cde06c54e17882a3c74a1ed245eaa02533d52  doc/COPYING
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 0327497e1e..6ecf5c53f4 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATTR_VERSION = 2.5.1
+ATTR_VERSION = 2.5.2
 ATTR_SOURCE = attr-$(ATTR_VERSION).tar.xz
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
