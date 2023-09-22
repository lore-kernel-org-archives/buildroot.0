Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212D6CD484A
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 18:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9393461675;
	Fri, 22 Sep 2023 18:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9393461675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m4N8pCzCdImb; Fri, 22 Sep 2023 18:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C578360B6F;
	Fri, 22 Sep 2023 18:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C578360B6F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02F321BF3EE
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 18:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF64442236
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 18:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF64442236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGz5z9XhvXVL for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 18:06:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE6114217A
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 18:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE6114217A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FFE18753F; Fri, 22 Sep 2023 18:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 20:04:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a23251d3f738b44eab40375fc8822e0358d70517
X-Git-Newrev: 38063994d65537f22cec558e8a1c44f71e1dbfaa
X-Patchwork-Hint: ignore
Message-Id: <20230922180645.8FFE18753F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcllib: bump to version 1.21
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=38063994d65537f22cec558e8a1c44f71e1dbfaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://core.tcl-lang.org/tcllib/doc/tcllib-1-21/support/releases/history/README-1.21.txt

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/tcllib/tcllib.hash | 4 ++--
 package/tcllib/tcllib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcllib/tcllib.hash b/package/tcllib/tcllib.hash
index fb80841998..fe0ece238e 100644
--- a/package/tcllib/tcllib.hash
+++ b/package/tcllib/tcllib.hash
@@ -1,5 +1,5 @@
-# From https://core.tcl-lang.org/tcllib/uv/tcllib-1.20.SHA256
-sha256  199e8ec7ee26220e8463bc84dd55c44965fc8ef4d4ac6e4684b2b1c03b1bd5b9  tcllib-1.20.tar.xz
+# From https://core.tcl-lang.org/tcllib/uv/tcllib-1.21.SHA256
+sha256  10c7749e30fdd6092251930e8a1aa289b193a3b7f1abf17fee1d4fa89814762f  tcllib-1.21.tar.xz
 
 # Locally computed:
 sha256  38e1f556213f4008cfd280457af57c76a1fe043dc026ece1c704c09b5f6e865c  license.terms
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
index 0f60eb8aca..1f2b575b29 100644
--- a/package/tcllib/tcllib.mk
+++ b/package/tcllib/tcllib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCLLIB_VERSION = 1.20
+TCLLIB_VERSION = 1.21
 TCLLIB_SOURCE = tcllib-$(TCLLIB_VERSION).tar.xz
 TCLLIB_SITE = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
 TCLLIB_LICENSE = TCL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
