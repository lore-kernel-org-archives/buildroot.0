Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A04AC6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1882F41833;
	Tue, 14 Mar 2023 08:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1882F41833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sUs0Z2r888Qo; Tue, 14 Mar 2023 08:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE0DF4059D;
	Tue, 14 Mar 2023 08:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE0DF4059D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0723D1BF2C3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1CD34011F
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1CD34011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USAFWjDBmQNA for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:42:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA50540525
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA50540525
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C879C87108; Tue, 14 Mar 2023 08:42:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 09:41:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97ce2f621d46a3da0e6149815d66d7ccfcf9c020
X-Git-Newrev: 65f49b2cb3e7902fe90403e56a9ba7931504d99c
X-Patchwork-Hint: ignore
Message-Id: <20230314084212.C879C87108@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: fix
 CONTRIBUTING.md hash
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=65f49b2cb3e7902fe90403e56a9ba7931504d99c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The version bump in e3706f1 forgot to update the hash for
CONTRIBUTING.md
The file includes various changes unrelated to the legal information
(mailing list, how to build,...).

Fixes:
 - http://autobuild.buildroot.net/results/bbd0db06663b6df82973173bb044b57f013e844b

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 270699d63a..895351a537 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -3,4 +3,4 @@ sha256  2f6756d507bb6b46716594b67e6fe7491891e1b5b167bbafc5157dfa7753d5b4  Networ
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  f3c5ae3cafa27c24590cf89e732581cbeb4d25d950fe49ce7e4042963012b105  CONTRIBUTING.md
+sha256  cfb6c71f6df5898e1724be3debe9adac48c115b903915406c1e7dfd362b57892  CONTRIBUTING.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
