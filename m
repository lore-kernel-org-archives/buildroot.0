Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A70EC67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2B1940490;
	Mon,  8 Apr 2024 21:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2MQe53JSBtth; Mon,  8 Apr 2024 21:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA419408C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA419408C5;
	Mon,  8 Apr 2024 21:01:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F13641BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE5E560B74
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ef0SMQX7u23V for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E11E60B63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E11E60B63
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:01:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 066CA85D0A; Mon,  8 Apr 2024 21:01:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Apr 2024 22:59:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9e3579555d3cccac1b5ecda0c9de375b8056d11
X-Git-Newrev: 0f2d16b277e038c63e6cbbf65296c94dd88db4d9
X-Patchwork-Hint: ignore
Message-Id: <20240408210131.066CA85D0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urwid: bump to version
 2.6.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f2d16b277e038c63e6cbbf65296c94dd88db4d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://urwid.org/changelog.html#release-2-6-10

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index 3d7be017a7..aad6f6f672 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  f7f4e6bed9ba38965dbd619520f39287  urwid-2.1.2.tar.gz
-sha256  588bee9c1cb208d0906a9f73c613d2bd32c3ed3702012f51efe318a3f2127eae  urwid-2.1.2.tar.gz
+md5  324cf0f877a5bc7b7d2de7d7f36b13ee  urwid-2.6.10.tar.gz
+sha256  ae33355c414c13214e541d3634f3c8a0bfb373914e62ffbcf2fa863527706321  urwid-2.6.10.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index 78b369ef86..d7943a8b5c 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 2.1.2
+PYTHON_URWID_VERSION = 2.6.10
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/94/3f/e3010f4a11c08a5690540f7ebd0b0d251cc8a456895b7e49be201f73540c
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/8e/74/8c2082f2b07a72ff5d2438447c13a70f0cbede73584e0a262c166a30785c
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
+PYTHON_URWID_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
