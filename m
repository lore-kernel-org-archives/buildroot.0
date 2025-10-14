Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4DECCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 22:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B734961420;
	Tue, 14 Oct 2025 22:00:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqtMTSHp7Bnp; Tue, 14 Oct 2025 22:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC87C613B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC87C613B9;
	Tue, 14 Oct 2025 22:00:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DBD81C9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 403DD406F6
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pA0xX4txNb8u for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 22:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B739840641
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B739840641
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4FF487100; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 23:58:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdb107998ed4fcbcf52d3a4afaf9043f4abb92c8
X-Git-Newrev: 0e4abf4845fc6b65d378cd38c3271ec04c6320c6
X-Patchwork-Hint: ignore
Message-Id: <20251014220002.B4FF487100@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tornado: bump version to
 6.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e4abf4845fc6b65d378cd38c3271ec04c6320c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 7ec58cbe7d..0c8e401ff0 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  e3e3d74e2fedffacdacd8626d0c17a37  tornado-6.5.1.tar.gz
-sha256  84ceece391e8eb9b2b95578db65e920d2a61070260594819589609ba9bc6308c  tornado-6.5.1.tar.gz
+md5  dbf1f706f0a1efd9ed3dad8d82b7e865  tornado-6.5.2.tar.gz
+sha256  ab53c8f9a0fa351e2c0741284e06c7a45da86afb544133201c5cc8578eb076a0  tornado-6.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index ee833938bd..800a5d775d 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.5.1
+PYTHON_TORNADO_VERSION = 6.5.2
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/51/89/c72771c81d25d53fe33e3dca61c233b665b2780f21820ba6fd2c6793c12b
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/09/ce/1eb500eae19f4648281bb2186927bb062d2438c2e5093d1360391afd2f90
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
