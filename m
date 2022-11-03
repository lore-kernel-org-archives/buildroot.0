Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA143C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7769061057;
	Thu,  3 Nov 2022 20:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7769061057
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wqh5jaypWXD; Thu,  3 Nov 2022 20:58:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F60D61045;
	Thu,  3 Nov 2022 20:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F60D61045
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21FF31BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66F5F40BF5
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66F5F40BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bl7FaKvywEqY for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBCF040BD4
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBCF040BD4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C662F87BCC; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3e9322e0ad4c29fde3eb4e816ce84182bfba593a
X-Git-Newrev: 3b8c9bd4588a717e4977debca8d51c1fcd58e4b5
X-Patchwork-Hint: ignore
Message-Id: <20221103205510.C662F87BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-cheroot: bump
 to version 8.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b8c9bd4588a717e4977debca8d51c1fcd58e4b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to links update:
https://github.com/cherrypy/cheroot/commit/b4b8c11c8b9bc5dae1f9b37861f78b828882e57c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cheroot/python-cheroot.hash | 6 +++---
 package/python-cheroot/python-cheroot.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
index 06d9453163..e538d1fcdc 100644
--- a/package/python-cheroot/python-cheroot.hash
+++ b/package/python-cheroot/python-cheroot.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cheroot/json
-md5  7ace4b584a8092deb9f6b0142a627086  cheroot-8.2.1.tar.gz
-sha256  5b525b3e4a755adf78070ab54c1821fb860d4255a9317dba2b88eb2df2441cff  cheroot-8.2.1.tar.gz
+md5  70247d0948899f453b50e6181cddd0d7  cheroot-8.6.0.tar.gz
+sha256  366adf6e7cac9555486c2d1be6297993022eff6f8c4655c1443268cca3f08e25  cheroot-8.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  da6dc218683f6dab91c6367f00bf33095d980fb1f04d430c81c5e6994b8605e0  LICENSE.md
+sha256  e20feeb491a7e98084f15719349e9857aad41c4503c5e479f8815b063dbf7564  LICENSE.md
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index 9eae887989..95f2e39480 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHEROOT_VERSION = 8.2.1
+PYTHON_CHEROOT_VERSION = 8.6.0
 PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
-PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/9b/4d/2e51e7ce60f54a5279e91648b9b9b497d4d22bc624ecae6af1b6866144a7
+PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/99/c4/9b5ca09208047f2689c24ee63e195aa01ceffb7857d715cabc046559ddd6
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
 PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
