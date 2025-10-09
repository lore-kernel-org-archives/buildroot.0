Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7ABCCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00B6161319;
	Thu,  9 Oct 2025 10:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q64DpZgwgVEg; Thu,  9 Oct 2025 10:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1A7B6131B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A7B6131B;
	Thu,  9 Oct 2025 10:06:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03BC921B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54E4940FBB
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIM9LjbO30QD for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2DEF40FA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2DEF40FA5
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0B0786D29; Thu,  9 Oct 2025 10:06:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:37:52 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 82dfc95024a1697988a05b9b63e705e1e72d1c75
X-Git-Newrev: 8321038332eb3f685575616bbfcb0f469d06f704
X-Patchwork-Hint: ignore
Message-Id: <20251009100623.D0B0786D29@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/fetchmail: bump
 version to 6.5.5
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8321038332eb3f685575616bbfcb0f469d06f704
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/59238340/

The COPYING license file was updated in:
https://sourceforge.net/p/fetchmail/git/ci/e6597cee1e5261e19106f0f47d11636dcf4161ed/
https://sourceforge.net/p/fetchmail/git/ci/a408d51154616e992be6463b2e75c19f6115ec1a/
This commit updates its hash accordingly.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: fix COPYING license file hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8082b26a2be1669d9d55b19873d2b2b5e99c77b0)
[Thomas: pick to include the 6.5.6 security bump]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/fetchmail/fetchmail.hash | 6 +++---
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 71c0756b15..c4b968a89a 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59196377/
-sha256  c859156e9bff841d4d984cb3fdcb8042b6b31789fc3387c2649baa95a88d698b  fetchmail-6.5.4.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59238340/
+sha256  f989b62729c76afbcd65ec43b9c477f2d990f0913da141ff8166aa4e2bf56025  fetchmail-6.5.5.tar.xz
 # Locally computed:
-sha256  e5768c44445cf051dd88e0cf8bfc16d81f7b1a7cc28f4e0204a4f8d81cd16977  COPYING
+sha256  a502ffd59034feee7e924b29500451b984992ae361bd8084736afc470f32135a  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 90345edf62..3eec63f071 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.5
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).4
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).5
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
