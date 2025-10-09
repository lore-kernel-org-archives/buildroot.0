Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005E7CCD188
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6BF0613A3;
	Thu,  9 Oct 2025 10:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6z5RiGTCi0P; Thu,  9 Oct 2025 10:16:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 286226132A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 286226132A;
	Thu,  9 Oct 2025 10:16:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA0D4119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DFC483C34
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8DWxxzDKbqF for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF1E83C37
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BF1E83C37
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59FF0866FA; Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:40:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 56ca3cf0591717c3293708a50d86a78a9b71be86
X-Git-Newrev: 4694ada21fde406b1334a9ba0cf1531d8b48e7cf
X-Patchwork-Hint: ignore
Message-Id: <20251009101600.59FF0866FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/fetchmail:
 security bump version to 6.5.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=4694ada21fde406b1334a9ba0cf1531d8b48e7cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/59241831/

CVE pending assignment by MITRE:
https://fetchmail.sourceforge.io/fetchmail-SA-2025-01.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7cb507b31c7eb815e0446ff8ba9bc45e83783072)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index c4b968a89a..9408aacacc 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59238340/
-sha256  f989b62729c76afbcd65ec43b9c477f2d990f0913da141ff8166aa4e2bf56025  fetchmail-6.5.5.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59241831/
+sha256  ec10e0e0eaa417313559379ede76c74614766d838b39470b66474863aa690dab  fetchmail-6.5.6.tar.xz
 # Locally computed:
 sha256  a502ffd59034feee7e924b29500451b984992ae361bd8084736afc470f32135a  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 3eec63f071..e7539c5d98 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.5
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).5
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).6
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
