Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75721C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 162AC41F79;
	Sat,  6 May 2023 16:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 162AC41F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fAoD8gNtGyU7; Sat,  6 May 2023 16:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD0284208B;
	Sat,  6 May 2023 16:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD0284208B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 701F11BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45E9D40102
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45E9D40102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diSu5UtD4-6w for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:09:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85874401CC
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85874401CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 748E885EC2; Sat,  6 May 2023 16:09:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 18:02:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf9a5c397c1c952fc8b5cd75cf4d651c746759fb
X-Git-Newrev: 2b18a93cd5cdb56dd2a0e85ea9d04e16f1513fa4
X-Patchwork-Hint: ignore
Message-Id: <20230506160924.748E885EC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/moby-buildkit: bump version to
 0.11.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b18a93cd5cdb56dd2a0e85ea9d04e16f1513fa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfixes.

https://github.com/moby/buildkit/releases/tag/v0.11.6

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/moby-buildkit/moby-buildkit.hash | 2 +-
 package/moby-buildkit/moby-buildkit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
index ef927636d9..f7922d7e8f 100644
--- a/package/moby-buildkit/moby-buildkit.hash
+++ b/package/moby-buildkit/moby-buildkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b1746575f37715a8a2f2df5bab77ea081ba8436854e241792702109fc9e3653d  moby-buildkit-0.11.2.tar.gz
+sha256  1efa1c54b299c463c1b039d3df8ba1c68e70fe4de608fd14653fcebf9f27837b  moby-buildkit-0.11.6.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
index a25f676710..91560c1ed1 100644
--- a/package/moby-buildkit/moby-buildkit.mk
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOBY_BUILDKIT_VERSION = 0.11.2
+MOBY_BUILDKIT_VERSION = 0.11.6
 MOBY_BUILDKIT_SITE = $(call github,moby,buildkit,v$(MOBY_BUILDKIT_VERSION))
 MOBY_BUILDKIT_LICENSE = Apache-2.0
 MOBY_BUILDKIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
