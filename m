Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ABCC71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 20:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15DA7811F0;
	Mon, 16 Jun 2025 20:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3D7dXxq8PGy; Mon, 16 Jun 2025 20:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 158CB811BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 158CB811BC;
	Mon, 16 Jun 2025 20:39:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FFCA151
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36A42811D2
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plxPij8XvVyJ for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 20:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76681811BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76681811BC
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:39:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DF7583C79; Mon, 16 Jun 2025 20:39:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Jun 2025 22:22:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94ca658661c30f0f7d557b3227f5dd40e293bdf4
X-Git-Newrev: 3ca213eadb80875e61bcd9f216842bdca8cf6f98
X-Patchwork-Hint: ignore
Message-Id: <20250616203901.6DF7583C79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic: bump to 2.11.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ca213eadb80875e61bcd9f216842bdca8cf6f98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://docs.pydantic.dev/latest/changelog/#v2117-2025-06-14

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index a97062dd96..8ec2a7789d 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  0b701b2a411c2747bf976d04f27f695b  pydantic-2.11.6.tar.gz
-sha256  12b45cfb4af17e555d3c6283d0b55271865fb0b43cc16dd0d52749dc7abf70e7  pydantic-2.11.6.tar.gz
+md5  0d1c309b8fdead08922e1ed9d86517b0  pydantic-2.11.7.tar.gz
+sha256  d989c3c6cb79469287b1569f7447a17848c998458d49ebe294e975b9baf0f0db  pydantic-2.11.7.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 7b0d96bdf3..e614df6f07 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.11.6
+PYTHON_PYDANTIC_VERSION = 2.11.7
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/ef/8f/9af0f46acc943b8c4592d06523f26a150acf6e6e37e8bd5f0ace925e996d
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/00/dd/4325abf92c39ba8623b5af936ddb36ffcfe0beae70405d456ab1fb2f5b8c
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
