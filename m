Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC811C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94A5482053;
	Tue,  2 Jul 2024 07:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CgURKKavdtyZ; Tue,  2 Jul 2024 07:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 007C68208E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 007C68208E;
	Tue,  2 Jul 2024 07:05:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 661771BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7948481FC2
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCtiNA5ShCWg for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6735081F8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6735081F8B
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C0CE8397A; Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 08:59:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 628bc633f3457520d044b0c5487f694ae834538b
X-Git-Newrev: a75dd97fd815f4060c1421cdbe07dacd2dfb4fd5
X-Patchwork-Hint: ignore
Message-Id: <20240702070531.4C0CE8397A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-annotated-types: bump to
 version 0.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a75dd97fd815f4060c1421cdbe07dacd2dfb4fd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-annotated-types/python-annotated-types.hash | 4 ++--
 package/python-annotated-types/python-annotated-types.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-annotated-types/python-annotated-types.hash b/package/python-annotated-types/python-annotated-types.hash
index 1663bcb51f..fc92476eda 100644
--- a/package/python-annotated-types/python-annotated-types.hash
+++ b/package/python-annotated-types/python-annotated-types.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/annotated-types/json
-md5  5fe2125b08851f0d05a8efad6456861c  annotated_types-0.6.0.tar.gz
-sha256  563339e807e53ffd9c267e99fc6d9ea23eb8443c08f112651963e24e22f84a5d  annotated_types-0.6.0.tar.gz
+md5  5c943b7c51b0b7dcadf46da4a99c84a1  annotated_types-0.7.0.tar.gz
+sha256  aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89  annotated_types-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fe1049884b1a0d9342901e88e07f32925d24b3121d9972b6a6805fb9824b095d  LICENSE
diff --git a/package/python-annotated-types/python-annotated-types.mk b/package/python-annotated-types/python-annotated-types.mk
index 8bc617069d..e7a3b7e64b 100644
--- a/package/python-annotated-types/python-annotated-types.mk
+++ b/package/python-annotated-types/python-annotated-types.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANNOTATED_TYPES_VERSION = 0.6.0
+PYTHON_ANNOTATED_TYPES_VERSION = 0.7.0
 PYTHON_ANNOTATED_TYPES_SOURCE = annotated_types-$(PYTHON_ANNOTATED_TYPES_VERSION).tar.gz
-PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/67/fe/8c7b275824c6d2cd17c93ee85d0ee81c090285b6d52f4876ccc47cf9c3c4
+PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5
 PYTHON_ANNOTATED_TYPES_SETUP_TYPE = pep517
 PYTHON_ANNOTATED_TYPES_LICENSE = MIT
 PYTHON_ANNOTATED_TYPES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
