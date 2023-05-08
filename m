Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC964C77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 770AF42A9D;
	Mon,  8 May 2023 20:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 770AF42A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTq9ucdeuZdv; Mon,  8 May 2023 20:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A13B842A9B;
	Mon,  8 May 2023 20:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A13B842A9B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 567151BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D8A442A96
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D8A442A96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HmP6EDaCwoH8 for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:10:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4117342A9E
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4117342A9E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F294861BA; Mon,  8 May 2023 20:10:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 22:09:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58884367da1787d4e23bdd223cf09407107ad486
X-Git-Newrev: 6ea396aef272fa107775ea8e4903506d2ffc99e0
X-Patchwork-Hint: ignore
Message-Id: <20230508201011.2F294861BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdio-tools: fix Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ea396aef272fa107775ea8e4903506d2ffc99e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add project's site and add a full stop at the end of the description.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mdio-tools/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
index 237f4454cc..790c9c534a 100644
--- a/package/mdio-tools/Config.in
+++ b/package/mdio-tools/Config.in
@@ -14,4 +14,6 @@ config BR2_PACKAGE_MDIO_TOOLS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	select BR2_PACKAGE_LIBMNL
 	help
-	  Low-level debug tools for MDIO devices
+	  Low-level debug tools for MDIO devices.
+
+	  https://github.com/wkz/mdio-tools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
