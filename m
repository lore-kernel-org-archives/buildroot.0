Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71BCC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6424442011;
	Fri, 17 Dec 2021 17:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4NFE-iIqemiI; Fri, 17 Dec 2021 17:47:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E7934205B;
	Fri, 17 Dec 2021 17:47:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FF7D1BF2AF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4686C60E74
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LfOoOjcmhbNZ for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:45:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FB1F6113E
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 72F3D82226; Fri, 17 Dec 2021 17:40:24 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 18:42:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cf314745ad2e4f684aa07566163e46655ffcc5b
X-Git-Newrev: cbe87226800f75ab76104d1ac2827a31dd137523
X-Patchwork-Hint: ignore
Message-Id: <20211217174024.72F3D82226@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcllib: bump to version 1.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbe87226800f75ab76104d1ac2827a31dd137523
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license.terms (reformatting with
https://github.com/tcltk/tcllib/commit/628ec67635e48f611c5462b7c574e44cd301f83e)

https://core.tcl-lang.org/tcllib/doc/tcllib-1-20/support/releases/history/README-1.20.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tcllib/tcllib.hash | 6 ++++--
 package/tcllib/tcllib.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/tcllib/tcllib.hash b/package/tcllib/tcllib.hash
index d08b5a172a..fb80841998 100644
--- a/package/tcllib/tcllib.hash
+++ b/package/tcllib/tcllib.hash
@@ -1,3 +1,5 @@
+# From https://core.tcl-lang.org/tcllib/uv/tcllib-1.20.SHA256
+sha256  199e8ec7ee26220e8463bc84dd55c44965fc8ef4d4ac6e4684b2b1c03b1bd5b9  tcllib-1.20.tar.xz
+
 # Locally computed:
-sha256  0db9e17d6c0f44d3ca2df2ea5023e35c0f3767e7008c3cb26d201446eb68add1  tcllib-1.13.tar.bz2
-sha256  530ec70eb11a455bd582d86b6d74c2dd7cc367d90b8bbdd59fcb43ae02f95a4b  license.terms
+sha256  38e1f556213f4008cfd280457af57c76a1fe043dc026ece1c704c09b5f6e865c  license.terms
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
index dfa35c8941..0f60eb8aca 100644
--- a/package/tcllib/tcllib.mk
+++ b/package/tcllib/tcllib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TCLLIB_VERSION = 1.13
-TCLLIB_SOURCE = tcllib-$(TCLLIB_VERSION).tar.bz2
+TCLLIB_VERSION = 1.20
+TCLLIB_SOURCE = tcllib-$(TCLLIB_VERSION).tar.xz
 TCLLIB_SITE = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
 TCLLIB_LICENSE = TCL
 TCLLIB_LICENSE_FILES = license.terms
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
