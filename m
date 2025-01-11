Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4A9C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DA146FC69;
	Fri, 28 Feb 2025 16:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hntObbKKv3KF; Fri, 28 Feb 2025 16:53:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4904870375
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4904870375;
	Fri, 28 Feb 2025 16:53:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F2A4711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19D8342FBE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ds7L6mSJX9ld for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBCE242D12
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBCE242D12
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C40DE87C71; Fri, 28 Feb 2025 16:30:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 17:02:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3eef6d14b55ae03e06952914d0d1204e47572319
X-Git-Newrev: b27de188f78b467ea06ab431393e4bcc9bac93c3
X-Patchwork-Hint: ignore
Message-Id: <20250228163002.C40DE87C71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-anyio: bump to
 version 4.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b27de188f78b467ea06ab431393e4bcc9bac93c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index 6896b7d516..4ff6955ae5 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  6d0431fec06206d2bdbf57d449f1616b  anyio-4.7.0.tar.gz
-sha256  2f834749c602966b7d456a7567cafcb309f96482b5081d14ac93ccd457f9dd48  anyio-4.7.0.tar.gz
+md5  ad00874069a6685b2e3e84c5a2e045cb  anyio-4.8.0.tar.gz
+sha256  1d9fe889df5212298c0c0723fa20479d1b94883a2df44bd3897aa91083316f7a  anyio-4.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 8c814abfdd..4f38e12794 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.7.0
+PYTHON_ANYIO_VERSION = 4.8.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/f6/40/318e58f669b1a9e00f5c4453910682e2d9dd594334539c7b7817dabb765f
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/a3/73/199a98fc2dae33535d6b8e8e6ec01f8c1d76c9adb096c6b7d64823038cde
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
