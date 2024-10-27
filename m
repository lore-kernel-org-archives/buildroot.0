Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794ACD13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48E4D80C4A;
	Sun, 27 Oct 2024 18:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5MoQLYX9LWr; Sun, 27 Oct 2024 18:42:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5266E80D2C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5266E80D2C;
	Sun, 27 Oct 2024 18:42:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A45AEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD4BE607EC
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UpsYrW5B8mKD for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F473607C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F473607C6
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9ABDC812BF; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:14:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baa3db0c34e826cc1c6469fd8ecbfbc5c2ef2e2c
X-Git-Newrev: cf9139fe6b0dfc8fdb0fac714da9c6b60a7f219b
X-Patchwork-Hint: ignore
Message-Id: <20241027184108.9ABDC812BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-proto-plus: bump to version
 1.25.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf9139fe6b0dfc8fdb0fac714da9c6b60a7f219b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-proto-plus/python-proto-plus.hash | 4 ++--
 package/python-proto-plus/python-proto-plus.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-proto-plus/python-proto-plus.hash b/package/python-proto-plus/python-proto-plus.hash
index e9d3632275..ebf3426886 100644
--- a/package/python-proto-plus/python-proto-plus.hash
+++ b/package/python-proto-plus/python-proto-plus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/proto-plus/json
-md5  7af507ef2f7c1e512321c29ed5cf131c  proto-plus-1.24.0.tar.gz
-sha256  30b72a5ecafe4406b0d339db35b56c4059064e69227b8c3bda7462397f966445  proto-plus-1.24.0.tar.gz
+md5  f1465151dcad7bb3c4ec3271e4afbc3d  proto_plus-1.25.0.tar.gz
+sha256  fbb17f57f7bd05a68b7707e745e26528b0b3c34e378db91eef93912c54982d91  proto_plus-1.25.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
index 9ef85790d2..734c6b2003 100644
--- a/package/python-proto-plus/python-proto-plus.mk
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROTO_PLUS_VERSION = 1.24.0
-PYTHON_PROTO_PLUS_SOURCE = proto-plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
-PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/3e/fc/e9a65cd52c1330d8d23af6013651a0bc50b6d76bcbdf91fae7cd19c68f29
+PYTHON_PROTO_PLUS_VERSION = 1.25.0
+PYTHON_PROTO_PLUS_SOURCE = proto_plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
+PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/7e/05/74417b2061e1bf1b82776037cad97094228fa1c1b6e82d08a78d3fb6ddb6
 PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
 PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
 PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
