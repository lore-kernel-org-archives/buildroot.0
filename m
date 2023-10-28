Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9A8C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5942A424D5;
	Sat, 28 Oct 2023 21:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5942A424D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVn_cjIfARck; Sat, 28 Oct 2023 21:07:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C2B842F70;
	Sat, 28 Oct 2023 21:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C2B842F70
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE4581BF20B
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6C4F42F30
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6C4F42F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YeU_91n0AbcX for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:06:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2DF442D9E
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2DF442D9E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFE8A8607E; Sat, 28 Oct 2023 21:05:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 23:05:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f3319e0bb82379aecc3bac401d973648b22a1b5
X-Git-Newrev: f1b14ea5a37c2ce338cf279bf6c750a5599036ae
X-Patchwork-Hint: ignore
Message-Id: <20231028210559.CFE8A8607E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acsccid: bump to version 1.1.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1b14ea5a37c2ce338cf279bf6c750a5599036ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sourceforge.net/p/acsccid/news/2023/04/acsccid-119-released/
https://sourceforge.net/p/acsccid/news/2023/08/acsccid-1110-released/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/acsccid/acsccid.hash | 8 ++++----
 package/acsccid/acsccid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
index f43a7930a4..5310d78144 100644
--- a/package/acsccid/acsccid.hash
+++ b/package/acsccid/acsccid.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.7/
-sha1  c0062401e5fedf3ec12c8c2d375d6e1561a8a8ed  acsccid-1.1.8.tar.bz2
-md5  3eba7b2527aa0b14c73b1a620a1d72d2  acsccid-1.1.8.tar.bz2
+# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.10/
+sha1  6284a693b8edb511f2f80d9069af9b4a41fd55ae  acsccid-1.1.10.tar.bz2
+md5  4d2b7f34414aed029084c96dd05a0e7d  acsccid-1.1.10.tar.bz2
 # Locally computed
-sha256  f86fd846bc88594a569ea27040cb441d933b7eca8d51d2a90bacf161e7740051  acsccid-1.1.8.tar.bz2
+sha256  5ee112febdcac6656629025f3a85923f155f6ca150b2d24fd716f9043265528e  acsccid-1.1.10.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index db74e9cb76..463f0f24d6 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACSCCID_VERSION = 1.1.8
+ACSCCID_VERSION = 1.1.10
 ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
 ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
 ACSCCID_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
