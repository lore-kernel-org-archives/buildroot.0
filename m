Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036A5C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 09:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A90434012F;
	Sat,  1 Jan 2022 09:55:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5eYl836H_Fmy; Sat,  1 Jan 2022 09:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 761FD400D9;
	Sat,  1 Jan 2022 09:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7A341BF5A8
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AE9560DE5
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jL4hWLZXK3W9 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEBF160E1B
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9D257813B7; Sat,  1 Jan 2022 09:48:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 10:50:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f72c1355f09b67fe353a728eb9eef7baeb8837bd
X-Git-Newrev: b9dbed1ca6aaaecf9de63f9f6b20ccaf41897d7b
X-Patchwork-Hint: ignore
Message-Id: <20220101094828.9D257813B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-session: bump to
 version 2.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9dbed1ca6aaaecf9de63f9f6b20ccaf41897d7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to full text removal:
https://github.com/aio-libs/aiohttp-session/commit/6a1c7f0efe006425b5387b089f4d39bc48765ed7

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-aiohttp-session/python-aiohttp-session.hash | 6 +++---
 package/python-aiohttp-session/python-aiohttp-session.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp-session/python-aiohttp-session.hash b/package/python-aiohttp-session/python-aiohttp-session.hash
index f10827b616..3842f0c7af 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.hash
+++ b/package/python-aiohttp-session/python-aiohttp-session.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-session/json
-md5	993ec277ece4765472d0edc0f6c0bba3  aiohttp-session-2.9.0.tar.gz
-sha256	959413468b84e30e7ca09719617cfb0000066a2e0f6c20062d043433e82aeb74  aiohttp-session-2.9.0.tar.gz
+md5  d57d463a9db13b681f7924b38aa77f64  aiohttp-session-2.10.0.tar.gz
+sha256  2af19af9f435937baacbb6420f887b21e5021bb34be146c2702c58e6ebf6b76b  aiohttp-session-2.10.0.tar.gz
 # Locally computed sha256 checksums
-sha256	2a86817fedf0c52baaa47d7dd975073639dfaaebd37312bd279de54d7f841791  LICENSE
+sha256  7bc5dd2f229a6b922befb1427fd4ad2c0b255f12c1b1869370ba77520dc22bc7  LICENSE
diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index fa724fdb86..a28b1ae143 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SESSION_VERSION = 2.9.0
+PYTHON_AIOHTTP_SESSION_VERSION = 2.10.0
 PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp-session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
-PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/f8/fe/53dfd35f5c7fcc7f2d0866cb29e722303e3fae7f749c1f3d4d11d361dc38
+PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/d6/3f/ab6288e8bbf4a9ae63ea0d3d5711bccc3a6dad1cb85a420c14fdeabc209e
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
