Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94461C25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 12:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F7FB6063E;
	Thu, 16 May 2024 12:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28ug3DVTJryG; Thu, 16 May 2024 12:25:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BC9560E51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BC9560E51;
	Thu, 16 May 2024 12:25:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A9EE1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 12:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 855E060E55
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 12:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Um7Y52pGhWzP for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 12:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6C806063E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6C806063E
 for <buildroot@buildroot.org>; Thu, 16 May 2024 12:25:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B397687415; Thu, 16 May 2024 12:25:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 16 May 2024 14:24:31 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 27e7c199cf14804e038c5b550e050c76ec27ac9b
X-Git-Newrev: 99eafd1cc66fabeb8b5e7c12cfb97b7c6b9781a9
X-Patchwork-Hint: ignore
Message-Id: <20240516122509.B397687415@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: remove
 Sebastian Weyer
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
Content-Type: multipart/mixed; boundary="===============1066009132711687572=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1066009132711687572==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=99eafd1cc66fabeb8b5e7c12cfb97b7c6b9781a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Sebastian email address at Smile is bouncing, so drop it
from the DEVELOPERS file.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7b973daac3f24ffce0246c5bbf80541499d86189)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 88c266293b..6a1ec436ff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2752,14 +2752,6 @@ F:	support/misc/toolchainfile.cmake.in
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
-N:	Sebastian Weyer <sebastian.weyer@smile.fr>
-F:      package/amlogic-boot-fip/
-F:	package/nushell/
-F:	package/rust-bindgen/
-F:	package/spirv-headers/
-F:	support/testing/tests/package/sample_nu.nu
-F:	support/testing/tests/package/test_nu.py
-
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	board/armadeus/
 F:	configs/armadeus*

--===============1066009132711687572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1066009132711687572==--
