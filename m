Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942E3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 12:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55B0181769;
	Sat,  5 Feb 2022 12:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUkv2zY0ut4M; Sat,  5 Feb 2022 12:55:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DCB4815CD;
	Sat,  5 Feb 2022 12:55:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E41E1BF2E3
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 12:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A767400C9
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 12:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FlxDCf3d45u6 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 12:55:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 487C240018
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 12:55:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 28D9282803; Sat,  5 Feb 2022 12:48:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 13:55:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3058f39b86993996d17c8f38f0bfd83d654b5a7
X-Git-Newrev: ad2a752d7b2e6b880d7ad8c2a785092dc2b47e6b
X-Patchwork-Hint: ignore
Message-Id: <20220205124809.28D9282803@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/findutils: bump version to 4.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad2a752d7b2e6b880d7ad8c2a785092dc2b47e6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00003.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/findutils/findutils.hash | 2 +-
 package/findutils/findutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/findutils/findutils.hash b/package/findutils/findutils.hash
index 26dbe59181..0284c0e7b2 100644
--- a/package/findutils/findutils.hash
+++ b/package/findutils/findutils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  57127b7e97d91282c6ace556378d5455a9509898297e46e10443016ea1387164  findutils-4.8.0.tar.xz
+sha256  a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d547573cb08065fd462fe  findutils-4.9.0.tar.xz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 3237e5502a..9731a35047 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FINDUTILS_VERSION = 4.8.0
+FINDUTILS_VERSION = 4.9.0
 FINDUTILS_SOURCE = findutils-$(FINDUTILS_VERSION).tar.xz
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
