Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB43C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7064E60E8C;
	Mon,  4 Apr 2022 19:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJz2CngWRlwF; Mon,  4 Apr 2022 19:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8850160BEF;
	Mon,  4 Apr 2022 19:47:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7470E1BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E57440201
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wlM2U3ccFxUz for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:46:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9428D40569
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:46:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0096182980; Mon,  4 Apr 2022 19:37:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:43:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 441bd6c4691bb514e157a1416ce926432086b1ab
X-Git-Newrev: 968450adfdf1042ddcd8a0ab157dd9747ec6ee8b
X-Patchwork-Hint: ignore
Message-Id: <20220404193733.0096182980@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-snappy: bump version to
 0.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=968450adfdf1042ddcd8a0ab157dd9747ec6ee8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required by python-crossbar and python-autobahn[compress].

Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-snappy/python-snappy.hash | 6 +++---
 package/python-snappy/python-snappy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-snappy/python-snappy.hash b/package/python-snappy/python-snappy.hash
index 1e0f96054f..c4dbc72077 100644
--- a/package/python-snappy/python-snappy.hash
+++ b/package/python-snappy/python-snappy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-snappy/json
-md5	82e09ffd44204096fc70d6de14d0ea2f  python-snappy-0.5.4.tar.gz
-sha256	d9c26532cfa510f45e8d135cde140e8a5603d3fb254cfec273ebc0ecf9f668e2  python-snappy-0.5.4.tar.gz
+md5  fc84cfa3526fba06d66f0d0b2e764300  python-snappy-0.6.1.tar.gz
+sha256  b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb808bb2a  python-snappy-0.6.1.tar.gz
 # Locally computed sha256 checksums
-sha256	d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a  LICENSE
+sha256  d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a  LICENSE
diff --git a/package/python-snappy/python-snappy.mk b/package/python-snappy/python-snappy.mk
index d087c83b10..e80aa861df 100644
--- a/package/python-snappy/python-snappy.mk
+++ b/package/python-snappy/python-snappy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SNAPPY_VERSION = 0.5.4
-PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/45/35/65d9f8cc537129894b4b32647d80212d1fa342877581c5b8a69872cea8be
+PYTHON_SNAPPY_VERSION = 0.6.1
+PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
 PYTHON_SNAPPY_SETUP_TYPE = setuptools
 PYTHON_SNAPPY_LICENSE = BSD-3-Clause
 PYTHON_SNAPPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
