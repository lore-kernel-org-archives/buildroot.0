Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7685D10BED
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 08:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7379881FD9;
	Sat, 26 Oct 2024 08:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EvPvBBNCYah; Sat, 26 Oct 2024 08:58:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B19481FD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B19481FD7;
	Sat, 26 Oct 2024 08:58:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F7845C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 08:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 150EF81E63
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 08:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9GZtvfe1kF9U for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 08:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D515F81E6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D515F81E6C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 08:57:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE200838FE; Sat, 26 Oct 2024 08:57:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 10:49:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d679028e1d721c7b111b4c4f67914a70e8c21bbe
X-Git-Newrev: 479a07874a1472df34cfba788c91c57aba426ada
X-Patchwork-Hint: ignore
Message-Id: <20241026085746.BE200838FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-engineio: bump to version
 4.10.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=479a07874a1472df34cfba788c91c57aba426ada
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 61c0dfe47f..ecf4d2898e 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  3d1aa3e72ff50c1d779f6a6f543a438a  python_engineio-4.9.1.tar.gz
-sha256  7631cf5563086076611e494c643b3fa93dd3a854634b5488be0bba0ef9b99709  python_engineio-4.9.1.tar.gz
+md5  3e45a23dd8df2d611681cb6970c1fd27  python_engineio-4.10.1.tar.gz
+sha256  166cea8dd7429638c5c4e3a4895beae95196e860bc6f29ed0b9fe753d1ef2072  python_engineio-4.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index d291364705..49d5e298fe 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.9.1
+PYTHON_ENGINEIO_VERSION = 4.10.1
 PYTHON_ENGINEIO_SOURCE = python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/50/01/94faf505820f1fb94133a456dad87a76df589f6999de563229a342e412fa
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/9e/d2/b985b0affc5944620e1f812969322f40204f75297c5087fc4cdd44f1a14e
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
