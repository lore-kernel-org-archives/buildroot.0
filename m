Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B36C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C141D83CC3;
	Sat, 31 May 2025 16:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q43MBUklN5mf; Sat, 31 May 2025 16:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0E5883D54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0E5883D54;
	Sat, 31 May 2025 16:55:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 311EC235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C830D401D4
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vIVhCiGYjHb for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FB4E401E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FB4E401E7
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E4B287578; Sat, 31 May 2025 16:55:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:37:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a7ba0600c500ad9f85d42de93c3ab48f6ae642c2
X-Git-Newrev: 89b4453ce6c3b1c30a23af44b879d4f2deaab107
X-Patchwork-Hint: ignore
Message-Id: <20250531165509.8E4B287578@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/protobuf-c: bump
 to version 1.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=89b4453ce6c3b1c30a23af44b879d4f2deaab107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes:
https://github.com/protobuf-c/protobuf-c/releases/tag/v1.5.2

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0a645c7592e31593cc10f9b179243f9e914a439e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/protobuf-c/protobuf-c.hash | 2 +-
 package/protobuf-c/protobuf-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
index ea7262028c..c7eee9e7e1 100644
--- a/package/protobuf-c/protobuf-c.hash
+++ b/package/protobuf-c/protobuf-c.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  20d1dc257da96f8ddff8be4dd9779215bbd0a6069ed53bbe9de38fa7629be06b  protobuf-c-1.5.1.tar.gz
+sha256  e2c86271873a79c92b58fef7ebf8de1aa0df4738347a8bd5d4e65a80a16d0d24  protobuf-c-1.5.2.tar.gz
 sha256  2d1d028bd27f8c85bc970d720519d2069ca6213fcb26b9dea444a7c39d24bbb3  LICENSE
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index b1e8c25496..3df6a2edad 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = 1.5.1
+PROTOBUF_C_VERSION = 1.5.2
 PROTOBUF_C_SITE = https://github.com/protobuf-c/protobuf-c/releases/download/v$(PROTOBUF_C_VERSION)
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
