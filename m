Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCD3EB64DF
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 20:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DB34405B9;
	Sat,  7 Sep 2024 20:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Js1KaNmIsyVc; Sat,  7 Sep 2024 20:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33040405CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33040405CB;
	Sat,  7 Sep 2024 20:04:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F7E71BF3EC
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C9FA4046C
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d86HAbzPoV5Z for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 20:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD3E040432
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD3E040432
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 20:03:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C541286F3C; Sat,  7 Sep 2024 20:03:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Sep 2024 21:46:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a87abcf6da65f3e6aa257aaab58a24eec32a5903
X-Git-Newrev: 04eab07b0843e7a780fe78900d4865f4e9f33ea4
X-Patchwork-Hint: ignore
Message-Id: <20240907200356.C541286F3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asyncssh: bump to version
 2.17.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=04eab07b0843e7a780fe78900d4865f4e9f33ea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-asyncssh/python-asyncssh.hash | 4 ++--
 package/python-asyncssh/python-asyncssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
index f74cbe9c83..6550b850ba 100644
--- a/package/python-asyncssh/python-asyncssh.hash
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/asyncssh/json
-md5  3b22a39fa9d638b277c9441187b73c5c  asyncssh-2.14.2.tar.gz
-sha256  e956bf8988d07a06ba3305f6604e261f4ca014c4a232f0873f1c7692fbe3cfc2  asyncssh-2.14.2.tar.gz
+md5  baadd6f26ddf3164ae5ae3c09a6b4e18  asyncssh-2.17.0.tar.gz
+sha256  3b159c105aa388c1e2245c4faf483f540ada8cad99402281119100166e5edb3c  asyncssh-2.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
 sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 1f6b9d79a2..b286fc42b2 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCSSH_VERSION = 2.14.2
+PYTHON_ASYNCSSH_VERSION = 2.17.0
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/6c/f9/849f158fe50cdb0b1bf75009861865c9a30c3b5a0d62ad43bb5e00b10feb
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/32/34/007ba4c65dc15ad394ff50d6ce272bcc028a8824ab1658c5fe5c480be515
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
