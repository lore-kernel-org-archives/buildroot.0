Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A04CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFF85608B4;
	Sat, 21 Sep 2024 21:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Wdus5iMaGmU; Sat, 21 Sep 2024 21:09:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9EE6608A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9EE6608A6;
	Sat, 21 Sep 2024 21:09:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 553471BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A7F2404A8
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0bawiSG7Cwm for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CED2D40492
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CED2D40492
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBE8C84150; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:53:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 904cbaafce9fe93c82e691ad9401f7d3b08d0100
X-Git-Newrev: 9043030707cf2eb24b989c2fb32fa5f11bd394e4
X-Patchwork-Hint: ignore
Message-Id: <20240921210743.CBE8C84150@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-segno: bump to version 1.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9043030707cf2eb24b989c2fb32fa5f11bd394e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to flit build backend.

License hash changed due to year update:
https://github.com/heuer/segno/blob/1.6.1/LICENSE

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-segno/python-segno.hash | 6 +++---
 package/python-segno/python-segno.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-segno/python-segno.hash b/package/python-segno/python-segno.hash
index 58142c184f..a467b663e8 100644
--- a/package/python-segno/python-segno.hash
+++ b/package/python-segno/python-segno.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/segno/json
-md5  b80c19075a7a07cce50b054e9e221cf7  segno-1.6.0.tar.gz
-sha256  8d3b11098ac6dd93161499544dedbfb187d4459088109b8855ff0bbe98105047  segno-1.6.0.tar.gz
+md5  3835036bcf44667eb0a155107ed1ac67  segno-1.6.1.tar.gz
+sha256  f23da78b059251c36e210d0cf5bfb1a9ec1604ae6e9f3d42f9a7c16d306d847e  segno-1.6.1.tar.gz
 # Locally computed sha256 checksums
-sha256  3af9b2f15c736a571978760b2d60598502c205eb6daebe2ec36f0272c380ed28  LICENSE
+sha256  720b7b93e4e80374be9aee88c650a468ae6a6b6471ce4581058dedce23d3cf9d  LICENSE
diff --git a/package/python-segno/python-segno.mk b/package/python-segno/python-segno.mk
index 2c230ee26b..03efcb5c0f 100644
--- a/package/python-segno/python-segno.mk
+++ b/package/python-segno/python-segno.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SEGNO_VERSION = 1.6.0
+PYTHON_SEGNO_VERSION = 1.6.1
 PYTHON_SEGNO_SOURCE = segno-$(PYTHON_SEGNO_VERSION).tar.gz
-PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/51/a8/960844fec8d853a4e8e91f64bdde323ea5a2a44357eca799e7f7f7bf2f1e
-PYTHON_SEGNO_SETUP_TYPE = setuptools
+PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/5d/74/3896e205306a1b43d6b88326e5838572d97b4b74df8c9cd11acfcd9db503
+PYTHON_SEGNO_SETUP_TYPE = flit
 PYTHON_SEGNO_LICENSE = BSD-3-Clause
 PYTHON_SEGNO_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
