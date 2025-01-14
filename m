Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA39AC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3042184D48;
	Fri, 28 Feb 2025 16:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SoGHgFnM47O0; Fri, 28 Feb 2025 16:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 337FC81332
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 337FC81332;
	Fri, 28 Feb 2025 16:58:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 093F7711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B6C548F6D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TBbEswt_kwq for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E560F42DDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E560F42DDC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9E3B8118C; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 21:31:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 521d6b851207d3f09421da7d5d979cab743ce782
X-Git-Newrev: 460c5fec652251cf17fa92552b0edf381c57ae74
X-Patchwork-Hint: ignore
Message-Id: <20250228163009.D9E3B8118C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/python-grpcio-reflection: bump to version 1.69.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=460c5fec652251cf17fa92552b0edf381c57ae74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-grpcio-reflection/python-grpcio-reflection.hash | 4 ++--
 package/python-grpcio-reflection/python-grpcio-reflection.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index a64fbeae54..afd3e50ab2 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  e9a0f06f8886b5f95da4e599b0960ef5  grpcio_reflection-1.67.1.tar.gz
-sha256  507d9785a72032816e9bb5add4a660c655813a6bc1537b957822c652c88bf458  grpcio_reflection-1.67.1.tar.gz
+md5  f1b2d22885a2a70fbcc499211059e2be  grpcio_reflection-1.69.0.tar.gz
+sha256  3474aaedfb10d8da5503135a2fb9fbb4e1f72044ad7ee2d0bf22090934e80908  grpcio_reflection-1.69.0.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index 4e8c3e8dc3..c209b093b1 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.67.1
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.69.0
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/17/61/618d56bd1f7069dea5fee8fa6efb5e6548b6edb52000ef1a7b242c0c1b04
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/bd/88/064538adae2e526f4626ad57f53a99fca5ae5013e627214093ef1d47cc35
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
