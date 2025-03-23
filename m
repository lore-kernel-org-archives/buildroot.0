Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE59C28B30
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 10:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7DCA60A6B;
	Sun, 23 Mar 2025 10:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yq4X6dgDOIBJ; Sun, 23 Mar 2025 10:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D68B060A45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D68B060A45;
	Sun, 23 Mar 2025 10:32:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24DF4E2
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 10:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D92282107
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 10:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjNtYq8MY_0F for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 10:32:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3519D820FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3519D820FF
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 10:32:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FBC48829F; Sun, 23 Mar 2025 10:32:05 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Mar 2025 11:15:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ca1ee306a3dc46430e80b7c2eb9689bdc1fbf1b
X-Git-Newrev: 96ed66f75cc92d50e8297a0da1e944085e9c718e
X-Patchwork-Hint: ignore
Message-Id: <20250323103205.1FBC48829F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-proto-plus: bump to version
 1.26.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=96ed66f75cc92d50e8297a0da1e944085e9c718e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-proto-plus/python-proto-plus.hash | 4 ++--
 package/python-proto-plus/python-proto-plus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-proto-plus/python-proto-plus.hash b/package/python-proto-plus/python-proto-plus.hash
index ebf3426886..fc8c1ad2f4 100644
--- a/package/python-proto-plus/python-proto-plus.hash
+++ b/package/python-proto-plus/python-proto-plus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/proto-plus/json
-md5  f1465151dcad7bb3c4ec3271e4afbc3d  proto_plus-1.25.0.tar.gz
-sha256  fbb17f57f7bd05a68b7707e745e26528b0b3c34e378db91eef93912c54982d91  proto_plus-1.25.0.tar.gz
+md5  12eab5f7e789e1153cd0dab5018bda09  proto_plus-1.26.0.tar.gz
+sha256  6e93d5f5ca267b54300880fff156b6a3386b3fa3f43b1da62e680fc0c586ef22  proto_plus-1.26.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
index 734c6b2003..1fe4fa3431 100644
--- a/package/python-proto-plus/python-proto-plus.mk
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROTO_PLUS_VERSION = 1.25.0
+PYTHON_PROTO_PLUS_VERSION = 1.26.0
 PYTHON_PROTO_PLUS_SOURCE = proto_plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
-PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/7e/05/74417b2061e1bf1b82776037cad97094228fa1c1b6e82d08a78d3fb6ddb6
+PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/26/79/a5c6cbb42268cfd3ddc652dc526889044a8798c688a03ff58e5e92b743c8
 PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
 PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
 PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
