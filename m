Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05730C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C04BF8214A;
	Wed,  1 May 2024 21:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0YHyq2pQibDv; Wed,  1 May 2024 21:32:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DB3D8214B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DB3D8214B;
	Wed,  1 May 2024 21:32:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10E261BF983
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1A0082148
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iyy-6-tJ3tjq for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4051582141
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4051582141
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:32:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27B5186506; Wed,  1 May 2024 21:32:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 23:31:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8a86f5a8fcf2930b17a165ead7274618b7aba75
X-Git-Newrev: 7b973daac3f24ffce0246c5bbf80541499d86189
X-Patchwork-Hint: ignore
Message-Id: <20240501213215.27B5186506@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Sebastian Weyer
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
Content-Type: multipart/mixed; boundary="===============3110859801517003771=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3110859801517003771==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7b973daac3f24ffce0246c5bbf80541499d86189
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sebastian email address at Smile is bouncing, so drop it
from the DEVELOPERS file.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 11ffe17f92..5d198567d8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2769,14 +2769,6 @@ F:	support/misc/toolchainfile.cmake.in
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

--===============3110859801517003771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3110859801517003771==--
