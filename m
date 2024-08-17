Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF149C52D7F
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 09:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 006EA409F1;
	Sat, 17 Aug 2024 09:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6aHQ8-rEjoJ; Sat, 17 Aug 2024 09:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4886940747
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4886940747;
	Sat, 17 Aug 2024 09:58:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D8EA1BF3FB
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 09:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A91E81E91
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 09:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CfAzHnGHdeX for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 09:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D1D580EFE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D1D580EFE
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 09:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 911E185E8F; Sat, 17 Aug 2024 09:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 Aug 2024 11:40:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c9e2ddf5ed8dc0d63ce84ba028f614dafbf9fc41
X-Git-Newrev: bdb38723ad832dd1c28b028a0f48a938f6d20c7a
X-Patchwork-Hint: ignore
Message-Id: <20240817095845.911E185E8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-starlette: bump
 to 0.38.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdb38723ad832dd1c28b028a0f48a938f6d20c7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
* https://github.com/encode/starlette/releases/tag/0.38.0
* https://github.com/encode/starlette/releases/tag/0.38.1
* https://github.com/encode/starlette/releases/tag/0.38.2

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index f04aaea7c0..eca8cb8fd1 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  b0ba8178dd4bf2cdff53c8702212be52  starlette-0.37.2.tar.gz
-sha256  9af890290133b79fc3db55474ade20f6220a364a0402e0b556e7cd5e1e093823  starlette-0.37.2.tar.gz
+md5  c56bd58a7ed1320677cff4b1055dff18  starlette-0.38.2.tar.gz
+sha256  c7c0441065252160993a1a37cf2a73bb64d271b17303e0b0c1eb7191cfb12d75  starlette-0.38.2.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index af2c2d4ac7..bf38b1375b 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.37.2
+PYTHON_STARLETTE_VERSION = 0.38.2
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/61/b5/6bceb93ff20bd7ca36e6f7c540581abb18f53130fabb30ba526e26fd819b
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/43/e2/d49a94ecb665b3a1c34b40c78165a737abc384fcabc843ccb14a3bd3dc37
 PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
