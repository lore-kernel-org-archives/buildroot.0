Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11032C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:01:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D353361165
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D353361165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF8F4081B;
	Wed, 13 Oct 2021 20:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rKaGm_VrrGyo; Wed, 13 Oct 2021 20:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1972B4085A;
	Wed, 13 Oct 2021 20:01:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EA861BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59C2F60D69
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id df1mJPBaClub for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 20:00:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72A5360D70
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 20:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BE44C95BC7; Wed, 13 Oct 2021 19:57:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 21:54:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05e963d777eff36e8225a6b357c660370c73c418
X-Git-Newrev: 7e439c0f370dc4a54c6bdb0d8c9cd95b56332c87
X-Patchwork-Hint: ignore
Message-Id: <20211013195727.BE44C95BC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-u-msgpack: bump to version
 2.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e439c0f370dc4a54c6bdb0d8c9cd95b56332c87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash change due to date update:
https://github.com/vsergeev/u-msgpack-python/commit/8599cae6bc970effe069e3ed955af1c64dab9106

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-u-msgpack/python-u-msgpack.hash | 8 ++++----
 package/python-u-msgpack/python-u-msgpack.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-u-msgpack/python-u-msgpack.hash b/package/python-u-msgpack/python-u-msgpack.hash
index 70c67c7283..0891783985 100644
--- a/package/python-u-msgpack/python-u-msgpack.hash
+++ b/package/python-u-msgpack/python-u-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/u-msgpack-python/json
-md5	bbeedd924f3d8c8ee90611914b3594e6  u-msgpack-python-2.5.2.tar.gz
-sha256	09c85a8af77376034396681e76bf30c249a4fd8e5ebb239f8a468d3655f210d0  u-msgpack-python-2.5.2.tar.gz
-# Locally computed sha256
-sha256	0603a3e697a80b13640e3023bb534727f683ada5c4b0b0149d001ec5272d64f4  LICENSE
+md5  8691cea6bc7b44bce6e2115260a54323  u-msgpack-python-2.7.1.tar.gz
+sha256  b7e7d433cab77171a4c752875d91836f3040306bab5063fb6dbe11f64ea69551  u-msgpack-python-2.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  268ae7b7efbf67cd7bc0a9efea844fcf448d03f9cc6b8c79e8fe311815985030  LICENSE
diff --git a/package/python-u-msgpack/python-u-msgpack.mk b/package/python-u-msgpack/python-u-msgpack.mk
index 6d98e55221..e0a3b3f297 100644
--- a/package/python-u-msgpack/python-u-msgpack.mk
+++ b/package/python-u-msgpack/python-u-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_U_MSGPACK_VERSION = 2.5.2
+PYTHON_U_MSGPACK_VERSION = 2.7.1
 PYTHON_U_MSGPACK_SOURCE = u-msgpack-python-$(PYTHON_U_MSGPACK_VERSION).tar.gz
-PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/75/c4/d9404382d0f7d9be27b5d13498d033a4faa83f325b3893e1c29a0faa83b9
+PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/62/94/a4f485b628310534d377b3e7cb6f85b8066dc823dbff0e4421fb4227fb7e
 PYTHON_U_MSGPACK_SETUP_TYPE = setuptools
 PYTHON_U_MSGPACK_LICENSE = MIT
 PYTHON_U_MSGPACK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
