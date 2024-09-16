Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF49C3ABCE
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1697C61154;
	Mon, 16 Sep 2024 10:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46erBwF8conV; Mon, 16 Sep 2024 10:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C41276117C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C41276117C;
	Mon, 16 Sep 2024 10:02:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5634B1BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3208F80B8C
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeOtrp9Wf12h for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B7E880B9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B7E880B9E
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34A7D80125; Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 11:54:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9c7e7c343a332ada777f22960899669e5a6e949
X-Git-Newrev: dfa741945b51f79c55b70926ed613a7e393910f2
X-Patchwork-Hint: ignore
Message-Id: <20240916100147.34A7D80125@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ml-dtypes: bump to version
 0.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfa741945b51f79c55b70926ed613a7e393910f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-ml-dtypes/python-ml-dtypes.hash | 4 ++--
 package/python-ml-dtypes/python-ml-dtypes.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ml-dtypes/python-ml-dtypes.hash b/package/python-ml-dtypes/python-ml-dtypes.hash
index 53bfacb528..e11ae88abf 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.hash
+++ b/package/python-ml-dtypes/python-ml-dtypes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ml_dtypes/json
-md5  438c04dc0d941ec1b3b71667225c74c8  ml_dtypes-0.3.2.tar.gz
-sha256  533059bc5f1764fac071ef54598db358c167c51a718f68f5bb55e3dee79d2967  ml_dtypes-0.3.2.tar.gz
+md5  0d4d585a69dc36ce685c487c99fcc59a  ml_dtypes-0.5.0.tar.gz
+sha256  3e7d3a380fe73a63c884f06136f8baa7a5249cc8e9fdec677997dd78549f8128  ml_dtypes-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk b/package/python-ml-dtypes/python-ml-dtypes.mk
index 8097265078..060fe555c5 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.mk
+++ b/package/python-ml-dtypes/python-ml-dtypes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ML_DTYPES_VERSION = 0.3.2
+PYTHON_ML_DTYPES_VERSION = 0.5.0
 PYTHON_ML_DTYPES_SOURCE = ml_dtypes-$(PYTHON_ML_DTYPES_VERSION).tar.gz
-PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/39/7d/8d85fcba868758b3a546e6914e727abd8f29ea6918079f816975c9eecd63
+PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/ab/79/717c5e22ad25d63ce3acdfe8ff8d64bdedec18914256c59b838218708b16
 PYTHON_ML_DTYPES_LICENSE = Apache-2.0
 PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
 PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
