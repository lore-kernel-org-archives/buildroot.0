Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39950C0032E
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 19:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D95CC81FE8;
	Wed, 25 Oct 2023 19:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D95CC81FE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SW0VYZcvS7Oc; Wed, 25 Oct 2023 19:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48F7981FD1;
	Wed, 25 Oct 2023 19:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48F7981FD1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86FC71BF377
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60D3D60A81
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60D3D60A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4DgoM18uw6v for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 19:53:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFB7F60A74
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 19:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFB7F60A74
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B11285E20; Wed, 25 Oct 2023 19:53:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 25 Oct 2023 21:52:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de7bc4ada2ab5ef2e4094934acd5271c0aca19a1
X-Git-Newrev: fefcfddc5e6a265c66adbdff615558f99133f148
X-Patchwork-Hint: ignore
Message-Id: <20231025195323.9B11285E20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mxsldr: add .hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=fefcfddc5e6a265c66adbdff615558f99133f148
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-mxsldr package was missing a hash file, add it now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
