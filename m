Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90533C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 12:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AC8341BA2;
	Sun, 18 Sep 2022 12:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AC8341BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0k5n_ua0NJE; Sun, 18 Sep 2022 12:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A64C41A3B;
	Sun, 18 Sep 2022 12:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A64C41A3B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD57B1BF228
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C67FB4097F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C67FB4097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PMcGT-zLtnl8 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 12:46:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15E6C40111
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 12:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15E6C40111
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01F4385165; Sun, 18 Sep 2022 12:46:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 14:45:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 924310fb2d9210f3c335fac50b7806d1e73c28e3
X-Git-Newrev: f8f735d1a07de384cb8be92430b87ed475dd0f60
X-Patchwork-Hint: ignore
Message-Id: <20220918124622.01F4385165@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uvloop: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8f735d1a07de384cb8be92430b87ed475dd0f60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b1c821b9f7bb3bbd3d104da034dd416c48082591 forgot to update hash of
license files (copyright updated with
https://github.com/MagicStack/uvloop/commit/9c6ecb62ba44f607d435441c65eba595d663973b)

Fixes:
 - http://autobuild.buildroot.org/results/8e2c8294a5388609fd765a1d80ccc2dd31e6011d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-uvloop/python-uvloop.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 16c5e81e98..69834d5243 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -2,5 +2,5 @@
 md5  bc5e841a1c3f6e8935eeaf9d82b5ee29  uvloop-0.17.0.tar.gz
 sha256  0ddf6baf9cf11a1a22c71487f39f15b2cf78eb5bde7e5b45fbb99e8a9d91b9e1  uvloop-0.17.0.tar.gz
 # Locally computed sha256 checksums
-sha256  2fdc436a67077941295c58647f521fbef8f50e46db0970552fa1a4dd8ae261c6  LICENSE-APACHE
-sha256  9185f3c77e9f6ef8859a6ba4c94128ac1329876be3e813aad32d7645e51ae409  LICENSE-MIT
+sha256  377025287798f9dcd819e1f826fa5fc5e2f382528691ab0528c5cf8c8c282c27  LICENSE-APACHE
+sha256  6dd4c399f26de043d77a2ad7e31db4cb5bf08ea8368b0a42d6e158635cc8ab62  LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
