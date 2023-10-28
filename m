Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB90C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3859342F29;
	Sat, 28 Oct 2023 21:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3859342F29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVeonSyRC65K; Sat, 28 Oct 2023 21:03:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 679EC42DBC;
	Sat, 28 Oct 2023 21:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 679EC42DBC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E429F1BF86B
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCFDE41865
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCFDE41865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuObLZiaFENt for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFAA040102
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFAA040102
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BA5F8607C; Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:49:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e96b1c4b0b06d65c54a764fe4a59d886afc70df5
X-Git-Newrev: 145f01ded5e340ec269d82d5d88cf61fc0b314a3
X-Patchwork-Hint: ignore
Message-Id: <20231028210321.9BA5F8607C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dracut: bump to version 059
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

commit: https://git.buildroot.net/buildroot/commit/?id=145f01ded5e340ec269d82d5d88cf61fc0b314a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/dracutdevs/dracut/blob/059/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dracut/dracut.hash | 2 +-
 package/dracut/dracut.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dracut/dracut.hash b/package/dracut/dracut.hash
index 34db6af23b..6ca352c542 100644
--- a/package/dracut/dracut.hash
+++ b/package/dracut/dracut.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  24f149d683d188c0d25756529b7d1e5cd6be8028e0c1043110f303d0d706757d  dracut-057.tar.gz
+sha256  eabf0bb685420c1e1d5475b6855ef787104508f0135ff570312845256e0fcecf  dracut-059.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 3eb9bcc474..1de11d208d 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRACUT_VERSION = 057
+DRACUT_VERSION = 059
 DRACUT_SITE = $(call github,dracutdevs,dracut,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
