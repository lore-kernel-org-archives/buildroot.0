Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E67FC4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3FC841E55;
	Tue,  6 Feb 2024 10:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3FC841E55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ODGRaH8_KZap; Tue,  6 Feb 2024 10:20:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53AC541E59;
	Tue,  6 Feb 2024 10:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53AC541E59
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 933BC1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 787AA41E5D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 787AA41E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbBptwH8MAnF for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:20:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABDEB41E51
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABDEB41E51
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95A0D86F40; Tue,  6 Feb 2024 10:20:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 11:17:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e1aa3be0534bcde65d7ab3af9980c9bdd511317
X-Git-Newrev: 3c2f84e70f592bb3986b5696d9a3e8c8d5268822
X-Patchwork-Hint: ignore
Message-Id: <20240206102053.95A0D86F40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-colorlog: bump to version
 6.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c2f84e70f592bb3986b5696d9a3e8c8d5268822
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-colorlog/python-colorlog.hash | 4 ++--
 package/python-colorlog/python-colorlog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
index f4d0dd4c0e..9df94b19ba 100644
--- a/package/python-colorlog/python-colorlog.hash
+++ b/package/python-colorlog/python-colorlog.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorlog/json
-md5  80b79f7824d39d4f3b11c75d1cba094e  colorlog-6.7.0.tar.gz
-sha256  bd94bd21c1e13fac7bd3153f4bc3a7dc0eb0974b8bc2fdf1a989e474f6e582e5  colorlog-6.7.0.tar.gz
+md5  805e982037ba071d3d42c3d53cf73fd8  colorlog-6.8.0.tar.gz
+sha256  fbb6fdf9d5685f2517f388fb29bb27d54e8654dd31f58bc2a3b217e967a95ca6  colorlog-6.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b1d9082bc483623fd59fc7279b457f0e40d942a76426cde257239e04dfe4125a  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index 12a1c8ec77..f96318ce5a 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORLOG_VERSION = 6.7.0
+PYTHON_COLORLOG_VERSION = 6.8.0
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/78/6b/4e5481ddcdb9c255b2715f54c863629f1543e97bc8c309d1c5c131ad14f2
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/1f/b0/e4e3850d43f5429f9e53404056d705117fbb8a4d9e755425e762a9f68317
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
