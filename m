Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8627CF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B624580F62;
	Sun, 22 Sep 2024 10:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nt5pqphVxfBb; Sun, 22 Sep 2024 10:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F64F80C97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F64F80C97;
	Sun, 22 Sep 2024 10:37:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45C1A1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93C524063C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7zrYBx-9Hgb for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08C3640648
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08C3640648
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 047C181446; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:30:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0cdedd9c7333afc7bd387edc541174eab673c4b0
X-Git-Newrev: f8abb592997c30b77307dcd2fd50aaf11ad3fb01
X-Patchwork-Hint: ignore
Message-Id: <20240922103442.047C181446@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urwid-readline: bump to
 version 0.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8abb592997c30b77307dcd2fd50aaf11ad3fb01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add previously missing license files.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-urwid-readline/python-urwid-readline.hash | 7 +++++--
 package/python-urwid-readline/python-urwid-readline.mk   | 7 ++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-urwid-readline/python-urwid-readline.hash b/package/python-urwid-readline/python-urwid-readline.hash
index 75220e937b..946739de3e 100644
--- a/package/python-urwid-readline/python-urwid-readline.hash
+++ b/package/python-urwid-readline/python-urwid-readline.hash
@@ -1,3 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/urwid_readline/json
-md5  6e0bd170f621f0ad3edab1875bdb5c5f  urwid_readline-0.13.tar.gz
-sha256  018020cbc864bb5ed87be17dc26b069eae2755cb29f3a9c569aac3bded1efaf4  urwid_readline-0.13.tar.gz
+md5  a2ae94e6ff00eb63038c492c05f9c3db  urwid_readline-0.14.tar.gz
+sha256  8fabd2e501c124a30d38cfb10610b32f119a615ec0b310ae5591c583fb00bd09  urwid_readline-0.14.tar.gz
+# Locally computed sha256 checksums
+sha256  f1c8165a2cdb20b93abacab61fda24889e93f156bfda7fef1025cd22da59ffa8  LICENSE.md
+sha256  f1c8165a2cdb20b93abacab61fda24889e93f156bfda7fef1025cd22da59ffa8  LICENSE
diff --git a/package/python-urwid-readline/python-urwid-readline.mk b/package/python-urwid-readline/python-urwid-readline.mk
index 782c425b65..5091bca1c3 100644
--- a/package/python-urwid-readline/python-urwid-readline.mk
+++ b/package/python-urwid-readline/python-urwid-readline.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_URWID_READLINE_VERSION = 0.13
+PYTHON_URWID_READLINE_VERSION = 0.14
 PYTHON_URWID_READLINE_SOURCE = urwid_readline-$(PYTHON_URWID_READLINE_VERSION).tar.gz
-PYTHON_URWID_READLINE_SITE = https://files.pythonhosted.org/packages/ab/bb/c5b3fec22268d97ad30232f5533d4a5939d4df7ed3917a8d20d447f1d0a7
-PYTHON_URWID_READLINE_LICENSE = MIT
+PYTHON_URWID_READLINE_SITE = https://files.pythonhosted.org/packages/2f/00/347dc37f9fb328a8386961157b6a31e71d603c17f2ed3098ca6bab513689
 PYTHON_URWID_READLINE_SETUP_TYPE = setuptools
+PYTHON_URWID_READLINE_LICENSE = MIT
+PYTHON_URWID_READLINE_LICENSE_FILES = LICENSE.md LICENSE
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
