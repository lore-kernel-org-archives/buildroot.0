Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7232CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2545D60B04;
	Thu, 27 Jan 2022 18:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0ux101cOeBz; Thu, 27 Jan 2022 18:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68FB960A94;
	Thu, 27 Jan 2022 18:33:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18EE51C113E
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 087764171E
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PU95YL3ZCCyI for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:32:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D465417A8
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EFA9F829FE; Thu, 27 Jan 2022 18:25:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 19:29:58 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f1cd0d2cf52511215df0586174a2609c374c0513
X-Git-Newrev: 35baab9abf3ffa44d2318eb5d2063cfd5547b88d
X-Patchwork-Hint: ignore
Message-Id: <20220127182514.EFA9F829FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Developpers: remove
 Santosh Multhalli for valjson
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
Content-Type: multipart/mixed; boundary="===============2511862791171063586=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2511862791171063586==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=35baab9abf3ffa44d2318eb5d2063cfd5547b88d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 31fd98c6ae7c39d779e7f9729e55ec65a7f847ff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1e54d62466..57e4592b4a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2309,9 +2309,6 @@ F:	support/misc/toolchainfile.cmake.in
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
-N:	Santosh Multhalli <santosh.multhalli@collins.com>
-F:	package/valijson/
-
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/

--===============2511862791171063586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2511862791171063586==--
