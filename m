Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2323C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A601D820C4;
	Tue,  2 Jul 2024 07:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a78RvFLXbXWJ; Tue,  2 Jul 2024 07:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C3548206E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C3548206E;
	Tue,  2 Jul 2024 07:06:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3662F1BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C189281FBB
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6aT5ir-G-RvF for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C40F81FC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C40F81FC7
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86F478397A; Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 09:02:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33de60dbff80e44062ba57aea2489cf4dbd26d02
X-Git-Newrev: b411dc60181c50d0ac2d9eb506a8fd5bd1a4ac4f
X-Patchwork-Hint: ignore
Message-Id: <20240702070531.86F478397A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-starlette: bump to version
 0.37.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b411dc60181c50d0ac2d9eb506a8fd5bd1a4ac4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 03d77cf5be..f04aaea7c0 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  0a1e026d653dc448ae07f47eefe1dc8b  starlette-0.36.3.tar.gz
-sha256  90a671733cfb35771d8cc605e0b679d23b992f8dcfad48cc60b38cb29aeb7080  starlette-0.36.3.tar.gz
+md5  b0ba8178dd4bf2cdff53c8702212be52  starlette-0.37.2.tar.gz
+sha256  9af890290133b79fc3db55474ade20f6220a364a0402e0b556e7cd5e1e093823  starlette-0.37.2.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 9d137f5f5a..af2c2d4ac7 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.36.3
+PYTHON_STARLETTE_VERSION = 0.37.2
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/be/47/1bba49d42d63f4453f0a64a20acbf2d0bd2f5a8cde6a166ee66c074a08f8
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/61/b5/6bceb93ff20bd7ca36e6f7c540581abb18f53130fabb30ba526e26fd819b
 PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
