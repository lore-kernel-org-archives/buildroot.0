Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFD2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1808B40213;
	Sun, 23 Jan 2022 19:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DExrBb24Rgxp; Sun, 23 Jan 2022 19:53:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ABA34022A;
	Sun, 23 Jan 2022 19:53:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 587841BF97C
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5351440253
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQiEH1p7Pfk4 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:52:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B1824014C
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:52:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D5D628296B; Sun, 23 Jan 2022 19:45:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 20:49:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a42e347222a2d04947d2e6985ea241ce593a0ad
X-Git-Newrev: 038d7d685f811d48c2870df86c94c8641539f78b
X-Patchwork-Hint: ignore
Message-Id: <20220123194537.D5D628296B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lft: bump to version 3.91
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

commit: https://git.buildroot.net/buildroot/commit/?id=038d7d685f811d48c2870df86c94c8641539f78b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lft 3.91 / WhoB 3.91
----------------------
- Fixed bugs.debian.org/cgi-bin/bugreport.cgi?bug=922430
- Updated date

lft 3.9 / WhoB 3.9
----------------------
- Fixed a bug that could indicate a target was closed when it was open
- Improved support for DLT_NULL interfaces on BSD-like operating systems
- Improved deprecated pcap device enumeration method
- Improved GraphViz output format appearance

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lft/lft.hash | 6 +++---
 package/lft/lft.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lft/lft.hash b/package/lft/lft.hash
index 91a1fb0659..9bcce843bc 100644
--- a/package/lft/lft.hash
+++ b/package/lft/lft.hash
@@ -1,5 +1,5 @@
 # From http://pwhois.org/lft/
-md5 31b15aabc619707427a73657512560f8  lft-3.8.tar.gz
+md5  73cb955546692cf0fb5d7931939c56de  lft-3.91.tar.gz
 # Locally calculated
-sha256 10f427e77b0f8207817329bd8ef0310078434612620073369264d15e6f97e990  lft-3.8.tar.gz
-sha256 e3b7634630e6800eccca6ecafb5d40153d4f8f7a20e2b2399bf3c0ea92f44614  COPYING
+sha256  aad13e671adcfc471ab99417161964882d147893a54664f3f465ec5c8398e6af  lft-3.91.tar.gz
+sha256  e3b7634630e6800eccca6ecafb5d40153d4f8f7a20e2b2399bf3c0ea92f44614  COPYING
diff --git a/package/lft/lft.mk b/package/lft/lft.mk
index 5154c83fef..37e6e77767 100644
--- a/package/lft/lft.mk
+++ b/package/lft/lft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFT_VERSION = 3.8
+LFT_VERSION = 3.91
 LFT_SITE = http://pwhois.org/get
 LFT_DEPENDENCIES = libpcap
 LFT_LICENSE = VOSTROM Public License for Open Source
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
