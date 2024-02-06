Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDD6C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F3B981E14;
	Tue,  6 Feb 2024 12:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YY0WBpstAp5u; Tue,  6 Feb 2024 12:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A19B8228C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A19B8228C;
	Tue,  6 Feb 2024 12:58:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 987A51BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D1C260FFA
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D1C260FFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16gxXXJ1nHVk for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:58:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3F2560B9D
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3F2560B9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F26A8702C; Tue,  6 Feb 2024 12:58:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 13:58:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92de0fe754c2072780b9c33fc42a0f3467e96397
X-Git-Newrev: 6c419714117fce61e7fdcbba7fe8872a40551a63
X-Patchwork-Hint: ignore
Message-Id: <20240206125833.9F26A8702C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-marshmallow-sqlalchemy:
 bump to version 0.30.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c419714117fce61e7fdcbba7fe8872a40551a63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date update:
https://github.com/marshmallow-code/marshmallow-sqlalchemy/commit/767a8f965f8c2723b6d98cc45442df536dc8fa0a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-marshmallow-sqlalchemy.hash                              | 6 +++---
 .../python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
index d3d1b3876f..3194513dfc 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
-md5  e1b2858be2f0ce6dead48e67080631c4  marshmallow-sqlalchemy-0.29.0.tar.gz
-sha256  3523a774390ef0c1c0f7c708a7519809c5396cf608720f14f55c36f74ff5bbec  marshmallow-sqlalchemy-0.29.0.tar.gz
+md5  61e46e0ad5fabd0e9e11f895e1243bc3  marshmallow-sqlalchemy-0.30.0.tar.gz
+sha256  29ad0a4fd1b4a1e52dcb07f9673d284a6b0795141916cc2169d4ee9a5d007347  marshmallow-sqlalchemy-0.30.0.tar.gz
 # Locally computed sha256 checksums
-sha256  625df8e2758a271b4bc90525c0b6161814e0f72cb3504b03ab5206b7abf50072  LICENSE
+sha256  5f6cd082e01dda8a7c157687e196be98d68224cf41c0cee1968eb5c08e0c076a  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
index 8f176feb4d..a95e53022b 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 0.29.0
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 0.30.0
 PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow-sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/fa/0d/4dd275732213cefb4e49a86c60443cb1e3e0d0bd605625aed3fa7bb22fdd
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/5d/3f/21aa202f3df31d2d20d4ae8dfe9c7f1ce0a1eecba7003915a986a7599778
 PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
