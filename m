Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888C5C83F1D
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 10:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 366E781911;
	Sun, 13 Jul 2025 10:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nF8Qs5NhhamA; Sun, 13 Jul 2025 10:59:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56333815AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56333815AB;
	Sun, 13 Jul 2025 10:59:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1DDE106
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 10:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7F6E60908
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 10:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IST3qi9-YoQw for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 10:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB8A5608FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB8A5608FC
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 10:59:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D05A0864E7; Sun, 13 Jul 2025 10:59:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Jul 2025 12:48:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 565ee4a9173693398800dcc3ee55cf41737c8649
X-Git-Newrev: 9135a8a5aa1cedee9f5e3b38338f3a1f12e54607
X-Patchwork-Hint: ignore
Message-Id: <20250713105928.D05A0864E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squeezelite: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=9135a8a5aa1cedee9f5e3b38338f3a1f12e54607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license hash due to various copyright year bumps:
https://github.com/ralph-irving/squeezelite/commits/master/LICENSE.txt

This version bump is needed for compatibility with the upcoming bump of
ffmpeg to version 7.1.x.

For change list, see:
https://github.com/ralph-irving/squeezelite/compare/71c012ad9ba102feb95823b7b9dc17e5305689c7...72e1fd8abfa9b2f8e9636f033247526920878718

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to change list]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/squeezelite/squeezelite.hash | 4 ++--
 package/squeezelite/squeezelite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squeezelite/squeezelite.hash b/package/squeezelite/squeezelite.hash
index 67ed4c8797..62cbe025fe 100644
--- a/package/squeezelite/squeezelite.hash
+++ b/package/squeezelite/squeezelite.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7f0342f4943d3c3498d930060f5a1e8d63ccb7282b9c21f964926e310449d592  squeezelite-71c012ad9ba102feb95823b7b9dc17e5305689c7.tar.gz
-sha256  dc01c3da33fea11ed918f9e437b88baa59c70401aab0dad747e33dd9e8035706  LICENSE.txt
+sha256  dae15fe640111895c99a3aa561a3448d3ce43ab695c2006828e621c51023b588  squeezelite-72e1fd8abfa9b2f8e9636f033247526920878718.tar.gz
+sha256  6c9ecc7ee5e0a793b04669128191cf1f250b4e9dc6e1130aa050619b39ab71d0  LICENSE.txt
diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
index b0347c4df9..40fc6df411 100644
--- a/package/squeezelite/squeezelite.mk
+++ b/package/squeezelite/squeezelite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUEEZELITE_VERSION = 71c012ad9ba102feb95823b7b9dc17e5305689c7
+SQUEEZELITE_VERSION = 72e1fd8abfa9b2f8e9636f033247526920878718
 SQUEEZELITE_SITE = $(call github,ralph-irving,squeezelite,$(SQUEEZELITE_VERSION))
 SQUEEZELITE_LICENSE = GPL-3.0
 SQUEEZELITE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
