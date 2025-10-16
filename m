Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A425CCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 20:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE0D840660;
	Thu, 16 Oct 2025 20:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6N1_OVfIJOlN; Thu, 16 Oct 2025 20:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BCF140667
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BCF140667;
	Thu, 16 Oct 2025 20:39:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F137D8
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45A6640381
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfwM0US1sqG4 for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 20:38:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97B574035C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97B574035C
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:38:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 751748738E; Thu, 16 Oct 2025 20:38:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 22:35:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b5a9e76837ae3ea99b32a1ce330361c6fc09503
X-Git-Newrev: 828a63c5fc69a3acca8053ddcac12b9d12a2b0d1
X-Patchwork-Hint: ignore
Message-Id: <20251016203859.751748738E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-oauthlib: bump version to
 3.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=828a63c5fc69a3acca8053ddcac12b9d12a2b0d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/oauthlib/oauthlib/releases/tag/v3.3.0
https://github.com/oauthlib/oauthlib/releases/tag/v3.3.1

Updated license hash due to upstream commits:
https://github.com/oauthlib/oauthlib/commit/1137a2fbedb586f105c6512dabe3da17d0f8f88a
https://github.com/oauthlib/oauthlib/commit/059875a888d2200e43e18b818eda8442b2c3d0cc

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-oauthlib/python-oauthlib.hash | 6 +++---
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index 6a2ad003e1..5ee9a0ce05 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/oauthlib/json
-md5  2f7b898cc1af8c1409cc329e8843ea8f  oauthlib-3.2.2.tar.gz
-sha256  9859c40929662bec5d64f34d01c99e093149682a3f38915dc0655d5a633dd918  oauthlib-3.2.2.tar.gz
+md5  856bc51662afb26ac58b1d7742606b2e  oauthlib-3.3.1.tar.gz
+sha256  0f0f8aa759826a193cf66c12ea1af1637f87b9b4622d46e866952bb022e538c9  oauthlib-3.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256  3d1e12d8ac52c0b6c148af6d291f72400b8720ed16c0ac4a89868b6d14b1c939  LICENSE
+sha256  0028aa4763a8a0b09ca4c68d585263474cf9aaa6ec69ffbef3a31a9eccdd3b91  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index eb0ccbf46f..bbf59acedb 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 3.2.2
+PYTHON_OAUTHLIB_VERSION = 3.3.1
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/6d/fa/fbf4001037904031639e6bfbfc02badfc7e12f137a8afa254df6c4c8a670
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/0b/5f/19930f824ffeb0ad4372da4812c50edbd1434f678c90c2733e1188edfc63
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
