Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF891C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7434360BB0;
	Sun, 13 Nov 2022 14:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7434360BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t_NK3GUcRlLS; Sun, 13 Nov 2022 14:35:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6B7260BAB;
	Sun, 13 Nov 2022 14:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6B7260BAB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15D681BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E45FA40888
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E45FA40888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RIDWtBlBL_fN for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:35:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDCF34048F
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDCF34048F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC71C8366C; Sun, 13 Nov 2022 14:35:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 15:28:37 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 80951e9cd323560ef937e18959023300357b1710
X-Git-Newrev: 5146b9943d986a811cf5b728faf8d7a8ce7bcf8a
X-Patchwork-Hint: ignore
Message-Id: <20221113143503.CC71C8366C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mxml: bump to
 version 3.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5146b9943d986a811cf5b728faf8d7a8ce7bcf8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Update hash of NOTICE (update in year:
https://github.com/michaelrsweet/mxml/commit/d32818a16ceb352b8889f95ec7ff65575ad2e4f2)

https://github.com/michaelrsweet/mxml/releases/tag/v3.3.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f67480040b575fb225fcc2cd79c7a5408ef253b1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mxml/mxml.hash | 4 ++--
 package/mxml/mxml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mxml/mxml.hash b/package/mxml/mxml.hash
index 38056f4c3a..412977dff0 100644
--- a/package/mxml/mxml.hash
+++ b/package/mxml/mxml.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  7cf976366f9e8e4f8cff7d35a59bcf6201c769fce9e58015d64f4b6de1fe3dd8  mxml-3.3.tar.gz
+sha256  0c663ed1fe393b5619f80101798202eea43534abd7c8aff389022fd8c1dacc32  mxml-3.3.1.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
-sha256  ed63aec4c75b9c21a5156b40052138032269bd27fd6f4bc0c51389807cdc7db9  NOTICE
+sha256  7dedb0043b0bbed7880bcc9724b3a3dae4d5ab2dce98a7904703109572b626e3  NOTICE
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 88d35cb7ee..d224cf5308 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MXML_VERSION = 3.3
+MXML_VERSION = 3.3.1
 MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/v$(MXML_VERSION)
 MXML_LICENSE = Apache-2.0 with exceptions
 MXML_LICENSE_FILES = LICENSE NOTICE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
