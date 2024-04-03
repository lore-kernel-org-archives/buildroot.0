Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E93CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 20:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C35E841832;
	Wed,  3 Apr 2024 20:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGha36jOVlF7; Wed,  3 Apr 2024 20:31:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64A4441847
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64A4441847;
	Wed,  3 Apr 2024 20:31:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37AC21BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F3A38223F
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYW2opelxlRw for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 20:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E87682230
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E87682230
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 20:31:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38057848AE; Wed,  3 Apr 2024 20:31:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 22:27:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 439525ced972299c8fa60d5e68e710075b9dce79
X-Git-Newrev: dd5d0240d241f8bf88af2c9799b9f13f0e99b515
X-Patchwork-Hint: ignore
Message-Id: <20240403203137.38057848AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libksba: bump to version 1.6.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd5d0240d241f8bf88af2c9799b9f13f0e99b515
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libksba/libksba.hash | 4 ++--
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index 3ac36e19ca..e74cde2cc0 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  0ada15ac00baa7df677a05bcb517621708f9c2f2  libksba-1.6.5.tar.bz2
-sha256  a564628c574c99287998753f98d750babd91a4e9db451f46ad140466ef2a6d16  libksba-1.6.5.tar.bz2
+sha1  1db4222e052656700021a30d517f5aa2f882da4a  libksba-1.6.6.tar.bz2
+sha256  5dec033d211559338838c0c4957c73dfdc3ee86f73977d6279640c9cd08ce6a4  libksba-1.6.6.tar.bz2
 
 # Hash for license files:
 sha256  f9c59ea5a5e1dfdeebcd134e6a594c21eb088cc95f6653ee99ff2e187c105380  AUTHORS
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 52ad5fbeec..b87efda226 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.5
+LIBKSBA_VERSION = 1.6.6
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
