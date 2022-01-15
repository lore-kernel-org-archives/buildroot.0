Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA49C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9166828BA;
	Sat, 15 Jan 2022 11:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ep57SQLXVdxi; Sat, 15 Jan 2022 11:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1963282846;
	Sat, 15 Jan 2022 11:03:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F18D31BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8F2760A8F
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJ3QzAwwSJuF for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1519660AC0
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3C52082911; Sat, 15 Jan 2022 10:55:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 12:00:28 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 1de8b3afe12c40fd127011b888f1c7f55b2227ff
X-Git-Newrev: e0743af30a8cc51cf669638e93df26fe9cf3768d
X-Patchwork-Hint: ignore
Message-Id: <20220115105522.3C52082911@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/mutt: bump to
 version 2.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0743af30a8cc51cf669638e93df26fe9cf3768d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Mutt 2.1.4 was released on December 11, 2021. This is a bug-fix release,
fixing a performance issue when used with DavMail.

Mutt 2.1.3 was released on September 10, 2021. This is a bug-fix
release, fixing some of the fixes in the last release. IMAP and
QRESYNC users are advised to upgrade.

Mutt 2.1.2 was released on August 24, 2021. This is an important bug-fix
release, fixing a potential data-loss IMAP bug, a couple QRESYNC bugs,
and a few other issues. IMAP users are strongly advised to upgrade.

http://www.mutt.org
https://gitlab.com/muttmua/mutt/-/blob/mutt-2-1-4-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7686a1382f97b8c2b2de00a8bc20e7208a2123b7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 1b58c50065..dceae57b65 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4ae6d60f7f19854c375cc1c27b5768b71e9f450c2adc10c22e45de8a27de524a  mutt-2.1.1.tar.gz
+sha256  3361b682ea23df88961fa9835196698aefd2ebf0aba494599b29d1c4b1b4db79  mutt-2.1.4.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 66616f032c..44d7864eb6 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.1.1
+MUTT_VERSION = 2.1.4
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
