Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF3ECD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C844610F8;
	Sun, 17 Sep 2023 12:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C844610F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ulb4lCbOdmDQ; Sun, 17 Sep 2023 12:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7916E610F0;
	Sun, 17 Sep 2023 12:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7916E610F0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A03991BF870
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A13F81EB3
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A13F81EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wx5OGspLy4WG for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:37:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C7D781E78
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C7D781E78
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B89C8713D; Sun, 17 Sep 2023 12:37:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 14:35:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e365d1768b9f1b47634ea4ff46481df32299054
X-Git-Newrev: 7a52ee04a5b10477eff6167ea2746529df9f0b69
X-Patchwork-Hint: ignore
Message-Id: <20230917123755.8B89C8713D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tk: bump to version 8.6.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a52ee04a5b10477eff6167ea2746529df9f0b69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://sourceforge.net/projects/tcl/files/Tcl/8.6.13/tcltk-release-notes-8.6.13.txt

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tk/tk.hash | 2 +-
 package/tk/tk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tk/tk.hash b/package/tk/tk.hash
index acf5e45157..968b351b41 100644
--- a/package/tk/tk.hash
+++ b/package/tk/tk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12395c1f3fcb6bed2938689f797ea3cdf41ed5cb6c4766eec8ac949560310630  tk8.6.12-src.tar.gz
+sha256  2e65fa069a23365440a3c56c556b8673b5e32a283800d8d9b257e3f584ce0675  tk8.6.13-src.tar.gz
 sha256  2cde822b93ca16ae535c954b7dfe658b4ad10df2a193628d1b358f1765e8b198  license.terms
diff --git a/package/tk/tk.mk b/package/tk/tk.mk
index 830b241f74..dfa7a7c694 100644
--- a/package/tk/tk.mk
+++ b/package/tk/tk.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TK_VERSION_MAJOR = 8.6
-TK_VERSION = $(TK_VERSION_MAJOR).12
+TK_VERSION = $(TK_VERSION_MAJOR).13
 TK_SOURCE = tk$(TK_VERSION)-src.tar.gz
 TK_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TK_VERSION)
 TK_LICENSE = TCL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
