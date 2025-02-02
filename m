Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BF6C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 630B970786;
	Fri, 28 Feb 2025 17:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6J1FMOB_0Cy; Fri, 28 Feb 2025 17:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 608DE70699
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 608DE70699;
	Fri, 28 Feb 2025 17:07:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12AC11DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15AB141970
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9KGyE6AUkzN for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27D4A42EFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27D4A42EFD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D93B867B4; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 2 Feb 2025 12:35:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1bc34cded87ea5565f692ee5e79ae05fb82cc8f9
X-Git-Newrev: dfa0e723cdc252120d438862b7e682efcfc8b98e
X-Patchwork-Hint: ignore
Message-Id: <20250228163024.1D93B867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libbroadvoice: bump
 version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dfa0e723cdc252120d438862b7e682efcfc8b98e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libbroadvoice/libbroadvoice.hash | 2 +-
 package/libbroadvoice/libbroadvoice.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbroadvoice/libbroadvoice.hash b/package/libbroadvoice/libbroadvoice.hash
index 9115a38e07..b07bcce0c9 100644
--- a/package/libbroadvoice/libbroadvoice.hash
+++ b/package/libbroadvoice/libbroadvoice.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  39fd8a5f76598f2cb23b759bcd458a45a99e6ff830471576a2485c98b2ab1e48  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564.tar.gz
+sha256  28a97b96ceb5e290184d8b6169fddc15fe37df34c75a87c2b0d03076e475e353  libbroadvoice-03dd05df52f093bbf7820e68707f3a3668e73507.tar.gz
 sha256  2550586c993ce4a8c23c8b11968ea36192116a896a2504799cc65307d769c094  COPYING
diff --git a/package/libbroadvoice/libbroadvoice.mk b/package/libbroadvoice/libbroadvoice.mk
index 69e235e84e..77bc85786c 100644
--- a/package/libbroadvoice/libbroadvoice.mk
+++ b/package/libbroadvoice/libbroadvoice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBROADVOICE_VERSION = f65b0f50c8c767229fbf1758370880abc0d78564
+LIBBROADVOICE_VERSION = 03dd05df52f093bbf7820e68707f3a3668e73507
 # we use the FreeSwitch fork because (quoting README):
 # "This library is based on the Broadcom reference code, but has been
 # heavily modified so that it builds into a proper library, with a clean
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
