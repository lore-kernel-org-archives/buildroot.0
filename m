Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD2AC0218D
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 15:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB49E81D18;
	Sat, 25 Jan 2025 15:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxPhFTN5NylR; Sat, 25 Jan 2025 15:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A37E481D5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A37E481D5A;
	Sat, 25 Jan 2025 15:10:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D02B1183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25C8E81CBA
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CzyKdMMs51g for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 15:10:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AA4E81C56
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AA4E81C56
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:10:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39299863FF; Sat, 25 Jan 2025 15:10:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 15:41:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8d95d0f8cd5933b5f29786b901d56b620ed4533
X-Git-Newrev: bbb52919a838079641dd6c77396e59041a973bca
X-Patchwork-Hint: ignore
Message-Id: <20250125151019.39299863FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-orjson: bump to version
 3.10.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbb52919a838079641dd6c77396e59041a973bca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index df657aacb9..d11892b4b1 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  2d093fc336be04a32f4edf27b2aca8e6e7c796521cfaf9552079b39d2ea93e06  python-orjson-3.10.14-cargo2.tar.gz
+sha256  a7ca27f4e0ea702b1d71d4e2749718e79aa35c0047f07d3e8681707c2d2aeecb  python-orjson-3.10.15-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 9b44ebcd67..29325e2f67 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.10.14
+PYTHON_ORJSON_VERSION = 3.10.15
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/92/f7/3219b56f47b4f5e864fb11cdf4ac0aaa3de608730ad2dc4c6e16382f35ec
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/ae/f9/5dea21763eeff8c1590076918a446ea3d6140743e0e36f58f369928ed0f4
 PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
