Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615FCC71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 20:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34D0460844;
	Sun, 15 Jun 2025 20:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ht0XtOd81-26; Sun, 15 Jun 2025 20:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A45060716
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A45060716;
	Sun, 15 Jun 2025 20:33:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C7F91A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A2E4401CB
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zm6vdVDIVJW0 for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 20:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C286D40086
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C286D40086
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:33:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAC8F83A5C; Sun, 15 Jun 2025 20:33:13 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 22:32:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2c65b455aa24e3bd0d5e84edb8cc1d9f6514b17
X-Git-Newrev: 30e4f03e90ee3dacb59cd1e184e4ef3b0341ceab
X-Patchwork-Hint: ignore
Message-Id: <20250615203313.BAC8F83A5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/z3: bump to version 4.15.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=30e4f03e90ee3dacb59cd1e184e4ef3b0341ceab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 4.13.3, see:
https://github.com/Z3Prover/z3/blob/z3-4.15.1/RELEASE_NOTES.md#version-4151

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index 8514043594..a6a421b4e7 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f59c9cf600ea57fb64ffeffbffd0f2d2b896854f339e846f48f069d23bc14ba0  z3-4.13.3.tar.gz
+sha256  ebf6eed5f2cb217d62abddaa94526189ae40bf3c415fb9c2e2128e099f16fda0  z3-4.15.1.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index 16db30ac21..22947e93cc 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.13.3
+Z3_VERSION = 4.15.1
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
