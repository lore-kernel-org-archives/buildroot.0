Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863FDC6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 22:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ED048406D;
	Wed, 22 Mar 2023 22:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ED048406D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NewQMG84T1M6; Wed, 22 Mar 2023 22:45:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68C0B8403F;
	Wed, 22 Mar 2023 22:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68C0B8403F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 200A81BF95F
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C30E812FC
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C30E812FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F9nWF9-rUJ59 for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BD078401E
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BD078401E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C84A8758B; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 23:42:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49c65502439c0f24323906e96652387243879baa
X-Git-Newrev: 1c148c93c9cc69926253ce13f7bfda2a98b4be38
X-Patchwork-Hint: ignore
Message-Id: <20230322224400.8C84A8758B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-beautifulsoup4: bump to
 version 4.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c148c93c9cc69926253ce13f7bfda2a98b4be38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Verified license remains MIT after hash changed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-beautifulsoup4/python-beautifulsoup4.hash | 6 +++---
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
index 4641d2e3a3..1777563190 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/beautifulsoup4/json
-md5  22f22f89cf9da41b22e1ece9639c66a3  beautifulsoup4-4.11.1.tar.gz
-sha256  ad9aa55b65ef2808eb405f46cf74df7fcb7044d5cbc26487f96eb2ef2e436693  beautifulsoup4-4.11.1.tar.gz
+md5  428d2737d94d238b146081c03d3b2b87  beautifulsoup4-4.12.0.tar.gz
+sha256  c5fceeaec29d09c84970e47c65f2f0efe57872f7cff494c9691a26ec0ff13234  beautifulsoup4-4.12.0.tar.gz
 # Locally computed sha256 checksums
-sha256  9e41dab3a48f5c734a9d5446557b28a6616e4924ee51d205598e4416bb93ce25  LICENSE
+sha256  55b4d8d4b1e5bc86d10efac91b74c87bcb77526b0f5b9edaf8b9cd2adc7397b2  LICENSE
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index 78f885ba08..7896dd0f39 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BEAUTIFULSOUP4_VERSION = 4.11.1
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.12.0
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/e8/b0/cd2b968000577ec5ce6c741a54d846dfa402372369b8b6861720aa9ecea7
+PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/c5/4c/b5b7d6e1d4406973fb7f4e5df81c6f07890fa82548ac3b945deed1df9d48
 PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = setuptools
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
