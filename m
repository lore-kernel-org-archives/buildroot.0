Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EB3C54EED
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 21:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B045D41517;
	Sun, 29 Jan 2023 21:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B045D41517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ENPuqPKS21h; Sun, 29 Jan 2023 21:30:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A282741619;
	Sun, 29 Jan 2023 21:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A282741619
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D23F1BF576
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34047818C0
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34047818C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPAEHul1bnnq for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 21:30:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42592817C0
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 21:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42592817C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 161897FEDB; Sun, 29 Jan 2023 21:30:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 22:29:08 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 080ad9aedaa135f3fc0dd46b5275364b39560b8f
X-Git-Newrev: 677fbb43b747cd9ec156dc231c6417420873b53e
X-Patchwork-Hint: ignore
Message-Id: <20230129213007.161897FEDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sudo: bump to
 version 1.9.11p2
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

commit: https://git.buildroot.net/buildroot/commit/?id=677fbb43b747cd9ec156dc231c6417420873b53e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

License file renamed and year updated with
https://github.com/sudo-project/sudo/commit/0ed92e6165c3f35d5188d1d0db04754fea023bcb
https://github.com/sudo-project/sudo/commit/d02ba52fa41fcdfdd5b6500ed81419cd077cd79b

https://www.sudo.ws/releases/stable/#1.9.11p2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9b7f8da96be549a52630cd87b30851d600f163a4)
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
index 44a17dd348..cff23fe9e7 100644
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
