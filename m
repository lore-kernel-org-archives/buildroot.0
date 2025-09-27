Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7601CCAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 10:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4537D80D62;
	Sun, 28 Sep 2025 10:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LlDzHYc5U7ah; Sun, 28 Sep 2025 10:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EFB480D67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EFB480D67;
	Sun, 28 Sep 2025 10:17:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 110E1197
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48A1F606FD
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQjaS2I5_2e6 for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 10:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AAF860744
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AAF860744
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85FB386596; Sun, 28 Sep 2025 10:17:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Sep 2025 00:12:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 696113c2b7cd0eb46e705b7c37956303e359ebeb
X-Git-Newrev: 74b502a54e9632e74ab14a57f045191ca03f2767
X-Patchwork-Hint: ignore
Message-Id: <20250928101712.85FB386596@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/utf8proc: bump version to 2.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=74b502a54e9632e74ab14a57f045191ca03f2767
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds unicode 16 support

For release note, see:
https://github.com/JuliaStrings/utf8proc/releases/tag/v2.10.0

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/utf8proc/utf8proc.hash | 2 +-
 package/utf8proc/utf8proc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utf8proc/utf8proc.hash b/package/utf8proc/utf8proc.hash
index 7fee89968d..560c6b2ccf 100644
--- a/package/utf8proc/utf8proc.hash
+++ b/package/utf8proc/utf8proc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bd215d04313b5bc42c1abedbcb0a6574667e31acee1085543a232204e36384c4  utf8proc-2.9.0.tar.gz
+sha256  276a37dc4d1dd24d7896826a579f4439d1e5fe33603add786bb083cab802e23e  utf8proc-2.10.0.tar.gz
 sha256  3b510150d34f248a221bb88e1d811238d6c6c18b51231822c42974c39bb07256  LICENSE.md
diff --git a/package/utf8proc/utf8proc.mk b/package/utf8proc/utf8proc.mk
index 42ec48e0a8..79909ec106 100644
--- a/package/utf8proc/utf8proc.mk
+++ b/package/utf8proc/utf8proc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTF8PROC_VERSION = 2.9.0
+UTF8PROC_VERSION = 2.10.0
 UTF8PROC_SITE = https://github.com/JuliaStrings/utf8proc/releases/download/v$(UTF8PROC_VERSION)
 UTF8PROC_LICENSE = MIT
 UTF8PROC_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
