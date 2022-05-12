Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A56C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EA2182F0F;
	Thu, 12 May 2022 19:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmvJBufUN0I8; Thu, 12 May 2022 19:54:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30D4382A2E;
	Thu, 12 May 2022 19:54:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31AA31BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 588614033F
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_Z2LDWsqOno for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F08240359
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E09B985C6F; Thu, 12 May 2022 19:41:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:49:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c800c9a56cbc559b61d1772ee5b7dcf9f1844ee7
X-Git-Newrev: 9a5e228a89b634e258e95dd01a78218d663e3fee
X-Patchwork-Hint: ignore
Message-Id: <20220512194100.E09B985C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_listres: bump version
 to 1.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a5e228a89b634e258e95dd01a78218d663e3fee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003142.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_listres/xapp_listres.hash | 10 ++++------
 package/x11r7/xapp_listres/xapp_listres.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_listres/xapp_listres.hash b/package/x11r7/xapp_listres/xapp_listres.hash
index 1e1c11953a..30fccec9d3 100644
--- a/package/x11r7/xapp_listres/xapp_listres.hash
+++ b/package/x11r7/xapp_listres/xapp_listres.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002848.html
-md5 24e05349f2881aaa58cbe160e49223ac  listres-1.0.4.tar.bz2
-sha1 903857c7a9ec3d8edc8a88101aef33cd27796649  listres-1.0.4.tar.bz2
-sha256 6a1229f478796e141d6658762f432ebbe1f6083b27550847d52239b3f7ec2b10  listres-1.0.4.tar.bz2
-sha512 925bceab6ff96fcf91f58ba2f858905d6e2eff7074ba29cfc02def7c19fb493545837884f1070dc004422451f749cd459000c01e8c9bb51a7cce7f7ab4067b8a  listres-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003142.html
+sha256  ce2a00bbe7d2eb8d75177006f343c80443a22d52570c48a43c6fe70ea074dc9d  listres-1.0.5.tar.xz
+sha512  caa3626773031fbf6d8bcc1f697afe6add64fe4a8d1d766c42d5c2346050869dd23a26a1718411134ab05c75835facf0786cab5595721a16df423cdc54dd813d  listres-1.0.5.tar.xz
 # Locally computed
-sha256 aefb540c54bc95c68702cd2ae668c559e63cc1a84f55ae5c0e78547e7d75d2d5  COPYING
+sha256  aefb540c54bc95c68702cd2ae668c559e63cc1a84f55ae5c0e78547e7d75d2d5  COPYING
diff --git a/package/x11r7/xapp_listres/xapp_listres.mk b/package/x11r7/xapp_listres/xapp_listres.mk
index b4ac3e1de8..e0d7487f68 100644
--- a/package/x11r7/xapp_listres/xapp_listres.mk
+++ b/package/x11r7/xapp_listres/xapp_listres.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_LISTRES_VERSION = 1.0.4
-XAPP_LISTRES_SOURCE = listres-$(XAPP_LISTRES_VERSION).tar.bz2
+XAPP_LISTRES_VERSION = 1.0.5
+XAPP_LISTRES_SOURCE = listres-$(XAPP_LISTRES_VERSION).tar.xz
 XAPP_LISTRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_LISTRES_LICENSE = MIT
 XAPP_LISTRES_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
