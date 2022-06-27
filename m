Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9FAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0F4D40574;
	Mon, 27 Jun 2022 22:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0F4D40574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5xR9UReZTLPJ; Mon, 27 Jun 2022 22:43:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC432400D7;
	Mon, 27 Jun 2022 22:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC432400D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC07B1BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A231415B6
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A231415B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8KMK6H1ugUJ0 for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:40:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F374415C7
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F374415C7
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AE1B0876FB; Mon, 27 Jun 2022 22:28:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:40:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22a333f91e0a976603e98516e7f683ad0b345cc2
X-Git-Newrev: 9b7f8da96be549a52630cd87b30851d600f163a4
X-Patchwork-Hint: ignore
Message-Id: <20220627222807.AE1B0876FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sudo: bump to version 1.9.11p2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b7f8da96be549a52630cd87b30851d600f163a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file renamed and year updated with
https://github.com/sudo-project/sudo/commit/0ed92e6165c3f35d5188d1d0db04754fea023bcb
https://github.com/sudo-project/sudo/commit/d02ba52fa41fcdfdd5b6500ed81419cd077cd79b

https://www.sudo.ws/releases/stable/#1.9.11p2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.hash | 4 ++--
 package/sudo/sudo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 1b494af69c..63c98e2c4e 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: http://www.sudo.ws/download.html
-sha256  9e3b8b8da7def43b6e60c257abe80467205670fd0f7c081de1423c414b680f2d  sudo-1.9.8p2.tar.gz
+sha256  a21918eb9fc0063794f6887464fa2d924ab6d192e19063191a429605c22791d2  sudo-1.9.11p2.tar.gz
 # Locally calculated
-sha256  b678438594f04a7070a5fd125f7edffc871e13234baad318690b647bfc60705d  doc/LICENSE
+sha256  cf3a83366f9aabfd76d693ce03843106fcaaf6c76dfa97610f7c0b719a06e6bb  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index a752217123..2b9ba76a51 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.8
+SUDO_VERSION_MAJOR = 1.9.11
 SUDO_VERSION_MINOR = p2
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
-SUDO_LICENSE_FILES = doc/LICENSE
+SUDO_LICENSE_FILES = LICENSE.md
 SUDO_CPE_ID_VERSION = $(SUDO_VERSION_MAJOR)
 SUDO_CPE_ID_UPDATE = $(SUDO_VERSION_MINOR)
 SUDO_SELINUX_MODULES = sudo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
