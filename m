Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C6DCEBF8D
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF063612D5;
	Mon, 17 Nov 2025 19:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2b60zK2fu1D; Mon, 17 Nov 2025 19:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FC8260F13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FC8260F13;
	Mon, 17 Nov 2025 19:51:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D2282D3
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F32D60F4A
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyfZzEv-klOh for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DC7560F36
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DC7560F36
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C46D84905; Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 17:43:24 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e5d7805ea7b1952052e4bec3b47a13fb738110e6
X-Git-Newrev: 590ccc69a1cf7f51f9b2bf4e6c349b8c536d6d63
X-Patchwork-Hint: ignore
Message-Id: <20251117195127.4C46D84905@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/python-flask-cors: remove license file
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=590ccc69a1cf7f51f9b2bf4e6c349b8c536d6d63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Upstream tarball does not contain a license file anymore since version
5.0.1 [1] which causes errors after buildroot commit
04cd135b26406dcc31cb66af1480d53fffe81e59 which bumped the package
version from 5.0.0 to 6.0.1.

Fixes:
https://autobuild.buildroot.net/results/1eb/1eb9d68616793c9241bcb55bc2ea1929608c68bd/

[1] https://github.com/corydolphin/flask-cors/issues/382

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9f3e222e9927b17409bbc28bb1afaad730ba531d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-flask-cors/python-flask-cors.hash | 2 --
 package/python-flask-cors/python-flask-cors.mk   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index 7070b5462e..974d4a7a9e 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,5 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flask-cors/json
 md5  2879503d54f25a4cacb62f7060b96e14  flask_cors-6.0.1.tar.gz
 sha256  d81bcb31f07b0985be7f48406247e9243aced229b7747219160a0559edd678db  flask_cors-6.0.1.tar.gz
-# Locally computed sha256 checksums
-sha256  6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index 26198e6fb4..c7bc338867 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -9,7 +9,6 @@ PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
 PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/76/37/bcfa6c7d5eec777c4c7cf45ce6b27631cebe5230caf88d85eadd63edd37a
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
-PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
 PYTHON_FLASK_CORS_CPE_ID_VENDOR = flask-cors_project
 PYTHON_FLASK_CORS_CPE_ID_PRODUCT = flask-cors
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
