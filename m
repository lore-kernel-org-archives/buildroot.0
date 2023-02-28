Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50677C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 20:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED9C36076C;
	Tue, 28 Feb 2023 20:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED9C36076C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qaURkkVkBokV; Tue, 28 Feb 2023 20:13:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F510605D6;
	Tue, 28 Feb 2023 20:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F510605D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17D291BF870
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3AA940126
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3AA940126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfzAOrXzRk21 for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 20:10:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17C57400D8
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 20:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17C57400D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04D3586D8E; Tue, 28 Feb 2023 20:10:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 18:33:51 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ba4de93b333c6e7f8578171d4b9a28dbbd5abd7f
X-Git-Newrev: 7fafc34c8953c5abd93c79495e03f20d4820dd18
X-Patchwork-Hint: ignore
Message-Id: <20230228201056.04D3586D8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/webkitgtk:
 security bump to version 2.38.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fafc34c8953c5abd93c79495e03f20d4820dd18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Bugfix release, with a security patch for
CVE-2022-42799, CVE-2022-42823, CVE-2022-42824, CVE-2022-42852,
CVE-2022-42856, CVE-2022-42863, CVE-2022-42867, CVE-2022-46691,
CVE-2022-46692, CVE-2022-46698, CVE-2022-46699 and CVE-2022-46700.

Release notes:

 https://webkitgtk.org/2022/10/20/webkitgtk2.38.1-released.html
 https://webkitgtk.org/2022/11/04/webkitgtk2.38.2-released.html
 https://webkitgtk.org/2022/12/22/webkitgtk2.38.3-released.html

Accompanying security advisory:

 https://webkitgtk.org/security/WSA-2022-0010.html
 https://webkitgtk.org/security/WSA-2022-0011.html

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d64a089a64aff7c8cbf197beea460d644646243d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index c2512be9c6..eff7f5c18f 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.38.0.tar.xz.sums
-md5  a69cd8fc05f7299458b4faf1bc99b875  webkitgtk-2.38.0.tar.xz
-sha1  6dcb65b8dc56c52f086bfeecfca7920e9cc78348  webkitgtk-2.38.0.tar.xz
-sha256  f9ce6375a3b6e1329b0b609f46921e2627dc7ad6224b37b967ab2ea643bc0fbd  webkitgtk-2.38.0.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.38.3.tar.xz.sums
+md5  1c1cc5eb59273091e228406937b23947  webkitgtk-2.38.3.tar.xz
+sha1  04cb5923d8ac6f435424b74115c3219ec597e9ad  webkitgtk-2.38.3.tar.xz
+sha256  41f001d1ed448c6936b394a9f20e4640eebf83a7f08262df28504f7410604a5a  webkitgtk-2.38.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 69e96e33c6..1c8ad31176 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.38.0
+WEBKITGTK_VERSION = 2.38.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
