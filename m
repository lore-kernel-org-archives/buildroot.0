Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A6FECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B42360ACE;
	Sun, 30 Oct 2022 14:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B42360ACE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjRDMAt3BOeu; Sun, 30 Oct 2022 14:06:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B933560ABA;
	Sun, 30 Oct 2022 14:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B933560ABA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B4261BF487
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 661CB401F9
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 661CB401F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6WoR-SWFEMmS for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 423174018E
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 423174018E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24A218750F; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 15:03:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4db8416ff2c9ace3c79a71ccfa3d942daadd093
X-Git-Newrev: ff89dab6a0947a45a0be11cc90f4902a5e3d037d
X-Patchwork-Hint: ignore
Message-Id: <20221030140545.24A218750F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-session: bump to
 version 2.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff89dab6a0947a45a0be11cc90f4902a5e3d037d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiohttp-session/python-aiohttp-session.hash | 4 ++--
 package/python-aiohttp-session/python-aiohttp-session.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-session/python-aiohttp-session.hash b/package/python-aiohttp-session/python-aiohttp-session.hash
index 8b44318307..efdac39007 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.hash
+++ b/package/python-aiohttp-session/python-aiohttp-session.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-session/json
-md5  797273eb5f0ef9e95fa92c6a933cf4ad  aiohttp-session-2.11.0.tar.gz
-sha256  0fdf39600f6a05c4943ef6c7b099071ca9854413111a26761626244be5015dc4  aiohttp-session-2.11.0.tar.gz
+md5  b89bde69f6f3c61a991ff408d2733838  aiohttp-session-2.12.0.tar.gz
+sha256  0ccd11a7c77cb9e5a61f4daacdc9170d561112f9cfaf9e9a2d9867c0587d1950  aiohttp-session-2.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7bc5dd2f229a6b922befb1427fd4ad2c0b255f12c1b1869370ba77520dc22bc7  LICENSE
diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index 3d59b75e3d..55bf0e87f3 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SESSION_VERSION = 2.11.0
+PYTHON_AIOHTTP_SESSION_VERSION = 2.12.0
 PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp-session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
-PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/3b/a7/0b97b9a2e3a553a86a6703f86b0e9b1afb2b262849700e8f80015c0f643f
+PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/34/87/8dbc1385c875497d6bc16c9d94e25dbd8ff62599843b73fb4048ba74c867
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
