Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2614EC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7C5A4027A;
	Sun, 30 Oct 2022 20:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7C5A4027A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2xksueVX769m; Sun, 30 Oct 2022 20:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BC0040248;
	Sun, 30 Oct 2022 20:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BC0040248
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA171BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A99D4025A
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A99D4025A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZR3AW9KXNNhU for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:25:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E577740248
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E577740248
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D30E48764C; Sun, 30 Oct 2022 20:25:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 21:22:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 626c5bedaa7e1461dd3747562b9c04dd40713c83
X-Git-Newrev: 31e5453c06146233453d35121089d26606c25341
X-Patchwork-Hint: ignore
Message-Id: <20221030202515.D30E48764C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hatch-fancy-pypi-readme:
 new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=31e5453c06146233453d35121089d26606c25341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                                |  1 +
 .../python-hatch-fancy-pypi-readme.hash                   |  5 +++++
 .../python-hatch-fancy-pypi-readme.mk                     | 15 +++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1a38b329c3..02211b7bf4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1386,6 +1386,7 @@ F:	package/python-fonttools/
 F:	package/python-frozenlist/
 F:	package/python-greenlet/
 F:	package/python-hatchling/
+F:	package/python-hatch-fancy-pypi-readme/
 F:	package/python-installer/
 F:	package/python-janus/
 F:	package/python-logstash/
diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
new file mode 100644
index 0000000000..1b287072b7
--- /dev/null
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/hatch_fancy_pypi_readme/json
+md5  588776ea8e3608714d4cbba16dffa92b  hatch_fancy_pypi_readme-22.8.0.tar.gz
+sha256  da91282ca09601c18aded8e378daf8b578c70214866f0971156ee9bb9ce6c26a  hatch_fancy_pypi_readme-22.8.0.tar.gz
+# Locally computed sha256 checksums
+sha256  e69ea57f96e599e617f61af3e85bf326b87e833994709fb5e5908a81197730a2  LICENSE.txt
diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
new file mode 100644
index 0000000000..f28721181a
--- /dev/null
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-hatch-fancy-pypi-readme
+#
+################################################################################
+
+PYTHON_HATCH_FANCY_PYPI_README_VERSION = 22.8.0
+PYTHON_HATCH_FANCY_PYPI_README_SOURCE = hatch_fancy_pypi_readme-$(PYTHON_HATCH_FANCY_PYPI_README_VERSION).tar.gz
+PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/4e/ab/9b48589d6e3a2f72cc1e8f5221c28ff28fcdf116dbbd6e9beb946054212d
+PYTHON_HATCH_FANCY_PYPI_README_LICENSE = MIT
+PYTHON_HATCH_FANCY_PYPI_README_LICENSE_FILES = LICENSE.txt
+PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = pep517
+HOST_PYTHON_HATCH_FANCY_PYPI_README_DEPENDENCIES = host-python-hatchling
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
