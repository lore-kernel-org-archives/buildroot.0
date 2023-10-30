Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A59C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 12:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5B10856A6;
	Mon, 30 Oct 2023 12:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5B10856A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRkBn92ijHVN; Mon, 30 Oct 2023 12:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22322855DC;
	Mon, 30 Oct 2023 12:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22322855DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 175581BF408
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 12:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E43424340B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 12:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E43424340B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLl02h2eW634 for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 12:43:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E96A1432E4
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 12:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E96A1432E4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D153D86166; Mon, 30 Oct 2023 12:42:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 13:41:27 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 4616a30c63a444e9502e67d1fe325f4cf30833e0
X-Git-Newrev: d8bd44d455f8ec6b1575fb72eb8f3da8a34e9323
X-Patchwork-Hint: ignore
Message-Id: <20231030124259.D153D86166@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/mxsldr: add .hash
 file
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8bd44d455f8ec6b1575fb72eb8f3da8a34e9323
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

The host-mxsldr package was missing a hash file, add it now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit fefcfddc5e6a265c66adbdff615558f99133f148)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mxsldr/mxsldr.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mxsldr/mxsldr.hash b/package/mxsldr/mxsldr.hash
new file mode 100644
index 0000000000..c2a7b4ad64
--- /dev/null
+++ b/package/mxsldr/mxsldr.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  8ef7b7abb8d17c879e70b2c3911df8c5ce97f38779fa65d40be7f34febba55e1  mxsldr-2793a657ab7a22487d21c1b020957806f8ae8383-br1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
