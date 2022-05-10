Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC4DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58B7E82468;
	Tue, 10 May 2022 19:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F5aY1OVdHpuI; Tue, 10 May 2022 19:39:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BF1981451;
	Tue, 10 May 2022 19:39:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B79F1BF32E
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B1A141794
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qsDJcTeWcuq7 for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:38:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D24F4179A
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5880685CF9; Tue, 10 May 2022 19:27:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 21:37:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 787b580af42bcf09aa45162abec23b1e35069ed8
X-Git-Newrev: ddeff3b273496627ebada3337b736c9e983f59d5
X-Patchwork-Hint: ignore
Message-Id: <20220510192737.5880685CF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-async-lru: bump to version
 1.0.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ddeff3b273496627ebada3337b736c9e983f59d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-async-lru/python-async-lru.hash | 8 ++++----
 package/python-async-lru/python-async-lru.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-async-lru/python-async-lru.hash b/package/python-async-lru/python-async-lru.hash
index 6fa61e0e12..231af32baa 100644
--- a/package/python-async-lru/python-async-lru.hash
+++ b/package/python-async-lru/python-async-lru.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/async_lru/json
-md5	69bed62927426353513e68aec77989ab  async_lru-1.0.2.tar.gz
-sha256	baa898027619f5cc31b7966f96f00e4fc0df43ba206a8940a5d1af5336a477cb  async_lru-1.0.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/async-lru/json
+md5  4dfcb328f2e9a8fdc9cf78dfdb6d3eef  async-lru-1.0.3.tar.gz
+sha256  c2cb9b2915eb14e6cf3e717154b40f715bf90e596d73623677affd0d1fbcd32a  async-lru-1.0.3.tar.gz
 # Locally computed sha256 checksums
-sha256	ea65975679bc2093be925d520358e41096bd96fddedee3e929160a5faadcf573  LICENSE
+sha256  ea65975679bc2093be925d520358e41096bd96fddedee3e929160a5faadcf573  LICENSE
diff --git a/package/python-async-lru/python-async-lru.mk b/package/python-async-lru/python-async-lru.mk
index adaa8f628d..872540b713 100644
--- a/package/python-async-lru/python-async-lru.mk
+++ b/package/python-async-lru/python-async-lru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_LRU_VERSION = 1.0.2
-PYTHON_ASYNC_LRU_SOURCE = async_lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
-PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/7e/c1/a3d6207deaaeb582d16dc9a0fd217f192efc9487ce59897131cf9a2bdc1c
+PYTHON_ASYNC_LRU_VERSION = 1.0.3
+PYTHON_ASYNC_LRU_SOURCE = async-lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
+PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/fe/67/4cb179c14ffa8b4a35fbe02255744bee4cbbaf61b35612c96ba4a618e4d5
 PYTHON_ASYNC_LRU_SETUP_TYPE = setuptools
 PYTHON_ASYNC_LRU_LICENSE = MIT
 PYTHON_ASYNC_LRU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
