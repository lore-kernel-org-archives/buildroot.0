Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4701BC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DAE8849AA;
	Fri, 28 Feb 2025 16:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xXvzw9KwFzW; Fri, 28 Feb 2025 16:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0537F84EC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0537F84EC3;
	Fri, 28 Feb 2025 16:56:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09C48711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 011B4471B5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRzoCxvt5JdM for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E24EE42553
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E24EE42553
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D792F87A8B; Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jan 2025 12:22:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0ab41ed0f1f289a96a5900b9e075599aa73b0e96
X-Git-Newrev: e0e55920eda4c5830aa3bd5e90a2936b36745192
X-Patchwork-Hint: ignore
Message-Id: <20250228163007.D792F87A8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-typepy: bump to
 version 1.3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0e55920eda4c5830aa3bd5e90a2936b36745192
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add new host-python-setuptools-scm build dependency.

License hash changed due to year update:
https://github.com/thombashi/typepy/commit/974f6c5665c4ff0ee9f030e5d2e89b07bcea2073

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-typepy/python-typepy.hash | 6 +++---
 package/python-typepy/python-typepy.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-typepy/python-typepy.hash b/package/python-typepy/python-typepy.hash
index 0b73f9f4df..5cf3daded9 100644
--- a/package/python-typepy/python-typepy.hash
+++ b/package/python-typepy/python-typepy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typepy/json
-md5  2637fdf609b8a7b9b8ec722852efc706  typepy-1.3.2.tar.gz
-sha256  b69fd48b9f50cdb3809906eef36b855b3134ff66c8893a4f8580abddb0b39517  typepy-1.3.2.tar.gz
+md5  f7ba433b3ea79aa36699be634b36aef1  typepy-1.3.4.tar.gz
+sha256  89c1f66de6c6133209c43a94d23431d320ba03ef5db18f241091ea594035d9de  typepy-1.3.4.tar.gz
 # Locally computed sha256 checksums
-sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
+sha256  4434f353a12dd0236a99e5d3fd07fe3b3a453f9164fe10c57a11d6ca86b50c08  LICENSE
diff --git a/package/python-typepy/python-typepy.mk b/package/python-typepy/python-typepy.mk
index cd67d4e888..03760f1d5f 100644
--- a/package/python-typepy/python-typepy.mk
+++ b/package/python-typepy/python-typepy.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TYPEPY_VERSION = 1.3.2
+PYTHON_TYPEPY_VERSION = 1.3.4
 PYTHON_TYPEPY_SOURCE = typepy-$(PYTHON_TYPEPY_VERSION).tar.gz
-PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/cc/86/9672794fb1c87a17b839666976ed4c8cb779ce05d471bed3166a39a53c4d
+PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/79/59/4c39942077d7de285f762a91024dbda731be693591732977358f77d120fb
 PYTHON_TYPEPY_SETUP_TYPE = setuptools
 PYTHON_TYPEPY_LICENSE = MIT
 PYTHON_TYPEPY_LICENSE_FILES = LICENSE
+PYTHON_TYPEPY_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
