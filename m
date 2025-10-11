Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDDCCCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2872160AAC;
	Sat, 11 Oct 2025 21:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpUqUuktkBwr; Sat, 11 Oct 2025 21:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C2516064C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C2516064C;
	Sat, 11 Oct 2025 21:38:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B683612B
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C95740A1A
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NIf1TTuHBYc for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:37:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2E0140A19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2E0140A19
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:37:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD43A8703A; Sat, 11 Oct 2025 21:37:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Oct 2025 23:16:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4a505b17565641e7655e8b992da5bb6029b0ee7
X-Git-Newrev: 5e12df3e8946db46b9b18d0dfdd436a70fe6aaed
X-Patchwork-Hint: ignore
Message-Id: <20251011213758.DD43A8703A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuchess: bump to version 6.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e12df3e8946db46b9b18d0dfdd436a70fe6aaed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://cgit.git.savannah.gnu.org/cgit/chess.git/tree/ChangeLog?h=v6.3.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: add tag in release note URL]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnuchess/gnuchess.hash | 2 +-
 package/gnuchess/gnuchess.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuchess/gnuchess.hash b/package/gnuchess/gnuchess.hash
index 0248abcf71..f307ec249e 100644
--- a/package/gnuchess/gnuchess.hash
+++ b/package/gnuchess/gnuchess.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  ddfcc20bdd756900a9ab6c42c7daf90a2893bf7f19ce347420ce36baebc41890  gnuchess-6.2.9.tar.gz
+sha256  0b37bec2098c2ad695b7443e5d7944dc6dc8284f8d01fcc30bdb94dd033ca23a  gnuchess-6.3.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 630b3aefa7..1b343acc99 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUCHESS_VERSION = 6.2.9
+GNUCHESS_VERSION = 6.3.0
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_LICENSE = GPL-3.0+
 GNUCHESS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
