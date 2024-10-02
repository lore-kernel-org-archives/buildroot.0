Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CC3CF8542
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0E4A41411;
	Wed,  2 Oct 2024 21:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgroowJkcHTE; Wed,  2 Oct 2024 21:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50C7E413FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50C7E413FF;
	Wed,  2 Oct 2024 21:02:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF0041BF30E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB468411B3
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhQtiFt6Ydnd for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6499D41167
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6499D41167
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:02:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 504D884A19; Wed,  2 Oct 2024 21:02:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 23:01:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74a2dbb8900334641108cb89a190adbce36c75ab
X-Git-Newrev: 959bd345a5872486986d62d2b64be5f5ab3c2cf1
X-Patchwork-Hint: ignore
Message-Id: <20241002210218.504D884A19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump to version
 1.35.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=959bd345a5872486986d62d2b64be5f5ab3c2cf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 5b7c1cdba3..747c38967f 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  b344337be1e7925cbc32940567432e5c  boto3-1.35.19.tar.gz
-sha256  9979fe674780a0b7100eae9156d74ee374cd1638a9f61c77277e3ce712f3e496  boto3-1.35.19.tar.gz
+md5  8856feaba5930bea34efe6ab74b185cb  boto3-1.35.27.tar.gz
+sha256  10d0fe15670b83a3f26572ab20d9152a064cee4c54b5ea9a1eeb1f0c3b807a7b  boto3-1.35.27.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 1584c81971..95a3fbe602 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.35.19
+PYTHON_BOTO3_VERSION = 1.35.27
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/80/85/d4119201c65b56a2bcc8dc328db98cd1c769a2376aea1613a6f5e8f2a88b
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/01/0b/068d62d2ace3f34a5771c37817c55de2ee74f73c696d4c815b271b66cf12
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
