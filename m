Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFF2C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5CD070684;
	Fri, 28 Feb 2025 16:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-GwfQ_JL0cS; Fri, 28 Feb 2025 16:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFE2370686
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFE2370686;
	Fri, 28 Feb 2025 16:56:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F7C968
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3E9942D99
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QpXfk9TlAdb for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD64F42D67
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD64F42D67
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4E7587A8B; Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jan 2025 12:03:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 943d3390c67bc899026c7ddcdc1b0288256bde04
X-Git-Newrev: c6fe2b999797b76a3606fba1cf608e4831a5d8db
X-Patchwork-Hint: ignore
Message-Id: <20250228163006.D4E7587A8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-simplesqlite:
 bump to version 1.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6fe2b999797b76a3606fba1cf608e4831a5d8db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to year update:
https://github.com/thombashi/SimpleSQLite/commit/1f6e12a532cdee1408d6c34e38829b94c08b6cc7

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-simplesqlite/python-simplesqlite.hash | 6 +++---
 package/python-simplesqlite/python-simplesqlite.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-simplesqlite/python-simplesqlite.hash b/package/python-simplesqlite/python-simplesqlite.hash
index 8060437718..a17f20ff97 100644
--- a/package/python-simplesqlite/python-simplesqlite.hash
+++ b/package/python-simplesqlite/python-simplesqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplesqlite/json
-md5  a907352592539345bf8145c3e39015cb  SimpleSQLite-1.5.2.tar.gz
-sha256  f9a25b9e43d7aa28f551d170a42cfae10139c5c81a1bcb8776f857816ef5ae0f  SimpleSQLite-1.5.2.tar.gz
+md5  a80e1e92454eac4c33c684c9f2a7f4a8  simplesqlite-1.5.3.tar.gz
+sha256  b0841881422107fc1bd26f8393e6a114b0fc54dc9bb74282556dd6e055ed06c5  simplesqlite-1.5.3.tar.gz
 # Locally computed sha256 checksums
-sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
+sha256  130a35b917df1951aefbf366120491d5124045a87ded123f20ded21521f4e3a2  LICENSE
diff --git a/package/python-simplesqlite/python-simplesqlite.mk b/package/python-simplesqlite/python-simplesqlite.mk
index d8efe23a6c..81399b9941 100644
--- a/package/python-simplesqlite/python-simplesqlite.mk
+++ b/package/python-simplesqlite/python-simplesqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLESQLITE_VERSION = 1.5.2
-PYTHON_SIMPLESQLITE_SOURCE = SimpleSQLite-$(PYTHON_SIMPLESQLITE_VERSION).tar.gz
-PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/c8/07/92e3291fda6f1bbf6e7ff4721d87566e1615572d9c205ef64398c5d22efe
+PYTHON_SIMPLESQLITE_VERSION = 1.5.3
+PYTHON_SIMPLESQLITE_SOURCE = simplesqlite-$(PYTHON_SIMPLESQLITE_VERSION).tar.gz
+PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/59/a8/c8f4af95618dda725d91a081476036656fbf3660bb6f1728d1a5d088d6cc
 PYTHON_SIMPLESQLITE_SETUP_TYPE = setuptools
 PYTHON_SIMPLESQLITE_LICENSE = MIT
 PYTHON_SIMPLESQLITE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
