Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFDEC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 16:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11DAA81A64;
	Sun, 19 Mar 2023 16:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11DAA81A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X9CmofBby0MX; Sun, 19 Mar 2023 16:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AE1081A73;
	Sun, 19 Mar 2023 16:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AE1081A73
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA3DD1BF2F8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9298C81A6A
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9298C81A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id klpBOn_Zxqb7 for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 16:20:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEE3E81A64
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 16:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEE3E81A64
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADA00873E7; Sun, 19 Mar 2023 16:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 17:20:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5b453f47892fbb3f7c505e98cb24939161d37eb
X-Git-Newrev: 1c36821be1ffa7a55a7c87da7e224b457091c562
X-Patchwork-Hint: ignore
Message-Id: <20230319162034.ADA00873E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-marshmallow-sqlalchemy:
 bump to version 0.29.0
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
Content-Type: multipart/mixed; boundary="===============6161668023732647775=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6161668023732647775==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1c36821be1ffa7a55a7c87da7e224b457091c562
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash  | 4 ++--
 .../python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
index 6b847de94d..db061b623f 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
-md5  5e012b07ccf4ad67dbd3f38cc68cb1f4  marshmallow-sqlalchemy-0.28.1.tar.gz
-sha256  aa376747296780a56355e3067b9c8bf43a2a1c44ff985de82b3a5d9e161ca2b8  marshmallow-sqlalchemy-0.28.1.tar.gz
+md5   e1b2858be2f0ce6dead48e67080631c4 marshmallow-sqlalchemy-0.29.0.tar.gz
+sha256  3523a774390ef0c1c0f7c708a7519809c5396cf608720f14f55c36f74ff5bbec  marshmallow-sqlalchemy-0.29.0.tar.gz
 # Locally computed sha256 checksums
 sha256  625df8e2758a271b4bc90525c0b6161814e0f72cb3504b03ab5206b7abf50072  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
index 293ea29be6..8f176feb4d 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 0.28.1
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 0.29.0
 PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow-sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/eb/96/3895bde2247fa653c36d887ff08e439665668aa7c991a3924ae199be88d6
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/fa/0d/4dd275732213cefb4e49a86c60443cb1e3e0d0bd605625aed3fa7bb22fdd
 PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE

--===============6161668023732647775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6161668023732647775==--
