Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027A1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 21:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B760F4092A;
	Sun, 13 Mar 2022 21:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-lxSnrSwSOz; Sun, 13 Mar 2022 21:26:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C62B64092C;
	Sun, 13 Mar 2022 21:26:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F41C1BF97C
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 21:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79D2B81DBF
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 21:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uLT2BAxQS6bD for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 21:26:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D065781D70
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 21:26:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6E08483CFE; Sun, 13 Mar 2022 21:17:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 22:08:56 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 350ff34a730f10ea8beacfd8d6e1eb32fe5c93f4
X-Git-Newrev: c2bb1068b43d4ef9a05b7e55693a285c68b3c2bc
X-Patchwork-Hint: ignore
Message-Id: <20220313211754.6E08483CFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/exempi: security
 bump to version 2.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2bb1068b43d4ef9a05b7e55693a285c68b3c2bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Extract from NEWS:
- Changes in v2021.08
  - Security Fixes
- Changes in v2021.07
  - Security Fixes

https://gitlab.freedesktop.org/libopenraw/exempi/-/blob/2.6.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 55f1d0a3592253df2a356c195e5131a970eade9b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exempi/exempi.hash | 2 +-
 package/exempi/exempi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exempi/exempi.hash b/package/exempi/exempi.hash
index 5ea9683053..5df610de17 100644
--- a/package/exempi/exempi.hash
+++ b/package/exempi/exempi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  52f54314aefd45945d47a6ecf4bd21f362e6467fa5d0538b0d45a06bc6eaaed5  exempi-2.5.2.tar.bz2
+sha256  072451ac1e0dc97ed69a2e5bfc235fd94fe093d837f65584d0e3581af5db18cd  exempi-2.6.1.tar.bz2
 sha256  3d3c3593c15e0d35bdae0df7c642106250f6be3adc61477419413900f23ae607  COPYING
diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
index f481469d2c..56fbe20379 100644
--- a/package/exempi/exempi.mk
+++ b/package/exempi/exempi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXEMPI_VERSION = 2.5.2
+EXEMPI_VERSION = 2.6.1
 EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.bz2
 EXEMPI_SITE = https://libopenraw.freedesktop.org/download
 EXEMPI_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
