Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2139CCD184
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 10:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B249340CB9;
	Sat, 18 Oct 2025 10:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNqaoteMzPdm; Sat, 18 Oct 2025 10:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C87C640A8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C87C640A8A;
	Sat, 18 Oct 2025 10:52:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB72843F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55F8960BBC
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1JatLJg45Zb for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 10:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FAFB60BB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FAFB60BB1
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:52:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4086E872FC; Sat, 18 Oct 2025 10:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 12:48:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c81812becb6c92cf17f9c3d67cd083598cb505a2
X-Git-Newrev: c41f5e2edde466ef79885f3a88322365a44e6d0d
X-Patchwork-Hint: ignore
Message-Id: <20251018105242.4086E872FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uvicorn: bump to 0.37.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c41f5e2edde466ef79885f3a88322365a44e6d0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to adding new author name in [1].
Website changed to https://uvicorn.dev/.

Release Notes: https://github.com/Kludex/uvicorn/blob/main/docs/release-notes.md#0370-september-23-2025

[1] https://github.com/Kludex/uvicorn/commit/fe50e5d9933fc09c347b991d6376c02ada3f0f21

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-uvicorn/Config.in           | 2 +-
 package/python-uvicorn/python-uvicorn.hash | 6 +++---
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-uvicorn/Config.in b/package/python-uvicorn/Config.in
index c84f54781f..f4ac466227 100644
--- a/package/python-uvicorn/Config.in
+++ b/package/python-uvicorn/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PYTHON_UVICORN
 	help
 	  The lightning-fast ASGI server.
 
-	  https://www.uvicorn.org/
+	  https://uvicorn.dev/
diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index ef5e157433..0200c61321 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  22172516b080e47aa8c8c3936f16e18b  uvicorn-0.35.0.tar.gz
-sha256  bc662f087f7cf2ce11a1d7fd70b90c9f98ef2e2831556dd078d131b96cc94a01  uvicorn-0.35.0.tar.gz
+md5  21c0c2aa9aa90950e4bdda1ab365f0b9  uvicorn-0.37.0.tar.gz
+sha256  4115c8add6d3fd536c8ee77f0e14a7fd2ebba939fed9b02583a97f80648f9e13  uvicorn-0.37.0.tar.gz
 # Locally computed sha256 checksums
-sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
+sha256  6e40f231fbf861db5bb27f728c47340c69eea8bb864f624f49df892fa02adfaf  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 0cb0077200..dfb80cafae 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.35.0
+PYTHON_UVICORN_VERSION = 0.37.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/5e/42/e0e305207bb88c6b8d3061399c6a961ffe5fbb7e2aa63c9234df7259e9cd
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/71/57/1616c8274c3442d802621abf5deb230771c7a0fec9414cb6763900eb3868
 PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
