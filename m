Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C871DD2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 847E941385;
	Thu, 10 Oct 2024 21:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5wDQk-AOpgS; Thu, 10 Oct 2024 21:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B00F941405
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B00F941405;
	Thu, 10 Oct 2024 21:31:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23A031BF98E
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 600A4605ED
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7D8BnP07CYUU for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8764D60BE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8764D60BE0
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EE3585C67; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:18:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d210e30c3a9f52065e2d614aea1e820558f253f
X-Git-Newrev: 57a50e35d1734eb469a964e1738a50b4dabcce21
X-Patchwork-Hint: ignore
Message-Id: <20241010213043.7EE3585C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urwid-readline: bump to
 version 0.15.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=57a50e35d1734eb469a964e1738a50b4dabcce21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-urwid-readline/python-urwid-readline.hash | 4 ++--
 package/python-urwid-readline/python-urwid-readline.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid-readline/python-urwid-readline.hash b/package/python-urwid-readline/python-urwid-readline.hash
index 946739de3e..0afc4a9f85 100644
--- a/package/python-urwid-readline/python-urwid-readline.hash
+++ b/package/python-urwid-readline/python-urwid-readline.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/urwid_readline/json
-md5  a2ae94e6ff00eb63038c492c05f9c3db  urwid_readline-0.14.tar.gz
-sha256  8fabd2e501c124a30d38cfb10610b32f119a615ec0b310ae5591c583fb00bd09  urwid_readline-0.14.tar.gz
+md5  6bf957af6a09aa1f2bd76e0dab298562  urwid_readline-0.15.1.tar.gz
+sha256  9301444b86d58f7d26388506b704f142cefd193888488b4070d3a0fdfcfc0f84  urwid_readline-0.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f1c8165a2cdb20b93abacab61fda24889e93f156bfda7fef1025cd22da59ffa8  LICENSE.md
 sha256  f1c8165a2cdb20b93abacab61fda24889e93f156bfda7fef1025cd22da59ffa8  LICENSE
diff --git a/package/python-urwid-readline/python-urwid-readline.mk b/package/python-urwid-readline/python-urwid-readline.mk
index 5091bca1c3..edd49b82e0 100644
--- a/package/python-urwid-readline/python-urwid-readline.mk
+++ b/package/python-urwid-readline/python-urwid-readline.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_READLINE_VERSION = 0.14
+PYTHON_URWID_READLINE_VERSION = 0.15.1
 PYTHON_URWID_READLINE_SOURCE = urwid_readline-$(PYTHON_URWID_READLINE_VERSION).tar.gz
-PYTHON_URWID_READLINE_SITE = https://files.pythonhosted.org/packages/2f/00/347dc37f9fb328a8386961157b6a31e71d603c17f2ed3098ca6bab513689
+PYTHON_URWID_READLINE_SITE = https://files.pythonhosted.org/packages/ad/70/be318554495555eba7d8ff6e489f6f74ddb225b24086ba4af62a82e723fd
 PYTHON_URWID_READLINE_SETUP_TYPE = setuptools
 PYTHON_URWID_READLINE_LICENSE = MIT
 PYTHON_URWID_READLINE_LICENSE_FILES = LICENSE.md LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
