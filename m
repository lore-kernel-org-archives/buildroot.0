Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3D5C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65DC181678;
	Sun, 12 Feb 2023 20:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65DC181678
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZR7-LBW3Pu0B; Sun, 12 Feb 2023 20:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC887815CA;
	Sun, 12 Feb 2023 20:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC887815CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC6491BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B691260BFF
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B691260BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 095g80H3uGr4 for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:21:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E075F60AAA
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E075F60AAA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD6238572E; Sun, 12 Feb 2023 20:21:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:20:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1bb77eb8f14585bc79307fd672cab79b7e4e476d
X-Git-Newrev: 6f33c8490fe8d110c13a1f28bd5a2063983002fd
X-Patchwork-Hint: ignore
Message-Id: <20230212202118.CD6238572E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: reorder entries for Julien
 Olivain
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f33c8490fe8d110c13a1f28bd5a2063983002fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Entries for "gnupg2" and "test_python_hkdf.py" were not at the right
position.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ae698f87c5..ece0d986ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1685,8 +1685,8 @@ F:	configs/spike_riscv64_defconfig
 F:	configs/zynq_qmtech_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
-F:	package/gnupg2/
 F:	package/glslsandbox-player/
+F:	package/gnupg2/
 F:	package/octave/
 F:	package/ola/
 F:	package/perftest/
@@ -1716,8 +1716,8 @@ F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_python_distro.py
-F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_gnupg.py
+F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_magic_wormhole.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
