Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D8CC3ABAF
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C647584A0D;
	Sun, 15 Sep 2024 21:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJ_uCp4a-zJ5; Sun, 15 Sep 2024 21:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F0E484A14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F0E484A14;
	Sun, 15 Sep 2024 21:43:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F0211BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B45F608A2
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DS1efDCCmlbv for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81829608AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81829608AE
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CE4E83682; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:32:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf0fcb8033750896746136f3d576d67ecdca0081
X-Git-Newrev: d3b47b49d3df2ed8184f98638ab486a9dc05ea3f
X-Patchwork-Hint: ignore
Message-Id: <20240915213640.7CE4E83682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gunicorn: bump to version
 23.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3b47b49d3df2ed8184f98638ab486a9dc05ea3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/benoitc/gunicorn/commit/5b68c17b170c7b021a7a982a06c08e3898a5a640

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gunicorn/python-gunicorn.hash | 6 +++---
 package/python-gunicorn/python-gunicorn.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-gunicorn/python-gunicorn.hash b/package/python-gunicorn/python-gunicorn.hash
index bd4dc1b3ca..5639697c51 100644
--- a/package/python-gunicorn/python-gunicorn.hash
+++ b/package/python-gunicorn/python-gunicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gunicorn/json
-md5  cb41319d6929842c5af7003d48c513a2  gunicorn-21.2.0.tar.gz
-sha256  88ec8bff1d634f98e61b9f65bc4bf3cd918a90806c6f5c48bc5603849ec81033  gunicorn-21.2.0.tar.gz
+md5  18b666db62a890579170639961c5b064  gunicorn-23.0.0.tar.gz
+sha256  f014447a0101dc57e294f6c18ca6b40227a4c90e9bdb586042628030cba004ec  gunicorn-23.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  fc71b8f2ce774a47090c106ac5d1145359f5c0e25a0d9ab42acacd230f596936  LICENSE
+sha256  6646cdbba2e99e3421dd18c22173579a1fde347e831dae6adee80eefe331e951  LICENSE
diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
index effa93e5ef..8e3b87fd51 100644
--- a/package/python-gunicorn/python-gunicorn.mk
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GUNICORN_VERSION = 21.2.0
+PYTHON_GUNICORN_VERSION = 23.0.0
 PYTHON_GUNICORN_SOURCE = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
-PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/06/89/acd9879fa6a5309b4bf16a5a8855f1e58f26d38e0c18ede9b3a70996b021
+PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/34/72/9614c465dc206155d93eff0ca20d42e1e35afc533971379482de953521a4
 PYTHON_GUNICORN_SETUP_TYPE = setuptools
 PYTHON_GUNICORN_LICENSE = MIT
 PYTHON_GUNICORN_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
