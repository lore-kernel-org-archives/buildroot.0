Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86F5C83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABDB060E9C;
	Fri,  4 Jul 2025 06:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMwRLQuk22ok; Fri,  4 Jul 2025 06:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4CD560BAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4CD560BAB;
	Fri,  4 Jul 2025 06:24:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EC381EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FEF860AF5
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xCj4jEOa3VC for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ABAB60AF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ABAB60AF2
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68CAA85E0B; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 10:53:39 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 01c2d423443f6a1ef9b97f8cc4446a3f643803cb
X-Git-Newrev: 4aad0cdeef33fd8b9a2d50bba3a1f75aac153077
X-Patchwork-Hint: ignore
Message-Id: <20250704062432.68CAA85E0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/python-dotenv:
 bump to 1.1.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4aad0cdeef33fd8b9a2d50bba3a1f75aac153077
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Release notes:
https://github.com/theskumar/python-dotenv/releases/tag/v1.1.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2286b6dd1b098ef908e6adc02a52690d85bd72aa)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-dotenv/python-dotenv.hash | 4 ++--
 package/python-dotenv/python-dotenv.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dotenv/python-dotenv.hash b/package/python-dotenv/python-dotenv.hash
index c591dcf9b9..5b4be41206 100644
--- a/package/python-dotenv/python-dotenv.hash
+++ b/package/python-dotenv/python-dotenv.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dotenv/json
-md5  9bdf50416b1c59832d2f77ad6afdf0d8  python_dotenv-1.1.0.tar.gz
-sha256  41f90bc6f5f177fb41f53e87666db362025010eb28f60a01c9143bfa33a2b2d5  python_dotenv-1.1.0.tar.gz
+md5  b3e9652d1974f8c7574c43f719799f3a  python_dotenv-1.1.1.tar.gz
+sha256  a8a6399716257f45be6a007360200409fce5cda2661e3dec71d23dc15f6189ab  python_dotenv-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  80619b7049f08c81683ad0e01f08f257a840652dd71ee83146d36658c7d2c2b9  LICENSE
diff --git a/package/python-dotenv/python-dotenv.mk b/package/python-dotenv/python-dotenv.mk
index c565a3e681..8f11c5de8d 100644
--- a/package/python-dotenv/python-dotenv.mk
+++ b/package/python-dotenv/python-dotenv.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOTENV_VERSION = 1.1.0
+PYTHON_DOTENV_VERSION = 1.1.1
 PYTHON_DOTENV_SOURCE = python_dotenv-$(PYTHON_DOTENV_VERSION).tar.gz
-PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/88/2c/7bb1416c5620485aa793f2de31d3df393d3686aa8a8506d11e10e13c5baf
+PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/f6/b0/4bc07ccd3572a2f9df7e6782f52b0c6c90dcbb803ac4a167702d7d0dfe1e
 PYTHON_DOTENV_SETUP_TYPE = setuptools
 PYTHON_DOTENV_LICENSE = BSD-3-Clause
 PYTHON_DOTENV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
