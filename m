Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A586CCD195
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 07:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E14584066;
	Wed, 15 Oct 2025 07:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDOdZA-Qit3v; Wed, 15 Oct 2025 07:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD1A58406B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD1A58406B;
	Wed, 15 Oct 2025 07:17:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C97611BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB71A41468
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhjmOQQur259 for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 07:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E168B40860
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E168B40860
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:16:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF1B887110; Wed, 15 Oct 2025 07:16:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 08:49:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6ef3ac5e3713fd3a491a263c57b34968f1137bd
X-Git-Newrev: 9ee27919c52853424efeffd17cd1855ee7b6c94f
X-Patchwork-Hint: ignore
Message-Id: <20251015071659.DF1B887110@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xmltodict: bump version to
 1.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ee27919c52853424efeffd17cd1855ee7b6c94f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-xmltodict/python-xmltodict.hash | 4 ++--
 package/python-xmltodict/python-xmltodict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xmltodict/python-xmltodict.hash b/package/python-xmltodict/python-xmltodict.hash
index 9bd8ec6878..a61b1aabf1 100644
--- a/package/python-xmltodict/python-xmltodict.hash
+++ b/package/python-xmltodict/python-xmltodict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xmltodict/json
-md5  6e0d94bf858b3c2ff3daeed487eedc2a  xmltodict-0.14.2.tar.gz
-sha256  201e7c28bb210e374999d1dde6382923ab0ed1a8a5faeece48ab525b7810a553  xmltodict-0.14.2.tar.gz
+md5  82d8cb5a934a057e6a8a3449b1d87cce  xmltodict-1.0.2.tar.gz
+sha256  54306780b7c2175a3967cad1db92f218207e5bc1aba697d887807c0fb68b7649  xmltodict-1.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
diff --git a/package/python-xmltodict/python-xmltodict.mk b/package/python-xmltodict/python-xmltodict.mk
index 1a041e05d4..fe320dd799 100644
--- a/package/python-xmltodict/python-xmltodict.mk
+++ b/package/python-xmltodict/python-xmltodict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XMLTODICT_VERSION = 0.14.2
+PYTHON_XMLTODICT_VERSION = 1.0.2
 PYTHON_XMLTODICT_SOURCE = xmltodict-$(PYTHON_XMLTODICT_VERSION).tar.gz
-PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/50/05/51dcca9a9bf5e1bce52582683ce50980bcadbc4fa5143b9f2b19ab99958f
+PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/6a/aa/917ceeed4dbb80d2f04dbd0c784b7ee7bba8ae5a54837ef0e5e062cd3cfb
 PYTHON_XMLTODICT_SETUP_TYPE = setuptools
 PYTHON_XMLTODICT_LICENSE = MIT
 PYTHON_XMLTODICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
