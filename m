Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47F4C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7297381FBF;
	Tue,  2 Jul 2024 06:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3pgoXJh7_9Se; Tue,  2 Jul 2024 06:58:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF8B81FD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CF8B81FD6;
	Tue,  2 Jul 2024 06:58:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C67A1BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2560A81EF6
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzsVvmIAhHVR for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74AE781F65
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74AE781F65
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:57:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FD54838E1; Tue,  2 Jul 2024 06:57:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 08:53:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a397edda4222e382c4899c09cb4945c17dcd1c72
X-Git-Newrev: b640482ace5727f08bad2459778c47a277a3943b
X-Patchwork-Hint: ignore
Message-Id: <20240702065757.5FD54838E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiofiles: bump to version
 24.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b640482ace5727f08bad2459778c47a277a3943b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-aiofiles/python-aiofiles.hash | 4 ++--
 package/python-aiofiles/python-aiofiles.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
index 3dc9281de7..f68b0b55b5 100644
--- a/package/python-aiofiles/python-aiofiles.hash
+++ b/package/python-aiofiles/python-aiofiles.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiofiles/json
-md5  ab5dfab3180f56a21b46e1e90b16c6e6  aiofiles-23.2.1.tar.gz
-sha256  84ec2218d8419404abcb9f0c02df3f34c6e0a68ed41072acfb1cef5cbc29051a  aiofiles-23.2.1.tar.gz
+md5  530273426ff7ee50283e52186e185c81  aiofiles-24.1.0.tar.gz
+sha256  22a075c9e5a3810f0c2e48f3008c94d68c65d763b9b03857924c99e57355166c  aiofiles-24.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index 954647bf76..9eae73d3c1 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOFILES_VERSION = 23.2.1
+PYTHON_AIOFILES_VERSION = 24.1.0
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
-PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/af/41/cfed10bc64d774f497a86e5ede9248e1d062db675504b41c320954d99641
+PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/0b/03/a88171e277e8caa88a4c77808c20ebb04ba74cc4681bf1e9416c862de237
 PYTHON_AIOFILES_SETUP_TYPE = pep517
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
